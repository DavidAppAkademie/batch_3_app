import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/content_detail/presentation/content_detail_page.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/main.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Content> contentList = databaseRepository.getContent();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Übersicht'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: ListView.builder(
          itemCount: contentList.length,
          itemBuilder: (context, i) {
            // get content from contentList at position i
            final currentContent = contentList[i];
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
        ),
      ),
    );
  }
}
