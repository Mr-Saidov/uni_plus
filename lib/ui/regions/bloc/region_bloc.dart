import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:meta/meta.dart';
import 'package:uni_plus/data/local/db/app_database.dart';
import 'package:uni_plus/data/remote/api_provider.dart';
import 'package:uni_plus/data/service_locator.dart';
import 'package:uni_plus/utils/utils.dart';

part 'region_event.dart';

part 'region_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  RegionBloc() : super(RegionInitial()) {
    on<RegionEvent>((event, emit) {});
    on<GetRegionsEvent>((event, emit) async {
      _apiProvider.getRegions().then((value) {
        _appDatabase.batch((batch) {
          for (var element in value) {
            debugLog("elementelement ${element.code} ${element.nameLatn}");
            batch.insert(_appDatabase.regionTable, element, mode: InsertMode.insertOrReplace);
          }
        });
      }).catchError((e) {
        debugLog("catchError $e");
      });
    });
  }

  final ApiProvider _apiProvider = getInstance();
  final AppDatabase _appDatabase = getInstance();
}
