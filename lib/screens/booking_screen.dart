import 'package:flutter/material.dart';
import 'package:hotel_booking/controller/app_provider.dart';
import 'package:hotel_booking/core/validators.dart';
import 'package:hotel_booking/models/customer_model.dart';
import 'package:hotel_booking/widgets/custom_datefield.dart';
import 'package:hotel_booking/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotel Booking')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            // customer form section
            Container(
              width: 600,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  // mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    const Text('Enter Customer Details'),

                    // user details
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                            label: 'Name',
                            controller: nameController,
                            validator: AppValidators.validateName,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: CustomTextfield(
                            label: 'Phone',
                            controller: phoneController,
                            validator: AppValidators.validatePhone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // date section
                    Row(
                      children: [
                        Expanded(
                          child: CustomDateSelector(label: 'Check in Date'),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: CustomDateSelector(label: 'Check out Date'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // rooms  selection section
                    Row(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                // room selection section
                                Text('Delux Rooms : Rs 4200'),
                                SizedBox(
                                  height: 50,
                                  //  width: double.infinity,
                                  child: Consumer<AppProvider>(
                                    builder: (context, provider, child) {
                                      return ListView.builder(
                                        scrollDirection: .horizontal,
                                        itemCount: provider.deluxRoom.length,
                                        itemBuilder: (context, index) {
                                          final room =
                                              provider.deluxRoom[index];
                                          final isSelected =
                                              room.status == true;
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                provider.selectRoom(
                                                  room,
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? Colors.green
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(room.roomNo),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),

                                Text('Exicutive Rooms : Rs 5800'),
                                SizedBox(
                                  height: 50,
                                  //  width: double.infinity,
                                  child: Consumer<AppProvider>(
                                    builder: (context, provider, child) {
                                      return ListView.builder(
                                        scrollDirection: .horizontal,
                                        itemCount:
                                            provider.executiveRoom.length,
                                        itemBuilder: (context, index) {
                                          final room =
                                              provider.executiveRoom[index];
                                          final isSelected =
                                              room.status == true;
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                provider.selectRoom(
                                                  room,
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? Colors.green
                                                      : Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(room.roomNo),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Text('Normal Rooms : Rs 3500'),
                                SizedBox(
                                  height: 50,
                                  //  width: double.infinity,
                                  child: Consumer<AppProvider>(
                                    builder: (context, provider, child) =>
                                        ListView.builder(
                                          scrollDirection: .horizontal,
                                          itemCount: provider.normalRoom.length,
                                          itemBuilder: (context, index) {
                                            final room =
                                                provider.normalRoom[index];
                                            final isSelected =
                                                room.status == true;
                                            return Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  provider.selectRoom(
                                                    room,
                                                    context,
                                                  );
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? Colors.green
                                                        : Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(room.roomNo),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // user order details section
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Consumer<AppProvider>(
                              builder: (context, provider, child) => Column(
                                children: [
                                  Text('Check Details '),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Selected Rooms: ${provider.selectedRoomList.length}',
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Room Numbers: ${provider.selectedRoomList.map((e) => e.roomNo)}',
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Total Days you stay : ${provider.calculateTotalStay()}',
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Total Amount : Rs ${provider.calculateTotalAmount(provider.selectedRoomList, provider.calculateTotalStay())}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // submit button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          final provider = context.read<AppProvider>();
                          if (formKey.currentState!.validate() &&
                              provider.selectedRoomList.isNotEmpty) {
                            provider.addCustomer(
                              CustomerModel(
                                name: nameController.text,
                                phone: phoneController.text,
                                checkInDate: provider.formattedCheckInDate,
                                checkOutDate: provider.formattedCheckOutDate,
                                roomData: [...provider.selectedRoomList],
                                amount: provider.calculateTotalAmount(
                                  provider.selectedRoomList,
                                  provider.calculateTotalStay(),
                                ),
                                stayDay: provider.calculateTotalStay(),
                              ),
                            );
                            nameController.clear();
                            phoneController.clear();

                            context
                                .read<AppProvider>()
                                .selectedRoomList
                                .clear();
                            context.read<AppProvider>().selectedCheckInDate =
                                null;
                            context.read<AppProvider>().selectedCheckOutDate =
                                null;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Room booked successfully'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please select a room')),
                            );
                          }
                        },
                        child: Text('Book Room'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            // customer Details section
            Container(
              width: 600,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Text('Customer details'),
                  const SizedBox(height: 15),
                  Consumer<AppProvider>(
                    builder: (context, provider, child) {
                      if (provider.customerList.isEmpty) {
                        return Center(child: Text('No customers found'));
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: provider.customerList.length,
                          itemBuilder: (context, index) {
                            final customer =
                                provider.customerList[provider
                                        .customerList
                                        .length -
                                    index -
                                    1];
                            return ListTile(
                              onTap: () {
                                // Customer Details popUp

                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Customer Details'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Name: ${customer.name}'),
                                        Text('Phone: ${customer.phone}'),
                                        Text(
                                          'Check-in: ${customer.checkInDate}',
                                        ),
                                        Text(
                                          'Check-out: ${customer.checkOutDate}',
                                        ),
                                        Text('Stay: ${customer.stayDay} days'),
                                        Text('Amount: Rs ${customer.amount}'),
                                        Text('Rooms:'),
                                        for (var room in customer.roomData)
                                          Text('${room.roomNo} (${room.type})'),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              title: Text(customer.name),
                              subtitle: Text(customer.phone),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  provider.removeCustomer(customer);
                                  for (var room in customer.roomData) {
                                    provider.selectRoom(room, context);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
