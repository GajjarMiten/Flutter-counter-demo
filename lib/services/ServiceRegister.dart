import './Counter.service.dart';
import 'package:get_it/get_it.dart';

void registerServices() {
  GetIt.I.registerSingleton(CounterService());
}
