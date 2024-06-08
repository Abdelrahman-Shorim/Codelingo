import 'package:flutter/material.dart';
import 'package:codelingo/Shared/constants.dart';
class CenterDisplay extends StatelessWidget {
  const CenterDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Welcome-Man.jpg', height: 150),
          Container(padding: const EdgeInsets.all(5)),
          Text('Codelingo',style:TextStyle(fontSize: 40,color:logoTextColor)),
          Container(padding: const EdgeInsets.all(5)),
          Text('Learn C++ language for free.',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600)),
          Container(padding: const EdgeInsets.all(5)),
          Text('Forever.',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
