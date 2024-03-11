import 'package:flutter/material.dart';

class GridItemList extends StatelessWidget {
  const GridItemList({
    super.key,
    required this.date,
    required this.url,
    required this.name,
    required this.number,
  });

  final String date;
  final String url;
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: Image(
            image: NetworkImage(url),
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$name #$number',
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ))
      ]),
    );
  }
}
