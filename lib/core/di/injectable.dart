import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final di = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => di.init();
