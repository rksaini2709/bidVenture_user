import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/spacing.dart';
import 'package:get/get.dart';

import '../../../Config/Colors.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/primary_btn.dart';

class EventBookingForm extends StatefulWidget {
  const EventBookingForm({super.key});

  @override
  _EventBookingFormState createState() => _EventBookingFormState();
}

class _EventBookingFormState extends State<EventBookingForm> {
  String eventType = "Birthday Party";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int numberOfAdults = 0;
  int numberOfKids = 0;
  double budgetPerPerson = 0.0;
  String preference = "veg";
  String additionalDetails = "";

  // Update event type
  void updateEventType(String newType) {
    setState(() {
      eventType = newType;
    });
  }

  // Update date
  void updateDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  // Update time
  void updateTime(TimeOfDay newTime) {
    setState(() {
      selectedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const CustomText(
            text: "Event Booking Forms",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: whiteColor),
        backgroundColor: primaryColor,
        // leading: const Icon(Icons.arrow_back_ios, color: whiteColor),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: whiteColor),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              // Event Menu Dropdown
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: secondaryColor,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    value: eventType,
                    dropdownColor: Colors.white,
                    onChanged: (String? newValue) {
                      updateEventType(newValue!);
                    },
                    items: <String>[
                      'Birthday Party',
                      'Engagement Party',
                      'Anniversary Party',
                      'Wedding Party',
                      'pre-wedding Party',
                      'Meetup Party',
                      'charity Event',
                      'Reunions Event',
                      'Corporate Event',
                      'Other Event'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const VerticalSpacing(height: 20),

              // Events Date Picker Pop_up
              // TextField(
              //   controller: TextEditingController(
              //     text: selectedDate.toLocal().toString().split(' ')[0],
              //   ),
              //   readOnly: true,
              //   decoration: InputDecoration(
              //     labelText: "Event Date",
              //     labelStyle: const TextStyle(
              //       color: primaryColor,
              //     ),
              //     suffixIcon: const Icon(Icons.calendar_today),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: const BorderSide(
              //         color: secondaryColor,
              //         width: 1,
              //       ),
              //     ),
              //   ),
              //   onTap: () {
              //     showCustomDatePicker(context, selectedDate, (DateTime date) {
              //       setState(() {
              //         selectedDate = date;
              //       });
              //     });
              //   },
              // ),


              // Events Date Picker bottom sheet
              // TextField(
              //   controller: TextEditingController(
              //     text: selectedDate.toLocal().toString().split(' ')[0],
              //   ),
              //   readOnly: true,
              //   decoration: InputDecoration(
              //     labelText: "Event Date",
              //     labelStyle: const TextStyle(
              //       color: primaryColor,
              //     ),
              //     suffixIcon: const Icon(Icons.calendar_today),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: const BorderSide(
              //         color: secondaryColor,
              //         width: 1,
              //       ),
              //     ),
              //   ),
              //   onTap: () {
              //     // Show a modal bottom sheet with a CalendarDatePicker
              //     showModalBottomSheet(
              //       context: context,
              //       backgroundColor: whiteColor,
              //       shape: const RoundedRectangleBorder(
              //         borderRadius:
              //             BorderRadius.vertical(top: Radius.circular(20)),
              //       ),
              //       builder: (BuildContext context) {
              //         return Container(
              //           padding: const EdgeInsets.all(16),
              //           height: 400,
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               const Text(
              //                 "Select Event Date",
              //                 style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w600,
              //                   color: secondaryColor,
              //                 ),
              //               ),
              //               const SizedBox(height: 20),
              //               CalendarDatePicker(
              //                 initialDate: selectedDate,
              //                 firstDate: DateTime(2024),
              //                 lastDate: DateTime(2100),
              //                 onDateChanged: (DateTime date) {
              //                   updateDate(date);
              //                   Navigator.pop(context);
              //                 },
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),


              // Events Date Picker Pop_up (white background updated)
              TextField(
                controller: TextEditingController(
                    text: selectedDate.toLocal().toString().split(' ')[0]),
                readOnly: true,
                // decoration: const InputDecoration(
                //   labelText: "Event Date",
                //   suffixIcon: Icon(Icons.calendar_today),
                // ),
                decoration: InputDecoration(
                  labelText: "Event Date",
                  labelStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                ),
                onTap: ()
                async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          // primaryColor: Colors.blue, // Change the primary color (e.g., header)
                          // hintColor: primaryColor, // Set the background color to white
                          // dialogBackgroundColor: redColor, // Set the dialog background color to white
                          // ok and cancel text button color
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: primaryColor,
                            ),
                          ),
                          colorScheme: const ColorScheme.light(
                            primary: primaryColor, // current date and selected date color with a circle
                            // onPrimary: whiteColor, // Text color in header
                            // onSurface: blackColor, // Text color in calendar
                            // background: blackColor, // Set background color to white
                          ).copyWith(background: whiteColor),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    updateDate(pickedDate);
                  }
                }
                // async {
                //   DateTime? pickedDate = await showDatePicker(
                //     context: context,
                //     initialDate: selectedDate,
                //     firstDate: DateTime(2024),
                //     lastDate: DateTime(2100),
                //   );
                //   if (pickedDate != null) {
                //     updateDate(pickedDate);
                //   }
                // },
              ),
              const VerticalSpacing(height: 10),

              // Events Time Picker
              TextField(
                controller:
                    TextEditingController(text: selectedTime.format(context)),
                readOnly: true,
                // decoration: const InputDecoration(
                //   labelText: "Event Time",
                //   suffixIcon: Icon(Icons.access_time),
                // ),
                decoration: InputDecoration(
                  labelText: "Event Date",
                  labelStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  suffixIcon: const Icon(Icons.access_time),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                ),
                onTap: ()
                async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime, // Define your initial time here
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          // primaryColor: secondaryColor, // Change the header color (e.g., clock icon)
                          // hintColor: secondaryColor, // Set background color to white
                          // dialogBackgroundColor: secondaryColor, // Set dialog background color to white
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: primaryColor, // Change text button color
                            ),
                          ), colorScheme: const ColorScheme.light(
                            primary: primaryColor, // select color
                            onPrimary: whiteColor, // Selected text color
                            onSurface: secondaryColor, // unselected text color their no have any background colors
                            // background: secondaryColor, // Set background color to white
                          ).copyWith(background: whiteColor),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedTime != null) {
                    updateTime(pickedTime);
                  }
                }

                // async {
                //   TimeOfDay? pickedTime = await showTimePicker(
                //     context: context,
                //     initialTime: selectedTime,
                //     builder: (BuildContext context, Widget? child) {
                //       return Theme(
                //         data: ThemeData.light()
                //             .copyWith(dialogBackgroundColor: whiteColor),
                //         child: child!,
                //       );
                //     },
                //   );
                //   if (pickedTime != null) {
                //     updateTime(pickedTime);
                //   }
                // },
              ),
              const VerticalSpacing(height: 10),

              // Number of Adults and Kids
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      // decoration:
                      //     const InputDecoration(labelText: "Number of Adults"),
                      decoration: InputDecoration(
                        labelText: "Number of Adults",
                        labelStyle: const TextStyle(
                          color: primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: secondaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        numberOfAdults = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  const HorizontalSpacing(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      // decoration:
                      //     const InputDecoration(labelText: "Number of Kids"),
                      decoration: InputDecoration(
                        labelText: "Number of Kids",
                        labelStyle: const TextStyle(
                          color: primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: secondaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        numberOfKids = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                ],
              ),
              const VerticalSpacing(height: 10),

              // Budget per person
              TextField(
                keyboardType: TextInputType.number,
                // decoration: const InputDecoration(labelText: "Budget per Person"),
                decoration: InputDecoration(
                  labelText: "Budget per Person",
                  labelStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) {
                  budgetPerPerson = double.tryParse(value) ?? 0.0;
                },
              ),
              const VerticalSpacing(height: 10),

              // Preference Radio Buttons - Veg, Non-Veg, Both
              Row(
                children: [
                  const Text("Preference: "),
                  Row(
                    children: [
                      Radio<String>(
                        value: "veg",
                        groupValue: preference,
                        onChanged: (String? value) {
                          setState(() {
                            preference = value!;
                          });
                        },
                        activeColor: greenColor,
                      ),
                      const Text("Veg"),
                      Radio<String>(
                        value: "non-veg",
                        groupValue: preference,
                        onChanged: (String? value) {
                          setState(() {
                            preference = value!;
                          });
                        },
                        activeColor: redColor,
                      ),
                      const Text("Non-Veg"),
                      Radio<String>(
                        value: "both",
                        groupValue: preference,
                        onChanged: (String? value) {
                          setState(() {
                            preference = value!;
                          });
                        },
                      ),
                      const Text("Both"),
                    ],
                  ),
                ],
              ),
              const VerticalSpacing(height: 10),

              // Additional details
              TextField(
                decoration: InputDecoration(
                  labelText: "Additional Details (Optional)",
                  labelStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    additionalDetails = value;
                  });
                },
                maxLines: null,
                minLines: 1,
              ),
              const VerticalSpacing(height: 20),

              //   Primary Btn for submit bid
              PrimaryBtn(
                text: "Submit",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textColor: whiteColor,
                onPressed: () {},
                btnColor: secondaryColor,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
  void showCustomDatePicker(BuildContext context, DateTime selectedDate, Function(DateTime) updateDate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime tempSelectedDate = selectedDate;
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose a Date",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.grey[300]),
                const SizedBox(height: 10),
                CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2100),
                  onDateChanged: (DateTime date) {
                    tempSelectedDate = date;
                  },
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.grey[300]),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updateDate(tempSelectedDate); // Update the selected date
                        Navigator.pop(context); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// class DatePickerField extends StatefulWidget {
//   const DatePickerField({Key? key}) : super(key: key);
//
//   @override
//   State<DatePickerField> createState() => _DatePickerFieldState();
// }
//
// class _DatePickerFieldState extends State<DatePickerField> {
//   DateTime selectedDate = DateTime.now();
//
//   void updateDate(DateTime pickedDate) {
//     setState(() {
//       selectedDate = pickedDate;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: TextEditingController(
//         text: selectedDate.toLocal().toString().split(' ')[0],
//       ),
//       readOnly: true,
//       decoration: InputDecoration(
//         labelText: "Event Date",
//         labelStyle: const TextStyle(
//           color: primaryColor,
//         ),
//         suffixIcon: const Icon(Icons.calendar_today),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: secondaryColor,
//             width: 1,
//           ),
//         ),
//       ),
//       onTap: () {
//         // Show a modal bottom sheet with a CalendarDatePicker
//         showModalBottomSheet(
//           context: context,
//           backgroundColor: secondaryColor, // Change the background color of the sheet
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           builder: (BuildContext context) {
//             return Container(
//               padding: const EdgeInsets.all(16),
//               height: 400,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     "Select Event Date",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: whiteColor,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   CalendarDatePicker(
//                     initialDate: selectedDate,
//                     firstDate: DateTime(2024),
//                     lastDate: DateTime(2100),
//                     onDateChanged: (DateTime date) {
//                       updateDate(date); // Update the selected date
//                       Navigator.pop(context); // Close the sheet
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
