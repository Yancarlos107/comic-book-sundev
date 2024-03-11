import 'package:comic_book/pages/home/widgets/grid_item_grid.dart';
import 'package:comic_book/pages/home/widgets/grid_item_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controllers/controllers.dart';

class GridItemView extends StatelessWidget {
  const GridItemView({
    super.key,
    required this.date,
    required this.url,
    required this.name,
    required this.number,
    required this.detailUrl,
  });

  final String date;
  final String url;
  final String? name;
  final String number;
  final String detailUrl;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    DateTime timeParser = DateTime.parse(date);
    String dateFormated = DateFormat.yMMMMd().format(timeParser);
    return GestureDetector(
      onTap: () {
        Provider.of<DataDetailIssueProvider>(context, listen: false).setUrl =
            detailUrl;
        Provider.of<DataDetailIssueProvider>(context, listen: false).setTitle =
            name == null ? '#$number' : '$name #$number';
        Navigator.pushNamed(context, '/detail');
      },
      child: homeController.viewType.index == 0
          ? GridItemList(
              url: url, name: name ?? '', number: number, date: dateFormated)
          : GridItemGrid(
              url: url, name: name ?? '', number: number, date: dateFormated),
    );
  }
}
