import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/data_detail_provider.dart';

class DetailIssuePage extends StatelessWidget {
  const DetailIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comic Book'),
        ),
        body: const DetailsContent());
  }
}

class DetailsContent extends StatefulWidget {
  const DetailsContent({
    super.key,
  });

  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  @override
  void initState() {
    Provider.of<DataDetailIssueProvider>(context, listen: false)
        .fetchDataDetail('https://comicvine.gamespot.com/api/issue/4000-6');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataDetailIssueProvider>(
      builder: (context, dataDetailProvider, _) {
        if (dataDetailProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (dataDetailProvider.hasError) {
          return Center(
            child: Text(dataDetailProvider.errorMessage),
          );
        }
        return SingleChildScrollView(
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
                  child: Image(
                      image: NetworkImage(
                          dataDetailProvider.dataDetailModel['results']['image']
                              ['original_url'])),
                ),
              ),
              const Text('Characters'),
              const Divider(),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: dataDetailProvider
                            .dataDetailModel['results']['character_credits']
                            .length ==
                        0
                    ? [const Text('No characters found')]
                    : List.generate(
                        dataDetailProvider
                            .dataDetailModel['results']['character_credits']
                            .length,
                        (index) {
                          final item =
                              dataDetailProvider.dataDetailModel['results']
                                  ['character_credits'][index];
                          return GrindInformationItem(
                            name: item['name'],
                          );
                        },
                      ),
              ),
              const Text('Teams'),
              const Divider(),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: dataDetailProvider
                            .dataDetailModel['results']['team_credits']
                            .length ==
                        0
                    ? [const Text('No teams found')]
                    : List.generate(
                        dataDetailProvider
                            .dataDetailModel['results']['character_credits']
                            .length,
                        (index) {
                          final item =
                              dataDetailProvider.dataDetailModel['results']
                                  ['team_credits'][index];
                          return GrindInformationItem(
                            name: item['name'],
                          );
                        },
                      ),
              ),
              const Text('Locations'),
              const Divider(),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: dataDetailProvider
                            .dataDetailModel['results']['location_credits']
                            .length ==
                        0
                    ? [const Text('No locations found')]
                    : List.generate(
                        dataDetailProvider
                            .dataDetailModel['results']['location_credits']
                            .length,
                        (index) {
                          final item =
                              dataDetailProvider.dataDetailModel['results']
                                  ['location_credits'][index];
                          return GrindInformationItem(
                            name: item['name'],
                          );
                        },
                      ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

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
      child: Text(name),
    );
  }
}
