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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Material(
        child: BlocBuilderListener<AppLoadingBloc, AppLoadingState>.value(
          value: _appLoadingBloc,
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              orElse: () => true,
              loaded: () => false,
            );
            return Stack(children: [
              if (isLoading) _loading(state) else const HomeScreen(),
            ]);
          },
          listener: _onStateChange,
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
          state.when(
            initial: () => Container(),
            registeringCore: () => const Text("Searching for parts..."),
            loadingHive: () => const Text("Assembling slot-machine..."),
            initializingDI: () => const Text("Securing coin-vault..."),
            gettingId: () => const Text("Searching for play-mate..."),
            gettingTokenCount: () => const Text("Fetching money..."),
            loaded: () => const Text("All done."),
            error: (e) => const Text("Failed loading the app..."),
          ),
        ],
      ),
    );
  }

  void _onStateChange(BuildContext context, AppLoadingState state) {
    state.maybeWhen(
      orElse: () {},
      error: (e) => showError(context, e),
    );
  }
}
