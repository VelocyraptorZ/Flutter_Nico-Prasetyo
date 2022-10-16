class Program {
  final String name;
  final String program;

  Program({
    required this.name,
    required this.program,
  });

  Map toJson() => {
        'name': name,
        'program': program,
      };

  Program.fromJson(Map map)
      : name = map['name'],
        program = map['program'];
}
