import 'package:flutter/material.dart';

class DetailIssuePage extends StatelessWidget {
  const DetailIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comic Book'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 400,
                    maxWidth: 400,
                  ),
                  child: const Image(
                      image: NetworkImage(
                          'https://comicvine.gamespot.com/a/uploads/original/0/4/7-1487-6-1-chamber-of-chills.jpg')),
                ),
              ),
              const Text('Characters'),
              const Divider(),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: const [
                  GridCharacterItem(),
                  GridCharacterItem(),
                  GridCharacterItem(),
                  GridCharacterItem(),
                  GridCharacterItem(),
                  GridCharacterItem(),
                  GridCharacterItem(),
                ],
              ),
              const Text('Issue Image'),
              const Divider(),
            ]),
          ),
        ));
  }
}

class GridCharacterItem extends StatelessWidget {
  const GridCharacterItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Text('The Amazing Spider'),
    );
  }
}
