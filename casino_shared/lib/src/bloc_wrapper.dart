import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderListener<TBloc extends BlocBase<TState>, TState>
    extends StatelessWidget {
  BlocBuilderListener({
    Key? key,
    required TBloc Function(BuildContext context) create,
    required this.builder,
    required this.listener,
  })   : _providerBuilder = _buildWithCreate(create),
        super(key: key);

  BlocBuilderListener.value({
    Key? key,
    required TBloc value,
    required this.builder,
    required this.listener,
  })   : _providerBuilder = _buildWithValue(value),
        super(key: key);

  final Widget Function(Widget child) _providerBuilder;
  final void Function(BuildContext context, TState state) listener;
  final Widget Function(BuildContext context, TState state) builder;

  @override
  Widget build(BuildContext context) {
    return _providerBuilder(
      BlocListener<TBloc, TState>(
        listener: listener,
        child: BlocBuilder<TBloc, TState>(
          builder: builder,
        ),
      ),
    );
  }

  static Widget Function(Widget child)
      _buildWithCreate<TBloc extends BlocBase<Object?>>(
    TBloc Function(BuildContext) create,
  ) {
    return (child) => BlocProvider(create: create, child: child);
  }

  static Widget Function(Widget child)
      _buildWithValue<TBloc extends BlocBase<Object?>>(TBloc value) {
    return (child) => BlocProvider.value(value: value, child: child);
  }
}
