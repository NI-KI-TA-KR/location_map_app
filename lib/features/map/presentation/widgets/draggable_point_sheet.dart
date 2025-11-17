import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';

class DraggablePointSheet extends StatelessWidget {
  const DraggablePointSheet({super.key, required this.items});

  final List<LocationPointData> items;

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    final textThemeX = context.textThemeExtension;
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorSchemeX.background,
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8)],
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(items[index].name, style: textThemeX.body),
                            if (items[index].description != null)
                              Text(items[index].description!, style: textThemeX.caption),
                          ],
                        ),
                        leading: Icon(
                          FluentIcons.location_16_filled,
                          color: colorSchemeX.switcherActive,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
