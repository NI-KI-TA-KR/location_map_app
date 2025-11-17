import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/assets_gen/localization/strings.g.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';

class ErrorWIdget extends StatelessWidget {
  const ErrorWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    final textThemeX = context.textThemeExtension;
    final translations = Translations.of(context);
    return Center(child: Text(translations.error.errorText, style: textThemeX.title));
  }
}
