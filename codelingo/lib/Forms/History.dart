import 'package:flutter/material.dart';

class HistoryForm extends StatefulWidget {
  const HistoryForm({super.key});

  @override
  State<HistoryForm> createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            hintColor: Colors.green,
            colorScheme: ColorScheme.light(primary: Colors.green),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _dateTime = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Form",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                "Picked date: $_dateTime",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: _showDatePicker,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Pick Date",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                color: Colors.green,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Solution",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5), width: 1.0),
                  ),
                ),
                cursorColor: Colors.green,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
