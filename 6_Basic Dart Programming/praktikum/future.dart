Future<String> P1() async {
  return Future.delayed(Duration(seconds: 1), () {
    return 'Hello World P1!';
  });
}

void main() async {
  var data = await P1();
  print(data);
}
