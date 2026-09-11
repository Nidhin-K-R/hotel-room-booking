import 'package:hotel_booking/models/room_model.dart';

class CustomerModel {
  final String name;
  final String phone;
  final String checkInDate;
  final String checkOutDate;
  final List<RoomModel> roomData;
  final double amount;
  final int stayDay;
  CustomerModel({
    required this.name,
    required this.phone,
    required this.checkInDate,
    required this.checkOutDate,
    required this.roomData,
    required this.amount,
    required this.stayDay,
  });
}
