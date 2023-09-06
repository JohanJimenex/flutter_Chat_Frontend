import 'package:flutter/material.dart';
import 'package:test_app/config/helpers/yes_no_service.dart';
import 'package:test_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  // Otra forma para mover el scroll del listview
  // ScrollController scrollControll = ScrollController();

  List<Message> listMessage = [
    Message(fromWho: FromWho.me, textMsg: "Hola"),
    Message(fromWho: FromWho.me, textMsg: "Como estás"),
    Message(fromWho: FromWho.other, textMsg: "Bien y tu"),
    Message(
        fromWho: FromWho.me,
        textMsg: "image",
        imageUrl:
            "https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif"),
    Message(
        fromWho: FromWho.other,
        textMsg: "image",
        imageUrl:
            "https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif"),
  ];

  Future<void> sendMessage(Message textMsg) async {
    if (textMsg.textMsg.isEmpty && textMsg.imageUrl.isEmpty) {
      return;
    }

    listMessage.add(textMsg);
    listMessage.add(await YesNoService().getAnswer());

    notifyListeners();

    // await Future.delayed(const Duration(milliseconds: 300));

    // scrollControll.animateTo(scrollControll.position.maxScrollExtent,
        // duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
