import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewFeedbackScreen extends StatelessWidget {
  static const routeName = '/ViewFeedbackScreen';
  const ViewFeedbackScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedbacks anzeigen'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: FutureBuilder(
            future: context
                .read<RepositoryContainer>()
                .databaseFeedbackRepository
                .getFeedback(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final feedbacks = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: feedbacks.length,
                  itemBuilder: (context, index) {
                    final feedback = feedbacks[index];
                    return ListTile(
                      title: Text(feedback.rating.toString()),
                      subtitle: Text(feedback.feedbackText),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
