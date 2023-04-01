import 'package:flutter/material.dart';

Future showMyDialog(String val, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(val.toString()),
            actions: [
              TextButton(
                  child: const Text("OK"),
                  onPressed: () => Navigator.pop(context))
            ],
          ));
}
