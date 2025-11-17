import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';
import 'package:test_flutter_map/core/theme/border_radius_constants.dart';

class MenuDrowerWidget extends StatelessWidget {
  const MenuDrowerWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    return InkWell(
      onTap: onTap,
      child: Builder(
        builder: (context) {
          return Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: colorSchemeX.background,
              borderRadius: BorderRadiusConstants.circular12,
            ),
            child: Icon(FluentIcons.text_grammar_settings_20_filled, color: colorSchemeX.title),
          );
        },
      ),
    );
  }
}
