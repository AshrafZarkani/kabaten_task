// import 'package:flutter/material.dart';
//
// Future showMyDialog(String val, BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: const Text("Error"),
//             content: Text(val.toString()),
//             actions: [
//               TextButton(
//                   child: const Text("OK"),
//                   onPressed: () => Navigator.pop(context))
//             ],
//           ));
// }
import 'package:flutter/material.dart';
import 'package:kabaten_task/main.dart';

class GlobalNavigator {
  static showAlertDialog(String text) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
