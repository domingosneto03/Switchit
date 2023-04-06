import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String? cancelActionText,
  required String defaultActionText,
  required VoidCallback? onDefaultActionPressed,
}) {
  if (context.mounted) {
    if (!Platform.isIOS) {
      if (cancelActionText != null) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(cancelActionText),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text(defaultActionText),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  onDefaultActionPressed!();
                },
              ),
            ],
          ),
        );
      } else {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(defaultActionText),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  onDefaultActionPressed!();
                },
              ),
            ],
          ),
        );
      }
    }

    if (cancelActionText != null) {
      return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
                child: Text(cancelActionText),
                onPressed: () => Navigator.of(context).pop(false)),
            CupertinoDialogAction(
              child: Text(defaultActionText),
              onPressed: () {
                Navigator.of(context).pop(false);
                onDefaultActionPressed!();
              },
            ),
          ],
        ),
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(defaultActionText),
              onPressed: () {
                Navigator.of(context).pop(false);
                onDefaultActionPressed!();
              },
            ),
          ],
        ),
      );
    }
  } else {
    return Future(() => null);
  }
}
