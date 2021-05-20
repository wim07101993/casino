import 'package:flutter/widgets.dart';

class TopSafeArea extends StatelessWidget {
  const TopSafeArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).padding.top);
  }
}
