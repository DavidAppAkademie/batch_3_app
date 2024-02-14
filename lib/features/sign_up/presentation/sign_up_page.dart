import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/content/data/database_content_repository.dart';
import 'package:batch_3_app/features/feedback/data/database_feedback_repository.dart';
import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/presentation/overview_page.dart';
import 'package:batch_3_app/features/settings/data/local_storage_repository.dart';
import 'package:batch_3_app/features/sign_up/application/sign_up_validators.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final DatabaseOverviewRepository databaseOverviewRepository;
  final DatabaseFeedbackRepository databaseFeedbackRepository;
  final DatabaseContentRepository databaseAddContentRepository;
  final LocalStorageRepository localStorageRepository;
  const SignUpPage({
    Key? key,
    required this.databaseOverviewRepository,
    required this.databaseFeedbackRepository,
    required this.databaseAddContentRepository,
    required this.localStorageRepository,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH32,
                Center(child: Image.asset("assets/images/logo.png")),
                gapH32,
                const Text("E-Mail"),
                TextFormField(
                  initialValue: "david@sent.com",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: emailErrorText,
                ),
                gapH32,
                const Text("Passwort"),
                TextFormField(
                  initialValue: "megaSicher",
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: passwordErrorText,
                ),
                gapH32,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // erfolgreicher Login => OverViewPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => OverviewPage(
                              databaseOverviewRepository:
                                  widget.databaseOverviewRepository,
                              databaseFeedbackRepository:
                                  widget.databaseFeedbackRepository,
                              databaseContentRepository:
                                  widget.databaseAddContentRepository,
                              localStorageRepository:
                                  widget.localStorageRepository,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Anmelden",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                gapH32,
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Passwort vergessen"),
                  ),
                ),
                gapH32,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.p8),
                      child: Text("Noch kein Konto?"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                gapH32,
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Kostenlos registrieren"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
