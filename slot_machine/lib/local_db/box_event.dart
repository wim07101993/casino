import 'package:hive/hive.dart' as hive;

class BoxEvent<T> extends hive.BoxEvent {
  // ignore: avoid_positional_boolean_parameters
  BoxEvent(dynamic key, T value, bool deleted) : super(key, value, deleted);

  @override
  T get value => super.value as T;
}
