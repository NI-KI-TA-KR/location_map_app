import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? description;

  const InfoCard({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    final textThemeX = context.textThemeExtension;
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textThemeX.title),
          SizedBox(height: 8),
          if (description != null) Text(description!, style: textThemeX.caption),
        ],
      ),
    );
  }
}
