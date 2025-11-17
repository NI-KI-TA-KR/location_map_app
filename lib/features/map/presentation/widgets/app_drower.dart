import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/assets_gen/localization/strings.g.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';
import 'package:test_flutter_map/features/settings/presentation/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    final textThemeX = context.textThemeExtension;
    final translations = Translations.of(context);

    return Drawer(
      width: 260,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(color: colorSchemeX.appBar),
            child: Text(
              translations.drawer.name,
              style: textThemeX.title!.copyWith(color: colorSchemeX.white),
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Text(translations.map.settings, style: textThemeX.body),
                  onTap: () => Navigator.pushNamed(context, SettingsScreen.path),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(translations.drawer.version, style: textThemeX.caption),
          ),
        ],
      ),
    );
  }
}
