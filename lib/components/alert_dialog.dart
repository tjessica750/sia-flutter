import 'package:flutter/material.dart';

class AlertDialogUtil {
  static void showConfirmationDialog(BuildContext context, String title,
      String content, void Function() confirmation) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: 500,
            height: 500,
            child: AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      confirmation();
                    },
                    child: const Text('Aceptar'),
                  ),
                ]),
          );
        });
  }

  static void hide() {}
}
