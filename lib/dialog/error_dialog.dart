import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/app_globals.dart';
import '../themes/app_theme.dart';

class ErrorDialog extends StatefulWidget {
  final String description;

  const ErrorDialog({super.key, required this.description});

  @override
  State<ErrorDialog> createState() => _ErrorDialog();
}

class _ErrorDialog extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Container(
          decoration: const BoxDecoration(
            color: AppThemes.primaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            "IMPORTANT".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20, fontStyle: FontStyle.normal),
          ),
        ),
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // const Text(
              //   "You Got An Error!",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              // ),
              // const SizedBox(
              //   height: 5.0,
              // ),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        alignment: Alignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppThemes.primaryColor),
                onPressed: () {
                  isErrorDialogShowing = false;
                  Navigator.of(context).pop();
                },
                child: const Text("Okay"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

bool isErrorDialogShowing = false;

/*showErrorDialog(String errorDetail) {
  if (!isErrorDialogShowing) {
    isErrorDialogShowing = true;
    showDialog(
        barrierDismissible: false,
        context: AppGlobals.appNavigationKey.currentContext!,
        builder: (BuildContext context) {
          return ErrorDialog(
            description: errorDetail,
          );
        });
  }
}*/

showErrorDialog(String errorDetail) {
  showCupertinoDialog(
    context: AppGlobals.appNavigationKey.currentContext!,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Alert'),
        content: Text(errorDetail),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}