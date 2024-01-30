import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/content_detail/presentation/content_detail_page.dart';
import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/features/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  final DatabaseOverviewRepository databaseOverviewRepository;

  const OverviewPage({Key? key, required this.databaseOverviewRepository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Future<List<Content>> contentList =
        databaseOverviewRepository.getContent();
    return Scaffold(
      appBar: AppBar(
        //TODO: add avatar (leading)
        title: const Text('Übersicht'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SettingsPage(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: FutureBuilder(
          future: contentList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final contents = snapshot.data!;
              // Daten fertig geladen, Future entpackt
              return ListView.builder(
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  // get content from contentList at position i
                  final currentContent = contents[i];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              ContentDetailPage(content: currentContent),
                        ),
                      );
                    },
                    title: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(Sizes.p16),
                      child: Text(currentContent.title),
                    )),
                  );
                },
              );
            } else {
              // else -> Daten nicht fertig geladen
              // nicht fertig geladen -> entweder Ladend oder Error
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
