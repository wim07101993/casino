import 'dart:math';

import 'data.dart' as data;

class NameGenerator {
  const NameGenerator({
    required Random random,
    this.names = data.names,
    this.adjectives = data.adjectives,
    this.separator = '-',
  }) : _random = random;

  final Random _random;
  final List<String> names;
  final List<String> adjectives;
  final String separator;

  String call() {
    final randomName = names[_random.nextInt(names.length)];
    final randomAdjective = adjectives[_random.nextInt(adjectives.length)];
    return '$randomAdjective$separator$randomName';
  }
}
