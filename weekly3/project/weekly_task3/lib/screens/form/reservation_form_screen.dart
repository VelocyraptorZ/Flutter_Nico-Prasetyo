import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task3/model/reservation_model.dart';

import 'reservation_view_model.dart';

class ReservationFormScreen extends StatefulWidget {
  final ReservationModel? reservationModel;
  const ReservationFormScreen({Key? key, this.reservationModel})
      : super(key: key);

  @override
  State<ReservationFormScreen> createState() => _ReservationFormScreenState();
}

class _ReservationFormScreenState extends State<ReservationFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final TextEditingController _FirstNameController = TextEditingController();
  String firstName = '';
  // ignore: non_constant_identifier_names
  final TextEditingController _LastNameController = TextEditingController();
  String lastName = '';
  // ignore: non_constant_identifier_names
  final TextEditingController _EmailController = TextEditingController();
  String email = '';
  // ignore: non_constant_identifier_names
  final TextEditingController _ProblemController = TextEditingController();
  String problem = '';

  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.reservationModel != null) {
      _FirstNameController.text = widget.reservationModel!.FirstName;
      _LastNameController.text = widget.reservationModel!.LastName;
      _EmailController.text = widget.reservationModel!.Email;
      _ProblemController.text = widget.reservationModel!.Problem;
      _isUpdate = true;
    }
  }

  @override
  void dispose() {
    _FirstNameController.dispose();
    _LastNameController.dispose();
    _EmailController.dispose();
    _ProblemController.dispose();
    super.dispose();
  }

  void setText() {
    setState(() {
      firstName = _FirstNameController.text;
      lastName = _LastNameController.text;
      email = _EmailController.text;
      problem = _ProblemController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Reservation')),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Text('First Name'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Text('Last Name'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _FirstNameController,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Depan tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: TextFormField(
                            controller: _LastNameController,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Belakang tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Text('Email'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _EmailController,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (email) {
                              if (email != null &&
                                  !EmailValidator.validate(email)) {
                                return 'Email harus benar';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: SizedBox(
                      child: Text('What can we help you?'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _ProblemController,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Isi tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 100,
                child: ElevatedButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() && !_isUpdate) {
                      setText();
                      showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Your Data Submit'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name : $firstName $lastName'),
                              Text('Email : $email'),
                              Text('Your Problem : $problem'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                final reservation = ReservationModel(
                                  FirstName: _FirstNameController.text,
                                  LastName: _LastNameController.text,
                                  Email: _EmailController.text,
                                  Problem: _ProblemController.text,
                                );
                                Provider.of<ReservationViewModel>(context,
                                        listen: false)
                                    .addReservation(reservation);
                                _FirstNameController.clear();
                                _LastNameController.clear();
                                _EmailController.clear();
                                _ProblemController.clear();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Data Has Been Submitted')),
                                );
                              },
                              child: const Text('OK'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'CANCEL'),
                              child: const Text('CANCEL'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      setText();
                      showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Your Data Update'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name : $firstName $lastName'),
                              Text('Email : $email'),
                              Text('Your Problem : $problem'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                final reservation = ReservationModel(
                                  id: widget.reservationModel!.id,
                                  FirstName: _FirstNameController.text,
                                  LastName: _LastNameController.text,
                                  Email: _EmailController.text,
                                  Problem: _ProblemController.text,
                                );
                                Provider.of<ReservationViewModel>(context,
                                        listen: false)
                                    .updateReservation(reservation);
                                _FirstNameController.clear();
                                _LastNameController.clear();
                                _EmailController.clear();
                                _ProblemController.clear();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Data Has Been Updated')),
                                );
                              },
                              child: const Text('OK'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'CANCEL'),
                              child: const Text('CANCEL'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
