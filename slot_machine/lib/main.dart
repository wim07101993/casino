import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bloc/app_loading_bloc.dart';
import 'home_screen.dart';

final GetIt di = GetIt.instance;

Future<void> main() async {
  // always call this method if the main method is async
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppLoader());
}

class AppLoader extends StatefulWidget {
  const AppLoader({
    Key? key,
  }) : super(key: key);

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  late AppLoadingBloc _appLoadingBloc;
  Color _primaryColor = Colors.blue;
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _appLoadingBloc = AppLoadingBloc()..add(const AppLoadingEvent.load());
  }

  @override
  void dispose() {
    _appLoadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot-machine',
      theme: _isDarkModeEnabled == true ? ThemeData.dark() : ThemeData.light(),
      home: Material(
        child: BlocBuilderListener<AppLoadingBloc, AppLoadingState>.value(
          value: _appLoadingBloc,
          listener: _onStateChange,
          builder: (context, state) {
            return Stack(children: [
              if (state.loadingStage == const LoadingStage.loaded())
                const HomeScreen()
              else
                _loading(state),
            ]);
          },
        ),
      ),
    );
  }

  Widget _loading(AppLoadingState state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 32),
          state.loadingStage.when(
            notLoaded: () => Container(),
            registeringCore: () => const Text('Searching for parts...'),
            loadingHive: () => const Text('Assembling slot-machine...'),
            initializingDI: () => const Text('Securing coin-vault...'),
            gettingId: () => const Text('Searching for play-mate...'),
            gettingTokenCount: () => const Text('Fetching money...'),
            loaded: () => const Text('All done.'),
          ),
        ],
      ),
    );
  }

  void _onStateChange(BuildContext context, AppLoadingState state) {
    final error = state.error;
    if (error != null) {
      showError(context, error);
    }
    if (state.color != _primaryColor) {
      setState(() => _primaryColor = state.color);
    }
    if (state.isDarkModeEnabled != _isDarkModeEnabled) {
      setState(() => _isDarkModeEnabled = state.isDarkModeEnabled);
    }
  }

  ThemeData _theme(ThemeData baseTheme) {
    final textTheme = baseTheme.textTheme;
    final buttonTheme = baseTheme.buttonTheme;
    return baseTheme.copyWith(
      primaryColor: _primaryColor,
      textTheme: baseTheme.textTheme.copyWith(
        headline1: textTheme.headline1?.copyWith(color: _primaryColor),
        headline2: textTheme.headline2?.copyWith(color: _primaryColor),
        headline3: textTheme.headline3?.copyWith(color: _primaryColor),
        headline4: textTheme.headline4?.copyWith(color: _primaryColor),
        headline5: textTheme.headline5?.copyWith(color: _primaryColor),
        headline6: textTheme.headline6?.copyWith(color: _primaryColor),
        subtitle1: textTheme.subtitle1?.copyWith(color: _primaryColor),
        subtitle2: textTheme.subtitle2?.copyWith(color: _primaryColor),
        bodyText1: textTheme.bodyText1?.copyWith(color: _primaryColor),
        bodyText2: textTheme.bodyText2?.copyWith(color: _primaryColor),
        caption: textTheme.caption?.copyWith(color: _primaryColor),
        button: textTheme.button?.copyWith(color: _primaryColor),
      ),
      buttonTheme: buttonTheme.copyWith(
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
