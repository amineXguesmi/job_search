import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              iconSize: 20,
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 'New Group Chat',
                    child: Text('New Group Chat'),
                  ),
                ];
              }),
        ],
        bottom: TabBar(
          labelStyle: const TextStyle(fontSize: 16),
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Messages',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        ChatPage(),
        Center(
          child: Text('Status', style: TextStyle(fontSize: 16)),
        ),
        Center(
          child: Text('Calls', style: TextStyle(fontSize: 16)),
        ),
      ]),
    );
  }
}
