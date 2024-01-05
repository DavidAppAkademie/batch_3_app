import 'package:batch_3_app/config/app_sizes.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH32,
            Center(child: Image.asset("assets/images/logo.png")),
            gapH32,
            const Text("E-Mail"),
            const TextField(),
            gapH32,
            const Text("Passwort"),
            const TextField(),
            gapH32,
            Center(
              child: ElevatedButton(
                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
