import 'dart:convert'; // Import this for JSON encoding
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/schedule_pickup.dart'; // Import the PickupRequest model
import '../controllers/schedule_pickup.dart'; // Import the PickupController

class SchedulePickup extends StatefulWidget {
  const SchedulePickup({super.key});

  @override
  State<SchedulePickup> createState() => _SchedulePickupState();
}

class _SchedulePickupState extends State<SchedulePickup> {
  DateTime today = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<String> selectedWasteTypes = [];
  bool isRecurringEnabled = false;
  String? estimatedWeight;

  final PickupController pickupController = PickupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Schedule Pickup',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 375,
              height: 425,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: TableCalendar(
                firstDay: DateTime.utc(2021, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: today,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    today = selectedDay;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            // Time selection
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Time',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null && picked != selectedTime) {
                        setState(() {
                          selectedTime = picked;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedTime.format(context)}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Waste type buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                wasteTypeButton('Plastic'),
                wasteTypeButton('Paper'),
                wasteTypeButton('Glass'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                wasteTypeButton('Metal', isWide: true),
                wasteTypeButton('Electronic', isWide: true),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimate weight/volume',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter',
                    ),
                    style: TextStyle(fontSize: 16),
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      setState(() {
                        estimatedWeight = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Recurring pickup switch
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 2, bottom: 5),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Switch(
                    value: isRecurringEnabled,
                    onChanged: (value) {
                      setState(() {
                        isRecurringEnabled = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade300,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recurring Pickup (Weekly)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Schedule button
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              child: SizedBox(
                width: 380,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    final pickupRequest = PickupRequest(
                      pickupDate: today,
                      pickupTime: selectedTime.format(context),
                      wasteTypes: selectedWasteTypes,
                      isRecurring: isRecurringEnabled,
                      estimatedWeight: estimatedWeight,
                    );

                    // Convert the pickupRequest to JSON and print it to the console
                    final jsonData = jsonEncode({
                      'pickupDate': pickupRequest.pickupDate.toIso8601String(),
                      'pickupTime': pickupRequest.pickupTime,
                      'wasteTypes': pickupRequest.wasteTypes,
                      'isRecurring': pickupRequest.isRecurring,
                      'estimatedWeight': pickupRequest.estimatedWeight,
                    });

                    print(jsonData); // Log the JSON data in the console

                    // Now, you can also call your pickupController if needed
                    pickupController.schedulePickup(pickupRequest);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Schedule Pickup',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget wasteTypeButton(String type, {bool isWide = false}) {
    bool isSelected = selectedWasteTypes.contains(type);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedWasteTypes.remove(type);
          } else {
            selectedWasteTypes.add(type);
          }
        });
      },
      child: Container(
        width: isWide ? 175 : 100,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.green[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green[200]!),
        ),
        child: Center(
          child: Text(
            type,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
