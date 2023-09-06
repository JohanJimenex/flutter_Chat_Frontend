enum FromWho { me, other }

class Message {
  FromWho fromWho;
  String textMsg;
  String imageUrl;
  Message({required this.fromWho, required this.textMsg, this.imageUrl = ""});
}
