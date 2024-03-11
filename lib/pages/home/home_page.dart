import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';
import 'widgets/grid_item_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comic Book'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: authProvider.signuserOut,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Consumer<HomeController>(builder: (context, homeController, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text('Last Issues'),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          homeController.changeGrid(1, 2, 0);
                        },
                        icon: const Icon(Icons.list)),
                    IconButton(
                      onPressed: () {
                        homeController.changeGrid(2, 0.85, 1);
                      },
                      icon: const Icon(Icons.grid_on),
                    ),
                  ],
                ),
              ),
              const HomeContent(),
            ],
          );
        }),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    Provider.of<DataIssuesProvider>(context, listen: false).fetchDataIssues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final dataProvider = Provider.of<DataIssuesProvider>(context);

    if (dataProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (dataProvider.hasError) {
      return Center(child: Text('Error: ${dataProvider.errorMessage}'));
    } else {
      return Expanded(
        child: GridView.count(
          crossAxisCount: homeController.count,
          childAspectRatio: homeController.ratio,
          children: List.generate(
            dataProvider.dataIssues['results'].length,
            (index) {
              final item = dataProvider.dataIssues['results'][index];
              return GridItemView(
                url: item['image']['original_url'],
                name: item['name'],
                number: item['issue_number'].toString(),
                date: item['date_added'],
                detailUrl: item['api_detail_url'],
              );
            },
          ),
        ),
      );
    }
  }
}
