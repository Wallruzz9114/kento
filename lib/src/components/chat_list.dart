import 'package:flutter/material.dart';
import 'package:kento/src/components/chat_item.dart';

class ChatList extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  @override
  ListView build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) => ChatItem(index),
      itemCount: 20,
      reverse: true,
      controller: listScrollController,
    );
  }
}
