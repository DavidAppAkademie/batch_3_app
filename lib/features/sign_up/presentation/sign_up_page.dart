import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/overview/presentation/overview_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH32,
              Center(child: Image.asset("assets/images/logo.png")),
              gapH32,
              const Text("E-Mail"),
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              gapH32,
              const Text("Passwort"),
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              gapH32,
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const OverviewPage(),
                      ),
                    );
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
    );
  }
}
