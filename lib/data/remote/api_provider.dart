import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_plus/data/local/db/app_database.dart';

// import '../../utils/utils.dart';
import '../../utils/utils.dart';
import '../service_locator.dart';
import '../user_data.dart';
import 'exceptions.dart';

class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider._() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          UserData userData = getInstance();
          if (!options.path.contains("/refresh-token")) {
            var token = await userData.accessToken();
            if (token?.isNotEmpty == true &&
                !options.headers.containsKey(HttpHeaders.authorizationHeader)) {
              try {
                // final tokenState = JwtDecoder.isExpired(token!);
                // if (tokenState) {
                if (true) {
                  final token = await getAccessToken();
                  if (token == null) {
                    return;
                  } else {
                    options.headers.putIfAbsent(
                        HttpHeaders.authorizationHeader, () => 'Bearer $token');
                  }
                } else {
                  options.headers.putIfAbsent(
                      HttpHeaders.authorizationHeader, () => 'Bearer $token');
                }
              } catch (e) {
                debugLog("JwtDecoder.isExpired $e");
              }
            }
          }
          options.headers.putIfAbsent(HttpHeaders.contentTypeHeader,
              () => 'application/json; charset=UTF-8');
          final preferences = await SharedPreferences.getInstance();
          final strLocale = preferences.getString('locale');
          options.headers["Accept-Language"] = strLocale ?? "uz";
          if (kDebugMode) {
            debugLog(
                "----------------------------------------------------------------\n\t\t\tRequest\n\tMethod: ${options.method}\n\tPath: ${options.path}\n\tHeader: ${options.headers}\n${options.data != null ? "\tBody: ${getBodyData(options.data)}\n" : ""}${options.queryParameters.isNotEmpty ? "\tQueryParameters: ${options.queryParameters}\n" : ""}\n----------------------------------------------------------------------");
          }
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          retryCount = 0;
          debugLog(
              "----------------------------------------------------------------\n\t\t\tResponse\n\tMethod: ${response.requestOptions.method}\n\tPath: ${response.requestOptions.path}\n\tStatusCode: ${response.statusCode}\n\tStatusMessage: ${response.statusMessage}\n\tHeader: ${response.requestOptions.headers}\n${response.requestOptions.queryParameters.isNotEmpty ? "\tQueryParameters: ${response.requestOptions.queryParameters}\n" : ""}\n${response.data != null ? "\tBody: ${getBodyData(response.data)}\n" : ""}\n----------------------------------------------------------------------");
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          debugLog("DioException $e");
          debugLog(
              "----------------------------------------------------------------\n\t\t\t\tError\n\tMethod: ${e.requestOptions.method}\n\tPath: ${e.requestOptions.path}\n\tStatusCode: ${e.response?.statusCode}\n\tStatusMessage: ${e.response?.statusMessage}\n\tHeader: ${e.requestOptions.headers}\n${e.requestOptions.data != null ? "\tBody: ${getBodyData(e.requestOptions.data)}\n" : ""}\n${e.requestOptions.queryParameters.isNotEmpty ? "\tQueryParameters: ${e.requestOptions.queryParameters}\n" : ""}\n\tResponse body: ${e.response?.data}\n----------------------------------------------------------------------");
          if (e.response?.statusCode == HttpStatus.unauthorized) {
            return handler.next(e);
          } else {
            return handler.next(e);
          }
        },
      ),
    );
  }

  // Attention!!!
  // Don't use create or default constructor. Use getInstance() method to get ApiProvider object
  factory ApiProvider.create() => ApiProvider._();

  static const baseUrl = 'https://dev-mobile.soliq.uz/my3-api/general-api';

  var retryCount = 0;

  String getBodyData(dynamic data) {
    try {
      if (data is FormData) {
        return data.fields.toString();
      }
      return jsonEncode(data);
    } catch (e) {
      return data;
    }
  }

  void errorHandler(DioError dioError, BuildContext context) {
    Response<dynamic>? response = dioError.response;
    // if (dioError.requestOptions.path.contains(payzeUrl)) return;
    // if (dioError.message == null) return;
    // if (dioError.message?.contains("The request connection took") == true) {
    //   return;
    // }
    if (response == null) {
      // context.read<MainBloc>().add(MainToastErrorEvent("${dioError.message}"));
    } else {
      // if (response.statusCode == null) return;
      switch (response.statusCode) {
        case 404:
        case 400:
          var title = "";
          try {
            // title = GeneralError.fromJson(response.data).message?.toString() ??
            //     "ev113".tr();
          } catch (e) {
            debugLog("response model error $e");
            if (response.data == null) return;
            title = response.data.toString();
          }
          // context.read<MainBloc>().add(MainDialogErrorEvent(title.toString()));
          break;
        case 403:
          if (response.data != null) {
            // context
            //     .read<MainBloc>()
            //     .add(MainSnackBarErrorEvent(response.data.toString()));
          }
          break;
        case 502:
          break;
        default:
          var title = response.data.toString().toLowerCase().contains('error')
              ? "ev113".tr()
              : response.data;
          if (title != null) {
            // context
            //     .read<MainBloc>()
            //     .add(MainDialogErrorEvent(title.toString()));
          }
      }
    }
  }

  bool _isRefreshing = false;
  Queue<Completer<String>> _tokenRefreshQueue = Queue();

  Future<String?> getAccessToken() async {
    String? accessToken;
    if (_isRefreshing) {
      Completer<String> completer = Completer();
      _tokenRefreshQueue.add(completer);
      return completer.future;
    }
    _isRefreshing = true;
    try {
      String newToken = await refreshToken();
      accessToken = newToken;
      while (_tokenRefreshQueue.isNotEmpty) {
        _tokenRefreshQueue.removeFirst().complete(newToken);
      }
    } catch (error) {
      // final context = MyApp.navigatorKey.currentContext;
      // context?.read<MainBloc>().add(LogoutEvent());
      while (_tokenRefreshQueue.isNotEmpty) {
        _tokenRefreshQueue.removeFirst().completeError(error);
      }
    } finally {
      _isRefreshing = false;
    }
    return accessToken;
  }

  Future refreshToken() async {
    var res;
    // try {
    //   var url = '$realHost/user/login/refresh/';
    //   Map<String, dynamic> body = {};
    //   UserData userData = getInstance();
    //   body["refresh"] = await userData.refreshToken();
    //   final response = await _dio.post(url, data: jsonEncode(body));
    //   final successResponse = RefreshTokenResponse.fromJson(response.data);
    //   if (successResponse.access != null) {
    //     UserData userData = getInstance();
    //     await userData.saveAccessToken(
    //       successResponse.access!,
    //     );
    //     if (successResponse.refresh != null) {
    //       await userData.saveAccessToken(
    //         successResponse.refresh!,
    //       );
    //     }
    //     res = successResponse.access;
    //   }
    // } on FetchDataException {
    //   throw FetchDataException("No Internet connection");
    // }
    return res;
  }

  Future<List<RegionTableData>> getRegions() async {
    try {
      final response = (await _dio.get("$baseUrl/catalog/ns10")).data as List;
      return response.map((item) {
        return RegionTableData.fromJson(item);
      }).toList();
    } catch (e) {
      debugLog("$e");
      throw FetchException(message: getErrorMessage(e));
    }
  }
}
