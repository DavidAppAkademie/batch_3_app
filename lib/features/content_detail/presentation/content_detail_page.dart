import 'package:flutter/material.dart';

class ContentDetailPage extends StatefulWidget {
  const ContentDetailPage({Key? key}) : super(key: key);

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  bool _isCodeView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailansicht'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Titel"),
            const SizedBox(
              height: 32,
            ),
            const Text("Beschreibung"),
            const SizedBox(
              height: 32,
            ),
            Text(_isCodeView
                ? "Das ist die Code Ansicht"
                : "Das ist die Widget Ansicht"),
            TextButton(
              onPressed: () {
                setState(() {
                  _isCodeView = !_isCodeView;
                });
              },
              child: const Text("Ansicht wechseln"),
            ),
          ],
        ),
      ),
    );
  }
}
