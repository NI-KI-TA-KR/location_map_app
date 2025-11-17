import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';

class CustomMarkerClusterWidget extends StatelessWidget {
  final int count;

  const CustomMarkerClusterWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    final textThemeX = context.textThemeExtension;
    return Container(
      height: 70,
      width: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: colorSchemeX.switcherActive, shape: BoxShape.circle),
      child: Text(
        count.toString(),
        style: textThemeX.caption!.copyWith(fontSize: 10, color: colorSchemeX.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
