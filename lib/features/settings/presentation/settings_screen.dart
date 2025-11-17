import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_map/core/assets_gen/localization/strings.g.dart';
import 'package:test_flutter_map/core/di/injectable.dart';
import 'package:test_flutter_map/core/theme/theme_cubit/theme_cubit.dart';
import 'package:test_flutter_map/features/map/domain/bloc/map_location_cubit.dart';
import 'package:test_flutter_map/features/settings/presentation/widgets/point_settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const path = '/settings_screen';

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(translations.map.settings)),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ThemeCubit, ThemeData>(
              bloc: di<ThemeCubit>(),
              builder: (_, __) {
                return PointSettingWidget(
                  title: translations.settings.SwitchTheTheme.theme,
                  children: [
                    PointSwitcherWidget<TypeTheme>(
                      value: !di<ThemeCubit>().isDark,
                      id: TypeTheme.light,
                      text: translations.settings.SwitchTheTheme.light,
                      onChanged: (value) => di<ThemeCubit>().setTheme(value),
                    ),
                    PointSwitcherWidget<TypeTheme>(
                      value: di<ThemeCubit>().isDark,
                      id: TypeTheme.dark,
                      text: translations.settings.SwitchTheTheme.dark,
                      onChanged: (value) => di<ThemeCubit>().setTheme(value),
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<MapLocationCubit, MapLocationState>(
              bloc: di<MapLocationCubit>(),
              builder: (context, state) {
                return PointSettingWidget(
                  title: translations.settings.SwithTheDB.db,
                  children: [
                    PointSwitcherWidget<TypeDB>(
                      value: di<MapLocationCubit>().isDrift,
                      id: TypeDB.drift,
                      text: translations.settings.SwithTheDB.drift,
                      onChanged: (value) => di<MapLocationCubit>().setDateBase(value),
                    ),
                    PointSwitcherWidget<TypeDB>(
                      value: !di<MapLocationCubit>().isDrift,
                      id: TypeDB.sqlite,
                      text: translations.settings.SwithTheDB.sqlite,
                      onChanged: (value) => di<MapLocationCubit>().setDateBase(value),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
