import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String service;
  final String imageUrl;

  DetailsPage({required this.service, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              service,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showAppointmentDialog(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.book_online,color: Colors.black,),
                  SizedBox(width: 8),
                  Text('Book Appointment',style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showScheduleDialog(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.schedule,color: Colors.black,),
                  SizedBox(width: 8),
                  Text('View Schedule',style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAppointmentDialog(BuildContext context) {
    final TextEditingController _textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: Colors.white,
            primaryColor: Colors.black,
            hintColor: Colors.black,
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
          ),
          child: AlertDialog(
            title: Text(
              'Book Appointment',
              style: TextStyle(color: Colors.black),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Enter details',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            actions: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close', style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        String enteredText = _textController.text;
                        Navigator.of(context).pop();
                        _showConfirmationDialog(context, enteredText);
                      },
                      child: Text('Save', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showScheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: Colors.white,
            primaryColor: Colors.black,
            hintColor: Colors.black,
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
          ),
          child: AlertDialog(
            title: Text(
              'Schedule',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'Here is the schedule...',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogBackgroundColor: Colors.white,
            primaryColor: Colors.black,
            hintColor: Colors.black,
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
          ),
          child: AlertDialog(
            title: Text(
              'Appointment Booked',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'You have booked an appointment with the following details:\n$details',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}





