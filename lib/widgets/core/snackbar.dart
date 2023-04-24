import 'package:flutter/material.dart';

// Show a customized snackbar at the bottom of the scaffold given as key containing the message
void showSnackBarMessage(GlobalKey<ScaffoldState> scaffoldKey, String message) {
  ScaffoldMessenger.of(scaffoldKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 20.0),
    ),
  );
}
