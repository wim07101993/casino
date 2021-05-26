import 'dart:io';

import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:window_size/window_size.dart';

import 'bloc/app_loading_bloc.dart';
import 'home_screen.dart';

final GetIt di = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      setWindowTitle('Slot-machine');
      setWindowMinSize(const Size(800, 600));
    }
  } catch (_) {}
  runApp(const AppLoader());
}

class AppLoader extends StatefulWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  late AppLoadingBloc _appLoadingBloc;

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
    return BlocBuilder<AppLoadingBloc, AppLoadingState>(
      bloc: _appLoadingBloc,
      builder: (context, state) {
        return MaterialApp(
          title: 'Slot-machine',
          debugShowCheckedModeBanner: false,
          theme: state.appTheme?.themeData ?? ThemeData.light(),
          home: Material(
            child: BlocListener(
              bloc: _appLoadingBloc,
              listener: _onStateChange,
              child: Stack(children: [
                if (state.loadingStage == const LoadingStage.loaded())
                  const HomeScreen()
                else
                  _loading(state),
              ]),
            ),
          ),
        );
      },
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
  }
}
