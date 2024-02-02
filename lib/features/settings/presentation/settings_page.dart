import 'package:batch_3_app/config/app_sizes.dart';
import 'package:flutter/material.dart';

//TODO: implement settings page!
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.p16),
        child: Column(
          children: [
            Text("Settings"),
          ],
        ),
      ),
    );
  }
}
