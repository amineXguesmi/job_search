import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../candidate/data/models/chat.dart';
import '../../../candidate/data/models/user.dart';

class CustomCard extends StatelessWidget {
  Chat chat;

  CustomCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    DateTime date;
    String dateString;

    try {
      date = DateTime.parse(chat.latestMessage!.createdAt!);
    } catch (e) {
      date = DateTime.now();
    }

    dateString = DateFormat('MMM d, yyyy').format(date);

    User sender = chat.users![0];

    return InkWell(
      onTap: () {
        // Get.to(() => IndividualPage(
        //       user: sender,
        //       chat: chat,
        //     ));
      },
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s"),
              backgroundColor: Colors.white,
            ),
            title: Text(
              "${sender.firstName!} ${sender.lastName!}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(
                  chat.latestMessage?.content ?? " ",
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            trailing: Text(dateString, style: const TextStyle(fontSize: 9)),
          ),
          Container(
            height: 1,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
