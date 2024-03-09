import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signuserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
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
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: const [
                    Text('1'),
                    Text('2'),
                  ] /* itemList.map((ImageData imageData) {
                    return getGridItem(imageData);
                  }).toList(), */
                  ),
            )
          ],
        ),
      ),
    );
  }
}
