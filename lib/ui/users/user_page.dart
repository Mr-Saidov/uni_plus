import 'package:flutter/material.dart';
import 'package:uni_plus/data/local/db/app_database.dart';
import 'package:uni_plus/data/service_locator.dart';
import 'package:uni_plus/ui/chat/chat_page.dart';
import 'package:uni_plus/ui/regions/bloc/region_bloc.dart';
import 'package:uni_plus/ui/regions/regions.dart';
import 'package:uni_plus/utils/navigator_extension.dart';

import '../../widgets/evw_text_field.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final AppDatabase appDatabase = getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Viloyatlar"),
            onTap: () {
              pushWithBloc<RegionBloc>(const RegionsPage(), RegionBloc());
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: appDatabase.watchUsers(),
              builder: (context, AsyncSnapshot<List<UserTableData>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.isNotEmpty == true) {
                    final data = snapshot.data!;
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return ListTile(
                          leading: Text("${item.id}"),
                          title: Text("${item.name}"),
                          onTap: () => push(ChatPage(userTableData: item)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showUserDialog(context, userTableData: item);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDeleteDialog(item);
                                },
                                icon: const Icon(Icons.delete),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: data.length,
                    );
                  } else {
                    return const Center(
                      child: Text("Foydalanuvchilar ma'lumotlari topilmadi"),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showUserDialog(context);
        },
      ),
    );
  }

  void showUserDialog(BuildContext context, {UserTableData? userTableData}) {
    final nameController =
        TextEditingController(text: userTableData?.name ?? "");
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EVWTextField(
                  controller: nameController,
                  autoFocus: true,
                ),
              ],
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Bekor qilish")),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await appDatabase.insertUserTable(UserTableData(
                        id: userTableData?.id, name: nameController.text));
                  },
                  child: Text("Saqlash")),
            ],
          );
        });
  }

  void showDeleteDialog(UserTableData item) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ushbu ma'lumotni o'chirishni xohlaysizmi?"),
            content: Text("${item.name}"),
            actions: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Bekor qilish")),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await appDatabase.deleteMessagesByUserId(item.id ?? 0);
                    await appDatabase.deleteUser(item);
                  },
                  child: Text("O'chirish")),
            ],
          );
        });
  }
}
