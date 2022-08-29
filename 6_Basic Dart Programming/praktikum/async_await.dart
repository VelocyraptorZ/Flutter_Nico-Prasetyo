// void P1() {
//   Future.delayed(Duration(seconds: 1), () {
//     print('Hello World P1!');
//   });
// }

// void P2() {
//   print('Hello World P2');
// }

// void main() {
//   P1();
//   P2();
// }

Future<void> P1() async {
  await Future.delayed(Duration(seconds: 1), () {
    print('Hello World P1!');
  });
}

void P2() {
  print('Hello World P2');
}

void main() async {
  await P1();
  P2();
}
