import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/add_content/presentation/add_content_page.dart';
import 'package:batch_3_app/features/content/data/database_content_repository.dart';
import 'package:batch_3_app/features/content_detail/presentation/content_detail_page.dart';
import 'package:batch_3_app/features/feedback/data/database_feedback_repository.dart';
import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/features/settings/data/local_storage_repository.dart';
import 'package:batch_3_app/features/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  final DatabaseOverviewRepository databaseOverviewRepository;
  final DatabaseFeedbackRepository databaseFeedbackRepository;
  final DatabaseContentRepository databaseContentRepository;
  final LocalStorageRepository localStorageRepository;

  const OverviewPage({
    Key? key,
    required this.databaseOverviewRepository,
    required this.databaseFeedbackRepository,
    required this.localStorageRepository,
    required this.databaseContentRepository,
  }) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late Future<List<Content>> contentList;

  @override
  void initState() {
    contentList = widget.databaseOverviewRepository.getContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => AddContentPage(
                databaseContentRepository: widget.databaseContentRepository,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        //TODO: add avatar (leading)
        title: const Text('Übersicht'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SettingsPage(
                      localStorageRepository: widget.localStorageRepository),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          children: [
            TextButton(
              child: const Text("Reload test"),
              onPressed: () {
                setState(() {
                  contentList = widget.databaseOverviewRepository.getContent();
                });
              },
            ),
            FutureBuilder(
              future: contentList,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  final contents = snapshot.data!;
                  // Daten fertig geladen, Future entpackt
                  return ListView.builder(
                    shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
