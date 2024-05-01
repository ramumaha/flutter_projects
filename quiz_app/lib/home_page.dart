import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // Opacity(
        //   opacity: 0.1,
        //   child: Image.asset(
        //     'assets/image/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        Image.asset(
          'assets/image/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(221, 249, 246, 246),
        ),
        const SizedBox(
          width: 200,
          height: 50,
        ),
        Text(
          "Learn Flutter the fun way",
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 201, 153, 251),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 200,
          height: 50,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        )
      ]),
    );
  }
}
