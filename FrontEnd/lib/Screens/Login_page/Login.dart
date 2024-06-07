import 'package:codelingo/Screens/home.dart';
import 'package:flutter/material.dart';
import '../../Shared/constants.dart';

class Loginclass extends StatefulWidget {
  const Loginclass({super.key});

  @override
  State<Loginclass> createState() => _LoginclassState();
}

class _LoginclassState extends State<Loginclass> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:bgColor ,
      
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
child:Padding(padding: EdgeInsets.symmetric(vertical: 32.0),
        child:
       Padding(
         padding: EdgeInsets.only(right:35.0),
         child: Text("Duolingo",
            style:(TextStyle(
               
              fontSize:32.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ))),
       )

          ),  ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical:16.0),
              child: Text("Login to \nyour account ",
                       style:(TextStyle(
                        
              fontSize:26.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
                        ))
                      ),
            ),

         Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: TextField(decoration:InputDecoration(
            filled:true,
            fillColor:textFieldColor,
            hintText: "Username or Email",
            hintStyle:const TextStyle (color:Colors.white54,
          
          )),),
        ),
        const SizedBox(height:8),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: TextField(decoration:InputDecoration(
            filled:true,
            fillColor:textFieldColor,
            hintText: "Password",
            hintStyle:const TextStyle (color:Colors.white54,
          
          )),),
        ),
        const SizedBox(height:8),
        const Align(
          alignment: Alignment.centerRight,
          child:
        Padding(
          padding: EdgeInsets.only(right:16.0),
          child: Text("Forgot your password?",
          style: TextStyle(color:Colors.white)
          ),
        ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox( 
          
            width:double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: loginButtonColor,
                fixedSize: const Size(double.infinity,40),
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx)=>const Home())
                );
              }, child: const Text("Login",
              style: TextStyle(color:Colors.white),)),
          ),
        )
]      ),

        );
      
    
  }
}