import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signuserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    String fecha = "2008-06-06 11:10:09";
    DateTime fechaConvertida = DateTime.parse(fecha);
    String fechaFormateada = DateFormat.yMMMMd().format(fechaConvertida);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comic Book'),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: signuserOut,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Text('Last Issues'),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_on),
                  ),
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 2,
              children: const [
                GridItemList(),
                GridItemList(),
                GridItemList(),
                GridItemList()
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class GridItemList extends StatelessWidget {
  const GridItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        margin: const EdgeInsets.all(5),
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
      ),
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
    return GridTile(
        child: Column(
      children: [
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
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
    ));
  }
}
