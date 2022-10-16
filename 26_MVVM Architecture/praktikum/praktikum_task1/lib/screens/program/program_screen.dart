import 'package:flutter/material.dart';
import 'package:praktikum_task1/screens/home/home_page.dart';
import 'package:provider/provider.dart';
import 'program_view_model.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProgramViewModel>(context, listen: false).getAllPrograms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ProgramViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
      ),
      body: ListView.builder(
          itemCount: modelView.programs.length,
          itemBuilder: (context, index) {
            final program = modelView.programs[index];
            return ListTile(
              title: Text(program.name),
              subtitle: Text(program.program),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
