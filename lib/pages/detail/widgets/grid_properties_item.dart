import 'package:comic_book/pages/detail/widgets/grid_information_items.dart';
import 'package:flutter/material.dart';

class GridPropertiesItems extends StatelessWidget {
  final String errorMessage;
  final List data;
  const GridPropertiesItems({
    super.key,
    required this.errorMessage,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 5,
      children: data.isEmpty
          ? [Text(errorMessage, style: const TextStyle(fontSize: 18))]
          : List.generate(
              data.length,
              (index) {
                final item = data[index];
                return GrindInformationItem(
                  name: item.name,
                );
              },
            ),
    );
  }
}
