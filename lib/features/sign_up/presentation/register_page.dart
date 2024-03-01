import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/sign_up/application/sign_up_validators.dart';
import 'package:batch_3_app/features/sign_up/presentation/sign_up_page.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/RegisterPage';

  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordRepeatController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
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
                gapH16,
                const Text("Passwort wiederholen"),
                TextFormField(
                  controller: _passwordRepeatController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: passwordErrorText,
                ),
                gapH32,
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final passwordRepeat = _passwordRepeatController.text;

                        if (password != passwordRepeat) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Passwörter stimmen nicht überein"),
                            ),
                          );
                          return;
                        } else {
                          // Register with Firebase Auth
                          await context
                              .read<RepositoryContainer>()
                              .firebaseAuthRepository
                              .register(email, password);
                        }
                      }
                    },
                    child: Text(
                      "Registrieren",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                gapH32,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.p8),
                      child: Text("Du hast ein Konto?"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                gapH32,
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.routeName);
                    },
                    child: const Text("Zum Login"),
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
