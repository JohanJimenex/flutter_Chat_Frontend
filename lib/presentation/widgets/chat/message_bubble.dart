import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    double screenWidthCalc = MediaQuery.of(context).size.width / 1.5;
    ColorScheme colorsScheme = Theme.of(context).colorScheme;

    return Container(
        alignment: (message.fromWho == FromWho.me)
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: screenWidthCalc),
              decoration: BoxDecoration(
                  color: message.fromWho == FromWho.me
                      ? colorsScheme.primary
                      : colorsScheme.secondary,
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(9),
              child: Column(
                children: [
                  _ImageWidget(
                    message: message,
                  ),
                  Text(
                    message.textMsg,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ));
  }
}

class _ImageWidget extends StatelessWidget {
  final Message message;
  const _ImageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return (message.imageUrl == "")
        ? const SizedBox()
        : ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(message.imageUrl,
                loadingBuilder: (contex, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return const CircularProgressIndicator(
                color: Colors.white,
              );
            }));
  }
}
