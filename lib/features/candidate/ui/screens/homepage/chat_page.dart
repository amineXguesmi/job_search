import 'package:flutter/material.dart';
import 'package:job_search/features/candidate/data/datasources/chat_date.dart';

import '../../../../shared_features/ui/widgets/custom_card.dart';
import '../../../data/models/chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat>? userChats = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchChats();
  }

  fetchChats() async {
    setState(() {
      loading = true;
    });
    userChats = (chatData['chats'] as List).map((chatItem) => Chat.fromJson(chatItem)).toList();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(
          Icons.chat,
          color: Colors.white,
          size: 18,
        ),
      ),
      body: userChats == null
          ? const Center(
              child: Text(
                "No Chats",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: userChats!.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  chat: userChats![index],
                );
              },
            ),
    );
  }
}
