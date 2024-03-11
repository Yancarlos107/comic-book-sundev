import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';

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
    String fecha = "2008-06-06 11:10:09";
    DateTime fechaConvertida = DateTime.parse(fecha);
    String fechaFormateada = DateFormat.yMMMMd().format(fechaConvertida);

    if (dataProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (dataProvider.hasError) {
      return Center(child: Text('Error: ${dataProvider.errorMessage}'));
    } else {
      return Expanded(
        child: GridView.count(
          crossAxisCount: homeController.count,
          childAspectRatio: homeController.ratio,
          children: [
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1'),
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1'),
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1'),
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1'),
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1'),
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1'),
            GridItemView(
                fechaFormateada: fechaFormateada,
                url:
                    'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg',
                name: 'The Amazing Spider',
                number: '1')
          ],
        ),
      );
    }
  }
}

class GridItemList extends StatelessWidget {
  const GridItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: const Row(children: [
        Expanded(
          child: Image(
            image: NetworkImage(
                'https://comicvine.gamespot.com/a/uploads/original/0/4/22-989-23-1-blackhawk.jpg'),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('The Amazing Spider'),
            Text('June 6, 2008'),
          ],
        ))
      ]),
    );
  }
}

class GridItemView extends StatelessWidget {
  const GridItemView({
    super.key,
    required this.fechaFormateada,
    required this.url,
    required this.name,
    required this.number,
  });

  final String fechaFormateada;
  final String url;
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: homeController.viewType.index == 0
          ? const GridItemList()
          : GridItemGrid(
              url: url,
              name: name,
              number: number,
              fechaFormateada: fechaFormateada),
    );
  }
}

class GridItemGrid extends StatelessWidget {
  const GridItemGrid({
    super.key,
    required this.url,
    required this.name,
    required this.number,
    required this.fechaFormateada,
  });

  final String url;
  final String name;
  final String number;
  final String fechaFormateada;

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
          Text(fechaFormateada),
        ],
      )),
    );
  }
}
