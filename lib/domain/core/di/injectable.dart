import 'package:injectable/injectable.dart';

import 'package:get_it/get_it.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;
@InjectableInit(initializerName: 'init')
Future<void> configureInjectable() async {
  await getIt.init(environment: Environment.prod);
}
