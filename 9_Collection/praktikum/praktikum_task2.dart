// void main() {
//   List<String> sports = ['cricket', 'football', 'tennis', 'baseball'];
//   Map<int, String> map = sports.asMap();

//   print(sports);
//   print(map);
// }

void main() {
  List<List<int>> nums = [];

  for (int i = 0; i < 5; i++) {
    List<int> num = [];
    num.add(i + 1);
    num.add(i + 2);
    nums.add(num);
  }

  Map<int, List<int>> map = nums.asMap();

  print(nums);
  print(map);
}

// void main() {
//   int n = 2;
//   List<List<int>> num = new List.filled(n, []);

//   for (int i = 0; i < n; i++)
//     for (int j = i + 1; j < n; j++) {
//       num[i].add(1);
//       num[j].add(1);
//     }

//   Map<int, List<int>> map = num.asMap();

//   print(num);
//   print(map);
// }