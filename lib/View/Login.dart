import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Controller/Providers/LoginProvider.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController emailcontroller;
  late final TextEditingController passwordcontroller;
  @override
  void initState() {
    // TODO: implement initState
    emailcontroller= TextEditingController();
    passwordcontroller= TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.only(top: 100,left: 20,right: 20,bottom: 10),
       child: SingleChildScrollView(
         child: Column(
           spacing: 12,
           children: [
             Align(
               alignment: Alignment.topLeft,
                 child: Text("Your Email",
                   style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 15,),)),
             TextField(
               controller: emailcontroller,
               decoration: InputDecoration(
                 hintText: "Enter Your Email",
                 hintStyle: TextStyle(color: Colors.grey),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(color: Colors.grey,width: 2),
                 ),
                 prefixIcon: Icon(Icons.email),
               ),
             ),
             Align(
                 alignment: Alignment.topLeft,
                 child: Text("Password",
                   style: TextStyle(
               fontWeight: FontWeight.bold,fontSize: 15,),)),
             Consumer<LoginProvider>(
               builder: ( ctx, provider,_) {
                 return TextField(
                   controller: passwordcontroller,
                   obscureText: provider.clicked==true?false:true,
                   decoration: InputDecoration(
                       hintText: "Enter Your Password",
                       hintStyle: TextStyle(color: Colors.grey),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(color: Colors.grey,width: 2),
                       ),
                       prefixIcon: Icon(Icons.password),
                       suffixIcon:provider.clicked==true?InkWell(
                         onTap: (){
                           provider.change();
                         },
                           child: Icon(Icons.visibility)):InkWell(
                         onTap: (){
                           provider.change();
                         },
                           child: Icon(Icons.visibility_off)),
                   ),
                 );
               },
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Wrong password",style: TextStyle(color: Colors.grey),),
                 Text("Forgot Password?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),)
               ],
             ),
             SizedBox(height: 1,),
             ElevatedButton(

               onPressed: (){

             }, child: Text("Continue",style: TextStyle(color: Colors.white),),
               style: ElevatedButton.styleFrom(
                 shadowColor: Colors.lightBlue,
                 elevation: 3,
                 minimumSize: Size(double.infinity, 50),
                 backgroundColor: Colors.blue,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12),
                 ),
               ),
             ),
           Text("__________   Or  __________",
          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 19),
           ),
             ElevatedButton(style: ElevatedButton.styleFrom(
               elevation: 3,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12),
               ),
               minimumSize: Size(double.infinity, 50),
               backgroundColor: Colors.white70,
             ),
               onPressed: (){},
               child: Row(
                 spacing: 3,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(width: 20,
height: 30,
child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/480px-Google_%22G%22_logo.svg.png"),
                   ),
                   Text("Continue with Google",
                     style: TextStyle(color: Colors.black,fontSize: 15),),
                 ] ,
               ),),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               spacing: 3,
               children: [
                 Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                 Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),)
               ],
             ),
           ],
         ),
       ),
     ),
    );
  }
}
