// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_end/notification.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          child:    PopupMenuButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      position: PopupMenuPosition.under,
      icon: const Icon(CupertinoIcons.add_circled),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'New Chat',
            child: const ListTile(
                leading: Icon(CupertinoIcons.chat_bubble_2_fill),
                title: Text('New Chat', maxLines: 1)),
            onTap: () => ZIMKit().showDefaultNewPeerChatDialog(context),
          ),
          // PopupMenuItem(
          //   value: 'New Group',
          //   child: const ListTile(
          //       leading: Icon(CupertinoIcons.person_2_fill),
          //       title: Text('New Group', maxLines: 1)),
          //   onTap: () => ZIMKit().showDefaultNewGroupChatDialog(context),
          // ),
          // PopupMenuItem(
          //   value: 'Join Group',
          //   child: const ListTile(
          //       leading: Icon(Icons.group_add),
          //       title: Text('Join Group', maxLines: 1)),
          //   onTap: () => ZIMKit().showDefaultJoinGroupDialog(context),
          // ),
        ];
      },
    )
        ),
        title: const Text("Dashboard"),
        actions: [IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> FruitPage())),
          icon: Icon(Icons.new_label),
        )]



        
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
