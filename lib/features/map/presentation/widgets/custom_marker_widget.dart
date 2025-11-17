import 'package:flutter/material.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';
import 'package:test_flutter_map/core/theme/border_radius_constants.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';
import 'package:test_flutter_map/features/map/presentation/widgets/info_card.dart';

class CustomMarkerWidget extends StatelessWidget {
  final LocationPointData item;

  const CustomMarkerWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    final textThemeX = context.textThemeExtension;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => InfoCard(title: item.name, description: item.description),
        );
      },
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorSchemeX.title,
          borderRadius: BorderRadiusConstants.circular36,
        ),
        child: Text(
          item.type,
          style: textThemeX.caption!.copyWith(fontSize: 10, color: colorSchemeX.background),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
