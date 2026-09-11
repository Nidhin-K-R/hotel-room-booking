import 'package:flutter/material.dart';
import 'package:hotel_booking/controller/app_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomDateSelector extends StatefulWidget {
  final String label;
  const CustomDateSelector({super.key, required this.label});

  @override
  State<CustomDateSelector> createState() => _CustomDateSelectorState();
}

class _CustomDateSelectorState extends State<CustomDateSelector> {
  @override
  void initState() {
    super.initState();
    context.read<AppProvider>().checkInDateController = TextEditingController();
    context.read<AppProvider>().checkOutDateController =
        TextEditingController();
  }

  @override
  void dispose() {
    context.read<AppProvider>().checkInDateController.dispose();
    context.read<AppProvider>().checkOutDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a date';
            }

            try {
              final date = DateFormat('dd/MM/yyyy').parseStrict(value.trim());

              final now = DateTime.now();

              final today = DateTime(now.year, now.month, now.day);

              // Past date
              if (date.isBefore(today)) {
                return 'Past date is not allowed';
              }

              return null;
            } catch (e) {
              return 'Enter a valid date (DD/MM/YYYY)';
            }
          },

          controller: widget.label == "Check in Date"
              ? provider.checkInDateController
              : provider.checkOutDateController,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            hintText: 'DD/MM/YYYY',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () async {
                await context.read<AppProvider>().selectDate(
                  widget.label == "Check in Date" ? true : false,
                  context,
                );

                widget.label == 'Check in Date'
                    ? provider.checkInDateController.text =
                          provider.formattedCheckInDate
                    : provider.checkOutDateController.text =
                          provider.formattedCheckOutDate;
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
