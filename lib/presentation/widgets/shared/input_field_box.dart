import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/message.dart';
// import 'package:test_app/domain/entities/message.dart';
// import 'package:provider/provider.dart';
// import 'package:test_app/presentation/providers/chat_provider.dart';

class InputFieldBox extends StatelessWidget {
  //Esto es una function callback que mandan, y se le devuelve el texto,
  //se hizo así para no condenar al inputFielBox a que use el provider con .read() y usar el Provider desde el otro codigo
  final ValueChanged<Message> onValue;
  const InputFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // ChatProvider chatProvider = context.read<ChatProvider>();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    const inputDecoration = InputDecoration(
        hintText: "Write your message",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))));

    return Container(
      color: colorScheme.secondary,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: focusNode,
                    controller: textController,
                    decoration: inputDecoration,
                    onFieldSubmitted: (value) {
                      // chatProvider.sendMessage(
                      //     Message(fromWho: FromWho.me, textMsg: value));
                      onValue(Message(fromWho: FromWho.me, textMsg: value));

                      textController.clear();
                      focusNode.requestFocus();
                    },
                    onTapOutside: (event) {
                      focusNode.unfocus();
                    },
                  ),
                ),
              ),
              IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    // chatProvider.sendMessage(Message(
                    //     fromWho: FromWho.me, textMsg: textController.text));
                    onValue(Message(
                        fromWho: FromWho.me, textMsg: textController.text));
                    textController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
