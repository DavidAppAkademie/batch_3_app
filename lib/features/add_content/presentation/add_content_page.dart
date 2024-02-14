import 'dart:math';

import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/features/add_content/application/add_content_validators.dart';
import 'package:batch_3_app/features/content/data/database_content_repository.dart';
import 'package:batch_3_app/features/overview/model/content.dart';
import 'package:flutter/material.dart';

class AddContentPage extends StatefulWidget {
  final DatabaseContentRepository databaseContentRepository;
  const AddContentPage({Key? key, required this.databaseContentRepository})
      : super(key: key);

  @override
  State<AddContentPage> createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContentPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _sampleCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _sampleCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add content'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(hintText: "Titel"),
                  validator: contentTitleErrorText,
                ),
                gapH16,
                TextFormField(
                  minLines: 3,
                  maxLines: 120,
                  controller: _descriptionController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(hintText: "Beschreibung"),
                  validator: contentDescriptionErrorText,
                ),
                gapH16,
                TextFormField(
                  minLines: 3,
                  maxLines: 120,
                  controller: _sampleCodeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      const InputDecoration(hintText: "Sample Code (optional)"),
                  validator: contentCodeSampleErrorText,
                ),
                gapH32,
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // extract all relevant values from text controllers
                      final id = Random().nextInt(10000000).toString();
                      final title = _titleController.text;
                      final description = _descriptionController.text;
                      final sampleCode = _sampleCodeController.text;
                      const authorFullName = "David";
                      const Widget? sampleWidget = null;

                      // reset all controllers
                      _clearFields();

                      // create new content object
                      final newContent = Content(
                        id,
                        title,
                        description,
                        sampleCode,
                        authorFullName,
                        sampleWidget,
                      );

                      // add new content object to database
                      // whatever it might be (json, sharedprefs, firestore, mock, etc.)
                      await widget.databaseContentRepository
                          .addContent(newContent);

                      if (!context.mounted) return;
                      Navigator.pop(context);
                    } else {
                      debugPrint("Form fehlerhaft!");
                    }
                  },
                  child: const Text("Content einsenden!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearFields() {
    _titleController.clear();
    _descriptionController.clear();
    _sampleCodeController.clear();
  }
}
