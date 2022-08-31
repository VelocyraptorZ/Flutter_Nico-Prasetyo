// import 'dart:io';

void main() {
  // stdout.write("Input a number : ");
  // int score = int.parse(stdin.readLineSync()!);
  // print(nilai(score));

  print(nilai(80));
}

String nilai(int score) {
  if (score > 70) {
    return 'A';
  } else if (score > 40) {
    return 'B';
  } else if (score > 0) {
    return 'C';
  } else {
    return '';
  }
}
