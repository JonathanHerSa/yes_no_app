import 'package:flutter/material.dart';

class OtherMessageBubble extends StatelessWidget {
  final String message;
  final String urlImage;

  const OtherMessageBubble(
      {super.key, required this.message, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: size.width * 0.8),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(urlImage: urlImage),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String urlImage;
  const _ImageBubble({required this.urlImage});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        urlImage,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * .7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Cargando imagen'),
          );
        },
      ),
    );
  }
}
