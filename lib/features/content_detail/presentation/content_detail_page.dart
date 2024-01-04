import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';

class ContentDetailPage extends StatefulWidget {
  final Content content;
  const ContentDetailPage({Key? key, required this.content}) : super(key: key);

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
            Text(widget.content.title),
            const SizedBox(
              height: 32,
            ),
            Text(widget.content.description),
            const SizedBox(
              height: 32,
            ),
            _isCodeView
                ? HighlightView(
                    widget.content.sampleCode,
                    language: 'dart',
                    padding: const EdgeInsets.all(8),
                    textStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    theme: vsTheme,
                  )
                : _sampleWidget,
            TextButton(
              onPressed: () {
                setState(() {
                  _isCodeView = !_isCodeView;
                });
              },
              child: Text(_isCodeView ? "Widget-Ansicht" : "Code-Ansicht"),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _sampleWidget =>
      widget.content.widget ??
      Text("Es gibt kein Widget zu ${widget.content.title}");
}
