import 'local_db/box_entry.dart';

abstract class GlobalListenableProperty<T> {
  Future<T> call();
  Future<void> set(T value);
  Stream<T> get changes;
}

class BoxEntryWrapper<T> implements GlobalListenableProperty<T> {
  const BoxEntryWrapper({
    required BoxEntry<T> Function() selector,
  }) : _selector = selector;

  final BoxEntry<T> Function() _selector;

  @override
  Future<T> call() => _selector()();
  @override
  Future<void> set(T value) => _selector().set(value);
  @override
  Stream<T> get changes => _selector().changes.map((e) => e);
}
