import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';

import 'domain/name.dart' as domain;
import 'main.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  late domain.Name name;

  @override
  void initState() {
    super.initState();
    name = di();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: name(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          showError(context, snapshot.error!);
        }
        if (!snapshot.hasData) {
          return Container();
        }
        return StreamBuilder<String>(
          initialData: snapshot.data,
          stream: name.changes(),
          builder: (context, snapshot) => Text(
            snapshot.data ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
        );
      },
    );
  }
}
