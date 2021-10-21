import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.blue,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
        ),
        Text(
          'Testler',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Expanded(
            child: Divider(
          color: Colors.blue,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        )),
      ],
    );
  }
}
