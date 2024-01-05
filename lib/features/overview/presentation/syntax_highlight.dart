import 'package:batch_3_app/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs.dart';

class SyntaxHighlight extends StatelessWidget {
  final String code;
  const SyntaxHighlight({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return HighlightView(
      code,
      language: 'dart',
      padding: const EdgeInsets.all(8),
      textStyle: const TextStyle(
        fontSize: Sizes.p16,
      ),
      theme: vsTheme,
    );
  }
}
