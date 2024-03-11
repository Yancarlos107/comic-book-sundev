import 'package:flutter/material.dart';

class GrindInformationItem extends StatelessWidget {
  final String name;
  const GrindInformationItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(name, style: const TextStyle(fontSize: 18)),
    );
  }
}
