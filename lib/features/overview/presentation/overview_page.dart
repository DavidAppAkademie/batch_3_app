import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/config/content.dart';
import 'package:batch_3_app/features/add_content_suggestion/presentation/add_content_suggestion_page.dart';
import 'package:batch_3_app/features/add_content_suggestion/presentation/content_suggestions_screen.dart';
import 'package:batch_3_app/features/content_detail/presentation/content_detail_page.dart';
import 'package:batch_3_app/features/feedback/presentation/view_feedback_screen.dart';
import 'package:batch_3_app/features/overview/model/feedback.dart';
import 'package:batch_3_app/features/settings/presentation/settings_page.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OverviewPage extends StatelessWidget {
  static const routeName = '/OverviewPage';

  const OverviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const AddContentSuggestionPage(),
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
              Navigator.pushNamed(context, ContentSuggestionsScreen.routeName);
            },
            icon: const Icon(Icons.workspaces_filled),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ViewFeedbackScreen.routeName);
            },
            icon: const Icon(Icons.energy_savings_leaf),
          ),
          IconButton(
            onPressed: () {
              // show feedback dialog
              final dialog = RatingDialog(
                initialRating: 1.0,
                // your app's name?
                title: const Text(
                  'Rating Dialog',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // encourage your user to leave a high rating?
                message: const Text(
                  'Tap a star to set your rating. Add more description here if you want.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                // your app's logo?
                image: const FlutterLogo(size: 100),
                submitButtonText: 'Submit',
                commentHint: 'Set your custom comment hint',
                onCancelled: () => debugPrint('cancelled'),
                onSubmitted: (response) async {
                  final feedback = Feedback(
                      rating: response.rating, feedbackText: response.comment);
                  await context
                      .read<RepositoryContainer>()
                      .databaseFeedbackRepository
                      .addFeedback(feedback);
                },
              );

              // show the dialog
              showDialog(
                context: context,
                barrierDismissible:
                    true, // set to false if you want to force a rating
                builder: (context) => dialog,
              );
            },
            icon: const Icon(Icons.feedback),
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
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
            ],
          ),
        ),
      ),
    );
  }
}
