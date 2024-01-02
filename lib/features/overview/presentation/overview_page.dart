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
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: contentList.length,
          itemBuilder: (context, i) {
            // get content from contentList at position i
            final currentContent = contentList[i];
            return ListTile(
              title: Text(currentContent.title),
            );
          },
        ),
      ),
    );
  }
}
