import 'package:flutter/material.dart';


class UserHomeListWidgt extends StatelessWidget {
  final int index;
  const UserHomeListWidgt({Key? key ,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(''),
        ),
      ],
    );
  }
}
