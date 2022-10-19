import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task3/component/reservation_item.dart';
import 'reservation_form_screen.dart';
import 'reservation_view_model.dart';

class ReservationListScreen extends StatelessWidget {
  final ReservationViewModel manager;
  const ReservationListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ReservationViewModel>(
          builder: (context, manager, child) {
            final reservationItems = manager.reservationModels;
            return ListView.separated(
              itemCount: reservationItems.length,
              itemBuilder: (context, index) {
                final item = reservationItems[index];
                return InkWell(
                  onTap: () async {
                    final selectedTask =
                        await manager.getReservationById(item.id!);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReservationFormScreen(
                          reservationModel: selectedTask,
                        ),
                      ),
                    );
                  },
                  child: ReservationItem(
                    reservation: item,
                    onPressed: () {
                      manager.deleteReservation(item.id!);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.FirstName} Deleted')),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ));
  }
}
