import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_plus/data/local/db/app_database.dart';
import 'package:uni_plus/data/service_locator.dart';
import 'package:uni_plus/ui/regions/bloc/region_bloc.dart';

class RegionsPage extends StatefulWidget {
  const RegionsPage({super.key});

  @override
  State<RegionsPage> createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<RegionBloc>().add(GetRegionsEvent());
  }

  final AppDatabase _appDatabase = getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Viloyatlar"),
      ),
      body: StreamBuilder(
        stream: _appDatabase.watchRegions(),
        builder: (context, AsyncSnapshot<List<RegionTableData>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.isNotEmpty == true) {
              final data = snapshot.data!;
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(
                    leading: Text("${item.code}"),
                    title: Text("${item.nameLatn}"),
                    onTap: () {
                      // push(ChatPage(userTableData: item));
                    },
                    // trailing: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {
                    //         showUserDialog(context, userTableData: item);
                    //       },
                    //       icon: const Icon(Icons.edit),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         showDeleteDialog(item);
                    //       },
                    //       icon: const Icon(Icons.delete),
                    //     )
                    //   ],
                    // ),
                  );
                },
                itemCount: data.length,
              );
            } else {
              return const Center(
                child: Text("Viloyatlar ma'lumotlari topilmadi"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
