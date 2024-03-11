import 'package:flutter/material.dart';

class GridItemGrid extends StatelessWidget {
  const GridItemGrid({
    super.key,
    required this.url,
    required this.name,
    required this.number,
    required this.date,
  });

  final String url;
  final String name;
  final String number;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
          child: Column(
        children: [
          Expanded(
              child: Image(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          )),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$name #$number',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          Text(date),
        ],
      )),
    );
  }
}
