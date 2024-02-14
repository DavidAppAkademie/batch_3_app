import 'package:batch_3_app/config/app_sizes.dart';
import 'package:batch_3_app/repository_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var darkModeFuture = context
        .read<RepositoryContainer>()
        .localStorageRepository
        .getIsDarkMode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          children: [
            FutureBuilder(
              future: darkModeFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //loading
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && !snapshot.hasError) {
                  // data
                  final bool isDarkMode = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Dark Mode"),
                          gapW8,
                          Switch(
                            value: isDarkMode,
                            onChanged: (newValue) async {
                              await context
                                  .read<RepositoryContainer>()
                                  .localStorageRepository
                                  .setThemeMode(isDarkMode: newValue);
                              context
                                  .read<RepositoryContainer>()
                                  .notifyThemeModeHasChanged();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  // error
                  return const Text("Error loading settings :(");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
