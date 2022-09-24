import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weekly_task1/screen/form_screen.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 60, 10, 60),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'Need to get in touch with us? Either fill out the form with your inquiry or find the ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Form Reservation',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormSheet(),
                          ),
                        );
                      },
                  ),
                  const TextSpan(
                    text: ' you would like to contact below',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
