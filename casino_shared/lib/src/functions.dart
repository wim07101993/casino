import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  Widget content,
) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
  BuildContext context,
  Object error,
) {
  return showSnackBar(
    context,
    Text(error.toString(), textAlign: TextAlign.center),
  );
}
