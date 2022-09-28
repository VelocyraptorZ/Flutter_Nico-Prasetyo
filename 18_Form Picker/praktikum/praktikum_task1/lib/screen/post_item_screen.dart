import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:praktikum_task1/models/post_model.dart';
import 'package:uuid/uuid.dart';

class PostItemScreen extends StatefulWidget {
  final Function(PostModel) onCreate;
  const PostItemScreen({super.key, required this.onCreate});

  @override
  State<PostItemScreen> createState() => _PostItemScreenState();
}

class _PostItemScreenState extends State<PostItemScreen> {
  final _dayController = TextEditingController();
  final _captionController = TextEditingController();
  // final TextEditingController _themeController = TextEditingController();
  Color _currentColor = Colors.blue;

  PlatformFile _coverController = PlatformFile(name: '', size: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildCoverField(),
            const SizedBox(
              height: 16,
            ),
            buildDateField(),
            const SizedBox(
              height: 16,
            ),
            buildColorField(),
            const SizedBox(
              height: 16,
            ),
            buildCaptionField(),
            const SizedBox(
              height: 16,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildCoverField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cover',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            child: const Text('Choose File'),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result == null) return;

              _coverController = result.files.first;
            },
          ),
        )
      ],
    );
  }

  Widget buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Publish At',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _dayController,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            labelText: "dd/mm/yyyy",
          ),
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              initialDate: DateTime.now(),
              selectableDayPredicate: (day) => day.isBefore(DateTime.now()),
            );
            if (selectedDate != null) {
              setState(() {
                _dayController.text =
                    DateFormat('dd/MM/yyyy').format(selectedDate);
              });
            }
          },
        )
      ],
    );
  }

  Widget buildColorField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Theme',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: _currentColor, borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            child: const Text('Pick Color'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick Your Color'),
                      content: BlockPicker(
                        pickerColor: _currentColor,
                        onColorChanged: (color) {
                          setState(() {
                            _currentColor = color;
                            // _themeController.text = _currentColor;
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Save'))
                      ],
                    );
                  });
            },
          ),
        )
      ],
    );
  }

  Widget buildCaptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Caption',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _captionController,
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: '',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Isi tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: Text(
        'Submit',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        final postItem = PostModel(
          id: const Uuid().v1(),
          cover: _coverController,
          day: _dayController.text,
          theme: _currentColor,
          caption: _captionController.text,
        );
        widget.onCreate(postItem);
      },
    );
  }
}
