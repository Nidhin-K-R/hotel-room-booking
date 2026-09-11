import 'package:flutter/material.dart';
import 'package:hotel_booking/models/customer_model.dart';
import 'package:hotel_booking/models/room_model.dart';
import 'package:intl/intl.dart';

class AppProvider extends ChangeNotifier {
  DateTime? selectedCheckInDate;
  DateTime? selectedCheckOutDate;
  TextEditingController checkInDateController = TextEditingController();
  TextEditingController checkOutDateController = TextEditingController();
  String get formattedCheckInDate {
    if (selectedCheckInDate == null) {
      return '';
    }

    return DateFormat('dd/MM/yyyy').format(selectedCheckInDate!);
  }

  String get formattedCheckOutDate {
    if (selectedCheckOutDate == null) {
      return '';
    }

    return DateFormat('dd/MM/yyyy').format(selectedCheckOutDate!);
  }

  // Calendar selection
  Future<void> selectDate(bool isCheckIn, BuildContext context) async {
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final tommorrow = today.add(Duration(days: 1));
    final date = await showDatePicker(
      context: context,

      // Open calendar on selected date or today
      initialDate: isCheckIn
          ? selectedCheckInDate ?? today
          : selectedCheckOutDate ?? tommorrow,

      // Disable past dates
      firstDate: isCheckIn ? today : tommorrow,

      // Allow future dates
      lastDate: DateTime(2100),
    );

    if (date == null) return;
    if (isCheckIn) {
      selectedCheckInDate = date;
    } else {
      selectedCheckOutDate = date;
    }
    notifyListeners();
  }

  // Validate whether date is in the past
  bool isPastDate(DateTime date) {
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);

    return date.isBefore(today);
  }

  // calculation of total stay days
  int calculateTotalStay() {
    if (selectedCheckInDate != null && selectedCheckOutDate != null) {
      int days = selectedCheckOutDate!.difference(selectedCheckInDate!).inDays;
      return days;
    } else {
      return 0;
    }
  }

  //  room section

  //--------- 3 diferent rooms----
  List<RoomModel> deluxRoom = [
    RoomModel(type: 'delux', status: true, roomNo: '101'),
    RoomModel(type: 'delux', status: true, roomNo: '102'),
    RoomModel(type: 'delux', status: true, roomNo: '103'),
    RoomModel(type: 'delux', status: true, roomNo: '104'),
  ];
  List<RoomModel> executiveRoom = [
    RoomModel(type: 'executive', status: true, roomNo: '201'),
    RoomModel(type: 'executive', status: true, roomNo: '202'),
    RoomModel(type: 'executive', status: true, roomNo: '203'),
    RoomModel(type: 'executive', status: true, roomNo: '204'),
  ];
  List<RoomModel> normalRoom = [
    RoomModel(type: 'normal', status: true, roomNo: '301'),
    RoomModel(type: 'normal', status: true, roomNo: '302'),
    RoomModel(type: 'normal', status: true, roomNo: '303'),
    RoomModel(type: 'normal', status: true, roomNo: '304'),
  ];
  List<RoomModel> selectedRoomList = [];
  // select room function
  // the selected room update to customer list then not change the room color
  void selectRoom(RoomModel room, BuildContext context) {
    final customerRoomNo = customerList.map(
      (e) => e.roomData.map((e) => e.roomNo),
    );
    if (customerRoomNo.any((e) => e.contains(room.roomNo))) {
      room.status = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Room is already booked')));
    } else {
      room.status = !room.status!;
      if (room.status == false) {
        selectedRoomList.add(room);
      } else {
        selectedRoomList.remove(room);
      }
    }

    notifyListeners();
  }

  // customer section

  //-------------- customer List---

  List<CustomerModel> customerList = [];
  void addCustomer(CustomerModel customer) {
    customerList.add(customer);
    selectedCheckInDate = null;
    selectedCheckOutDate = null;
    checkInDateController.clear();
    checkOutDateController.clear();

    notifyListeners();
  }

  void removeCustomer(CustomerModel customer) {
    customerList.remove(customer);

    notifyListeners();
  }

  // calculation of total amount
  double calculateTotalAmount(List<RoomModel> roomList, int stayDay) {
    double totalAmount = 0;
    for (var room in roomList) {
      if (room.type == 'delux') {
        totalAmount += 4200;
      } else if (room.type == 'executive') {
        totalAmount += 5800;
      } else if (room.type == 'normal') {
        totalAmount += 3500;
      }
    }
    return totalAmount * stayDay;
  }
}
