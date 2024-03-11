import 'package:flutter/material.dart';

class ImageIssueDetails extends StatelessWidget {
  final String url;
  const ImageIssueDetails({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 400,
          maxWidth: 400,
        ),
        child: Image(image: NetworkImage(url)),
      ),
    );
  }
}
