import 'package:flutter/material.dart';
import 'package:uni_plus/data/local/db/app_database.dart';
import 'package:uni_plus/data/service_locator.dart';
import 'package:uni_plus/utils/navigator_extension.dart';
import 'package:uni_plus/widgets/evw_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.userTableData});

  final UserTableData userTableData;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final AppDatabase appDatabase = getInstance();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.userTableData.name}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: appDatabase.watchMessages(widget.userTableData.id!),
              builder:
                  (context, AsyncSnapshot<List<MessageTableData>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.isNotEmpty == true) {
                    final data = snapshot.data!;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final item = data[index];
                        final date =
                            DateTime.fromMillisecondsSinceEpoch(item.time);
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("Ushbu xabar o'chirilsinmi?"),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () {
                                          pop();
                                        },
                                        child: Text("Bekor qilish"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          appDatabase.deleteMessage(item);
                                          pop();
                                        },
                                        child: Text("O'chirsh"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.content),
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Text(
                                      "$date",
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                    );
                  } else {
                    return const Center(
                      child: Text("Xabarlar topilmadi"),
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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: EVWTextField(
                    controller: messageController,
                    hintText: "Yozing",
                    onFieldSubmitted: (s) async {
                      await appDatabase.insertMessageTable(
                        MessageTableData(
                          userId: widget.userTableData.id!,
                          senderId: widget.userTableData.id!,
                          content: messageController.text,
                          time: DateTime.now().millisecondsSinceEpoch,
                        ),
                      );
                      messageController.text = "";
                    },
                  ),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    await appDatabase.insertMessageTable(
                      MessageTableData(
                        userId: widget.userTableData.id!,
                        senderId: widget.userTableData.id!,
                        content: messageController.text,
                        time: DateTime.now().millisecondsSinceEpoch,
                      ),
                    );
                    messageController.text = "";
                  },
                  icon: const Icon(Icons.send)),
            ],
          )
        ],
      ),
    );
  }
}
