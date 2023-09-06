import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/providers/chat_provider.dart';
import 'package:test_app/presentation/widgets/chat/message_bubble.dart';
import 'package:test_app/presentation/widgets/shared/input_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://media.glamour.com/photos/6329ebe7756bfb7545c0c97f/master/w_1600,c_limit/138426898"),
          ),
        ),
        title: const Text("Juana"),
        centerTitle: true,
      ),
      body: _ChatBox(),
    );
  }
}

class _ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = context.watch<ChatProvider>();
    ScrollController scrollController = ScrollController();

    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              controller: scrollController,
              // controller: chatProvider.scrollControll,
              itemCount: chatProvider.listMessage.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: chatProvider.listMessage[index],
                );
              }),
        )),
        InputFieldBox(
          //Otras formas
          // onValue:(value) => chatProvider.sendMessage(value),
          // onValue: chatProvider.sendMessage,
          onValue: (value) {
            chatProvider.sendMessage(value);
            scrollController.animateTo(
                scrollController.position.maxScrollExtent + 4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
        )
      ],
    );
  }
}
