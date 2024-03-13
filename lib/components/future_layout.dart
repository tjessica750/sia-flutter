import 'package:flutter/material.dart';

class FutureLayout<T> extends StatelessWidget {
  final Function(T values)? callback;
  final Future<T> future;
  final Widget child;
  final dynamic initialData;

  const FutureLayout(
      {super.key,
      required this.future,
      required this.child,
      this.callback,
      this.initialData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        initialData: initialData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              callback?.call(snapshot.data as T);
            });

            return child;
          }

          return const Center(
            child: Text('future loader error'),
          );
        });
  }
}
