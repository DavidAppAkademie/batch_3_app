import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:batch_3_app/features/overview/presentation/syntax_highlight.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(Sizes.p16),
        child: Center(
          child: Column(
            children: [
              Text(
                widget.content.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              gapH32,
              Text(
                widget.content.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              gapH32,
              _isCodeView
                  ? SyntaxHighlight(code: widget.content.sampleCode)
                  : _sampleWidget,
              gapH32,
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
      ),
    );
  }

  Widget get _sampleWidget =>
      widget.content.widget ??
      Text("Es gibt kein Widget zu ${widget.content.title}");
}
