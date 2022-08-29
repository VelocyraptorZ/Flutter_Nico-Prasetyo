// void main() async {
//   var scores = [];
//   scores.add(60);
//   scores.add(70);
//   scores.add(80);
//   scores.add(90);
//   scores.add(65);
//   scores.add(75);
//   print(scores);

//   print(scores[0]);
//   print(scores[1]);
//   print(scores[2]);
//   print(scores[3]);
//   print(scores[4]);
// }

void main() {
  var scores = [60, 70, 90, 65, 75];
  print(scores);

  for (var score in scores) {
    print(score);
  }
}
