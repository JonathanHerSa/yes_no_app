enum FromWho { mine, others }

class Message {
  final String text;
  final String? urlImage;
  final FromWho fromWho;

  Message({required this.text, this.urlImage, required this.fromWho});
}
