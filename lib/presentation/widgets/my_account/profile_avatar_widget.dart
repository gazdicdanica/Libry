import 'package:flutter/material.dart';
import 'package:flutter_internship_2024_app/theme.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.photoURL,
  });

  final String? photoURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightGreyColor,
            border: Border.all(color: darkGreyColor, width: 6),
          ),
          child: photoURL != null
              ? CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(photoURL!),
                )
              : const Icon(
                  Icons.person_outlined,
                  size: 100,
                  color: darkGreyColor,
                ),
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Container(
        //     width: 40,
        //     height: 40,
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: darkGreenColor,
        //     ),
        //     child: const Icon(
        //       Icons.add,
        //       size: 40,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
