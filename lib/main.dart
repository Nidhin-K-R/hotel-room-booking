import 'package:flutter/material.dart';
import 'package:hotel_booking/controller/app_provider.dart';
import 'package:hotel_booking/screens/booking_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: const BookingScreen(),
      ),
    );
  }
}
