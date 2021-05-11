import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';

import 'domain/token_count.dart' as domain;
import 'main.dart';

class TokenCount extends StatefulWidget {
  const TokenCount({Key? key}) : super(key: key);

  @override
  _TokenCountState createState() => _TokenCountState();
}

class _TokenCountState extends State<TokenCount> {
  late domain.TokenCount tokenCount;

  @override
  void initState() {
    super.initState();
    tokenCount = di();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: tokenCount(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          showError(context, snapshot.error!);
        }
        if (!snapshot.hasData) {
          return _text(0);
        }
        return StreamBuilder<int>(
          initialData: snapshot.data,
          stream: tokenCount.changes(),
          builder: (context, snapshot) => _text(snapshot.data ?? 0),
        );
      },
    );
  }

  Widget _text(int tokenCount) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline5,
        children: [
          const TextSpan(text: 'Tokens: '),
          TextSpan(text: tokenCount.toString()),
        ],
      ),
    );
  }
}
