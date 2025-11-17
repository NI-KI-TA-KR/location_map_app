import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    return Center(
      child: SizedBox(
        width: 50.0,
        height: 50.0,
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
          valueColor: AlwaysStoppedAnimation<Color>(colorSchemeX.switcherActive),
        ),
      ),
    );
  }
}
