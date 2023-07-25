import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  final int points = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            '$points'
          ),
        ),
        Flexible(
          child: Text(
            'LvL Up',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // TODO : Give option whether to keep as scratched or delete completed
        // TODO > tasks
        Flexible(
          child: IconButton(
            onPressed: () => 0,
            icon: const Icon(Icons.settings),
          )
        ),
      ],
    );
  }
}
