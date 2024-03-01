import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/sign_up/application/sign_up_validators.dart';
import 'package:batch_3_app/features/sign_up/presentation/register_page.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/SignUpPage';

  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: emailErrorText,
                ),
                gapH32,
                const Text("Passwort"),
                TextFormField(
                  controller: _passwordController,
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
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        context
                            .read<RepositoryContainer>()
                            .firebaseAuthRepository
                            .loginUser(email, password);
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
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
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
