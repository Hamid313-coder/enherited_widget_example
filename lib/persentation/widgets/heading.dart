import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
    );
  }
}
