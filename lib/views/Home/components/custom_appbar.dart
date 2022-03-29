import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 221, 146, 59),
        ),
        Row(
          children: const [
            Icon(
              Icons.location_on,
              color: Color.fromARGB(255, 7, 63, 9),
              size: 30,
            ),
            Text(
              "kano,Nigeria",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5),
            ),
          ],
        ),
        const Icon(
          Icons.notifications_none_sharp,
          size: 30,
        )
      ],
    );
  }
}
