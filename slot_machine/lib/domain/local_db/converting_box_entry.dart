import 'package:flutter/painting.dart';
import 'package:hive/hive.dart' hide BoxEvent;

import 'box_entry.dart';

class ConvertingBoxEntry<TIn, TOut> implements BoxEntry<TOut> {
  ConvertingBoxEntry({
    required Future<Box> box,
    required String key,
    required TOut defaultValue,
    required this.toutToTin,
    required this.tinToTout,
    int saveDelay = 1000,
  }) : _baseEntry = BoxEntry(
          box: box,
          key: key,
          defaultValue: toutToTin(defaultValue),
          saveDelay: saveDelay,
        );

  final BoxEntry<TIn> _baseEntry;
  final TOut Function(TIn) tinToTout;
  final TIn Function(TOut) toutToTin;

  @override
  Future<Box> get box => _baseEntry.box;

  @override
  TOut get defaultValue => tinToTout(_baseEntry.defaultValue);

  @override
  String get key => _baseEntry.key;

  @override
  Future<TOut> call() => _baseEntry().then(tinToTout);

  @override
  Future<void> set(TOut value) => _baseEntry.set(toutToTin(value));

  @override
  Stream<TOut> get changes => _baseEntry.changes.map(tinToTout);
}

int colorToInt(Color c) => c.value;
Color intToColor(int i) => Color(i);

String uriToString(Uri uri) => uri.toString();
Uri stringToUri(String s) => Uri.parse(s);
