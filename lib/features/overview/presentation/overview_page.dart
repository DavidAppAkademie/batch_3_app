import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/add_content/presentation/add_content_page.dart';
import 'package:batch_3_app/features/content_detail/presentation/content_detail_page.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/features/settings/presentation/settings_page.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  static const routeName = '/OverviewPage';

  const OverviewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late Future<List<Content>> contentList;

  @override
  Widget build(BuildContext context) {
    contentList = context
        .read<RepositoryContainer>()
        .databaseContentRepository
        .getContent();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const AddContentPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Übersicht'),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<RepositoryContainer>()
                  .firebaseAuthRepository
                  .logoutUser();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
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
        child: Column(
          children: [
            TextButton(
              child: const Text("Reload test"),
              onPressed: () {
                setState(() {
                  contentList = context
                      .read<RepositoryContainer>()
                      .databaseContentRepository
                      .getContent();
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
