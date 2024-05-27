import 'package:flutter/material.dart';

class QuestionsForm extends StatefulWidget {
  const QuestionsForm({super.key});

  @override
  State<QuestionsForm> createState() => _QuestionsFormState();
}

class _QuestionsFormState extends State<QuestionsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questions Form",
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
                  hintText: "Question",
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
                    return "Question required";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Choices",
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
                    return "Choices required";
                  }
                  return null;
                },
                cursorColor: Colors.green,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Difficulty",
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
                    return "Difficulty required";
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
