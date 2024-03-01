import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentSuggestionsScreen extends StatefulWidget {
  static const routeName = '/ContentSuggestionsScreen';
  const ContentSuggestionsScreen({super.key});

  @override
  State<ContentSuggestionsScreen> createState() =>
      _ContentSuggestionsScreenState();
}

class _ContentSuggestionsScreenState extends State<ContentSuggestionsScreen> {
  late Future<List<Content>> contentSuggestionsList;
  @override
  Widget build(BuildContext context) {
    contentSuggestionsList = context
        .read<RepositoryContainer>()
        .databaseContentRepository
        .getContentSuggestions();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Display content suggestions'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            children: [
              TextButton(
                child: const Text("Reload test"),
                onPressed: () {
                  setState(() {
                    contentSuggestionsList = context
                        .read<RepositoryContainer>()
                        .databaseContentRepository
                        .getContentSuggestions();
                  });
                },
              ),
              FutureBuilder(
                future: contentSuggestionsList,
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
        ));
  }
}
