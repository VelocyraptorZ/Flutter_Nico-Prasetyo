import 'package:flutter/material.dart';
import '../../helper/database_helper.dart';
import '../../model/reservation_model.dart';

class ReservationViewModel extends ChangeNotifier {
  List<ReservationModel> _reservationModels = [];
  List<ReservationModel> get reservationModels => _reservationModels;
  late DatabaseHelper _dbHelper;

  ReservationViewModel() {
    _dbHelper = DatabaseHelper();
    _getAllReservation();
  }

  void _getAllReservation() async {
    _reservationModels = await _dbHelper.getReservation();
    notifyListeners();
  }

  Future<void> addReservation(ReservationModel reservationModel) async {
    await _dbHelper.insertReservation(reservationModel);
    _getAllReservation();
  }

  Future<ReservationModel> getReservationById(int id) async {
    return await _dbHelper.getReservationById(id);
  }

  void updateReservation(ReservationModel reservationModel) async {
    await _dbHelper.updateReservation(reservationModel);
    _getAllReservation();
  }

  void deleteReservation(int id) async {
    await _dbHelper.deleteReservation(id);
    _getAllReservation();
  }
}
