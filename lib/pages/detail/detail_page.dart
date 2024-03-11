import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/data_detail_provider.dart';
import 'widgets/grid_properties_item.dart';
import 'widgets/image_issue_detail.dart';

class DetailIssuePage extends StatelessWidget {
  const DetailIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataDetailProvider = Provider.of<DataDetailIssueProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(dataDetailProvider.title),
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
        .fetchDataDetail();
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
              ImageIssueDetails(
                  url: dataDetailProvider
                      .dataDetailModel.results!.image.originalUrl),
              const Text('Characters'),
              const Divider(),
              GridPropertiesItems(
                errorMessage: 'No characters found',
                data: dataDetailProvider
                    .dataDetailModel.results!.characterCredits,
              ),
              const Text('Teams'),
              const Divider(),
              GridPropertiesItems(
                errorMessage: 'No teams found',
                data: dataDetailProvider.dataDetailModel.results!.teamCredits,
              ),
              const Text('Locations'),
              const Divider(),
              GridPropertiesItems(
                errorMessage: 'No locations found',
                data:
                    dataDetailProvider.dataDetailModel.results!.locationCredits,
              ),
            ]),
          ),
        );
      },
    );
  }
}
