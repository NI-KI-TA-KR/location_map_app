import 'package:flutter/cupertino.dart';
import 'package:test_flutter_map/core/extensions/context_x.dart';
import 'package:test_flutter_map/core/theme/border_radius_constants.dart';

class PointSettingWidget extends StatelessWidget {
  final String title;
  final List<PointSwitcherWidget> children;

  const PointSettingWidget({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    final textThemeX = context.textThemeExtension;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusConstants.circular4,
        border: Border.all(width: 0.5, color: colorSchemeX.title),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: textThemeX.body!.copyWith(color: colorSchemeX.title)),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class PointSwitcherWidget<T> extends StatelessWidget {
  final T id;
  final String text;
  final bool value;
  final ValueChanged<T> onChanged;

  const PointSwitcherWidget({
    super.key,
    required this.value,
    required this.id,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorSchemeX = context.colorSchemeExtension;
    final textThemeX = context.textThemeExtension;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text, style: textThemeX.caption),
        CupertinoSwitch(
          activeTrackColor: colorSchemeX.switcherActive,
          inactiveTrackColor: colorSchemeX.switcherInActive,
          thumbColor: colorSchemeX.switcherIndicator,
          value: value,
          onChanged: (value) => onChanged(id),
        ),
      ],
    );
  }
}
