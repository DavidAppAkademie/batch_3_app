import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/overview/data/database_overview_repository.dart';
import 'package:batch_3_app/features/overview/presentation/overview_page.dart';
import 'package:batch_3_app/features/sign_up/application/validators.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final DatabaseOverviewRepository databaseOverviewRepository;
  const SignUpPage({Key? key, required this.databaseOverviewRepository})
      : super(key: key);

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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: emailErrorText,
                ),
                gapH32,
                const Text("Passwort"),
                TextFormField(
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => OverviewPage(
                                databaseOverviewRepository:
                                    widget.databaseOverviewRepository),
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
