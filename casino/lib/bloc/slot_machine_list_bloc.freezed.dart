// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'slot_machine_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SlotMachineListEventTearOff {
  const _$SlotMachineListEventTearOff();

  _AddSlotMachine addSlotMachine({required String name}) {
    return _AddSlotMachine(
      name: name,
    );
  }

  _RemoveSlotMachine removeSlotMachine({required String id}) {
    return _RemoveSlotMachine(
      id: id,
    );
  }
}

/// @nodoc
const $SlotMachineListEvent = _$SlotMachineListEventTearOff();

/// @nodoc
mixin _$SlotMachineListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) addSlotMachine,
    required TResult Function(String id) removeSlotMachine,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? addSlotMachine,
    TResult Function(String id)? removeSlotMachine,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddSlotMachine value) addSlotMachine,
    required TResult Function(_RemoveSlotMachine value) removeSlotMachine,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddSlotMachine value)? addSlotMachine,
    TResult Function(_RemoveSlotMachine value)? removeSlotMachine,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineListEventCopyWith<$Res> {
  factory $SlotMachineListEventCopyWith(SlotMachineListEvent value,
          $Res Function(SlotMachineListEvent) then) =
      _$SlotMachineListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SlotMachineListEventCopyWithImpl<$Res>
    implements $SlotMachineListEventCopyWith<$Res> {
  _$SlotMachineListEventCopyWithImpl(this._value, this._then);

  final SlotMachineListEvent _value;
  // ignore: unused_field
  final $Res Function(SlotMachineListEvent) _then;
}

/// @nodoc
abstract class _$AddSlotMachineCopyWith<$Res> {
  factory _$AddSlotMachineCopyWith(
          _AddSlotMachine value, $Res Function(_AddSlotMachine) then) =
      __$AddSlotMachineCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$AddSlotMachineCopyWithImpl<$Res>
    extends _$SlotMachineListEventCopyWithImpl<$Res>
    implements _$AddSlotMachineCopyWith<$Res> {
  __$AddSlotMachineCopyWithImpl(
      _AddSlotMachine _value, $Res Function(_AddSlotMachine) _then)
      : super(_value, (v) => _then(v as _AddSlotMachine));

  @override
  _AddSlotMachine get _value => super._value as _AddSlotMachine;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_AddSlotMachine(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_AddSlotMachine implements _AddSlotMachine {
  const _$_AddSlotMachine({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'SlotMachineListEvent.addSlotMachine(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddSlotMachine &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$AddSlotMachineCopyWith<_AddSlotMachine> get copyWith =>
      __$AddSlotMachineCopyWithImpl<_AddSlotMachine>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) addSlotMachine,
    required TResult Function(String id) removeSlotMachine,
  }) {
    return addSlotMachine(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? addSlotMachine,
    TResult Function(String id)? removeSlotMachine,
    required TResult orElse(),
  }) {
    if (addSlotMachine != null) {
      return addSlotMachine(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddSlotMachine value) addSlotMachine,
    required TResult Function(_RemoveSlotMachine value) removeSlotMachine,
  }) {
    return addSlotMachine(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddSlotMachine value)? addSlotMachine,
    TResult Function(_RemoveSlotMachine value)? removeSlotMachine,
    required TResult orElse(),
  }) {
    if (addSlotMachine != null) {
      return addSlotMachine(this);
    }
    return orElse();
  }
}

abstract class _AddSlotMachine implements SlotMachineListEvent {
  const factory _AddSlotMachine({required String name}) = _$_AddSlotMachine;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddSlotMachineCopyWith<_AddSlotMachine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemoveSlotMachineCopyWith<$Res> {
  factory _$RemoveSlotMachineCopyWith(
          _RemoveSlotMachine value, $Res Function(_RemoveSlotMachine) then) =
      __$RemoveSlotMachineCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$RemoveSlotMachineCopyWithImpl<$Res>
    extends _$SlotMachineListEventCopyWithImpl<$Res>
    implements _$RemoveSlotMachineCopyWith<$Res> {
  __$RemoveSlotMachineCopyWithImpl(
      _RemoveSlotMachine _value, $Res Function(_RemoveSlotMachine) _then)
      : super(_value, (v) => _then(v as _RemoveSlotMachine));

  @override
  _RemoveSlotMachine get _value => super._value as _RemoveSlotMachine;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_RemoveSlotMachine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_RemoveSlotMachine implements _RemoveSlotMachine {
  const _$_RemoveSlotMachine({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'SlotMachineListEvent.removeSlotMachine(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RemoveSlotMachine &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$RemoveSlotMachineCopyWith<_RemoveSlotMachine> get copyWith =>
      __$RemoveSlotMachineCopyWithImpl<_RemoveSlotMachine>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) addSlotMachine,
    required TResult Function(String id) removeSlotMachine,
  }) {
    return removeSlotMachine(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? addSlotMachine,
    TResult Function(String id)? removeSlotMachine,
    required TResult orElse(),
  }) {
    if (removeSlotMachine != null) {
      return removeSlotMachine(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddSlotMachine value) addSlotMachine,
    required TResult Function(_RemoveSlotMachine value) removeSlotMachine,
  }) {
    return removeSlotMachine(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddSlotMachine value)? addSlotMachine,
    TResult Function(_RemoveSlotMachine value)? removeSlotMachine,
    required TResult orElse(),
  }) {
    if (removeSlotMachine != null) {
      return removeSlotMachine(this);
    }
    return orElse();
  }
}

abstract class _RemoveSlotMachine implements SlotMachineListEvent {
  const factory _RemoveSlotMachine({required String id}) = _$_RemoveSlotMachine;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RemoveSlotMachineCopyWith<_RemoveSlotMachine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SlotMachineListStateTearOff {
  const _$SlotMachineListStateTearOff();

  _SlotMachineListState call(
      {List<SlotMachine> slotMachines = const [],
      bool isLoading = false,
      Object? error}) {
    return _SlotMachineListState(
      slotMachines: slotMachines,
      isLoading: isLoading,
      error: error,
    );
  }
}

/// @nodoc
const $SlotMachineListState = _$SlotMachineListStateTearOff();

/// @nodoc
mixin _$SlotMachineListState {
  List<SlotMachine> get slotMachines => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SlotMachineListStateCopyWith<SlotMachineListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineListStateCopyWith<$Res> {
  factory $SlotMachineListStateCopyWith(SlotMachineListState value,
          $Res Function(SlotMachineListState) then) =
      _$SlotMachineListStateCopyWithImpl<$Res>;
  $Res call({List<SlotMachine> slotMachines, bool isLoading, Object? error});
}

/// @nodoc
class _$SlotMachineListStateCopyWithImpl<$Res>
    implements $SlotMachineListStateCopyWith<$Res> {
  _$SlotMachineListStateCopyWithImpl(this._value, this._then);

  final SlotMachineListState _value;
  // ignore: unused_field
  final $Res Function(SlotMachineListState) _then;

  @override
  $Res call({
    Object? slotMachines = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      slotMachines: slotMachines == freezed
          ? _value.slotMachines
          : slotMachines // ignore: cast_nullable_to_non_nullable
              as List<SlotMachine>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
abstract class _$SlotMachineListStateCopyWith<$Res>
    implements $SlotMachineListStateCopyWith<$Res> {
  factory _$SlotMachineListStateCopyWith(_SlotMachineListState value,
          $Res Function(_SlotMachineListState) then) =
      __$SlotMachineListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SlotMachine> slotMachines, bool isLoading, Object? error});
}

/// @nodoc
class __$SlotMachineListStateCopyWithImpl<$Res>
    extends _$SlotMachineListStateCopyWithImpl<$Res>
    implements _$SlotMachineListStateCopyWith<$Res> {
  __$SlotMachineListStateCopyWithImpl(
      _SlotMachineListState _value, $Res Function(_SlotMachineListState) _then)
      : super(_value, (v) => _then(v as _SlotMachineListState));

  @override
  _SlotMachineListState get _value => super._value as _SlotMachineListState;

  @override
  $Res call({
    Object? slotMachines = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_SlotMachineListState(
      slotMachines: slotMachines == freezed
          ? _value.slotMachines
          : slotMachines // ignore: cast_nullable_to_non_nullable
              as List<SlotMachine>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
class _$_SlotMachineListState implements _SlotMachineListState {
  const _$_SlotMachineListState(
      {this.slotMachines = const [], this.isLoading = false, this.error});

  @JsonKey(defaultValue: const [])
  @override
  final List<SlotMachine> slotMachines;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SlotMachineListState(slotMachines: $slotMachines, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SlotMachineListState &&
            (identical(other.slotMachines, slotMachines) ||
                const DeepCollectionEquality()
                    .equals(other.slotMachines, slotMachines)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(slotMachines) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$SlotMachineListStateCopyWith<_SlotMachineListState> get copyWith =>
      __$SlotMachineListStateCopyWithImpl<_SlotMachineListState>(
          this, _$identity);
}

abstract class _SlotMachineListState implements SlotMachineListState {
  const factory _SlotMachineListState(
      {List<SlotMachine> slotMachines,
      bool isLoading,
      Object? error}) = _$_SlotMachineListState;

  @override
  List<SlotMachine> get slotMachines => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Object? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SlotMachineListStateCopyWith<_SlotMachineListState> get copyWith =>
      throw _privateConstructorUsedError;
}
