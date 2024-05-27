import 'package:flutter/material.dart';

class TopicsForm extends StatefulWidget {
  const TopicsForm({super.key});

  @override
  State<TopicsForm> createState() => _TopicsFormState();
}

class _TopicsFormState extends State<TopicsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Topics Form",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5), width: 1.0),
                  ),
                ),
                cursorColor: Colors.green,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Name required";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5), width: 1.0),
                  ),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Description required";
                  }
                  return null;
                },
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
