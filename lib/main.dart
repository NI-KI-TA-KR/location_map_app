import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_map/core/assets_gen/localization/strings.g.dart';
import 'package:test_flutter_map/core/di/injectable.dart';
import 'package:test_flutter_map/core/theme/theme_cubit/theme_cubit.dart';
import 'package:test_flutter_map/features/map/domain/bloc/map_location_cubit.dart';
import 'package:test_flutter_map/features/map/presentation/map_screen.dart';
import 'package:test_flutter_map/features/settings/presentation/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  LocaleSettings.setLocale(AppLocale.en);

  runApp(TranslationProvider(child: const TestMyApp()));
}

class TestMyApp extends StatelessWidget {
  const TestMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => di<ThemeCubit>()),
        BlocProvider<MapLocationCubit>(create: (_) => di<MapLocationCubit>()),
      ],
      child: _TestMapApp(),
    );
  }
}

class _TestMapApp extends StatelessWidget {
  const _TestMapApp();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      bloc: di<ThemeCubit>(),
      builder: (context, theme) {
        return MaterialApp(
          title: 'Map Location App',
          routes: {
            MapScreen.path: (_) => MapScreen(),
            SettingsScreen.path: (_) => SettingsScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: theme,
        );
      },
    );
  }
}
