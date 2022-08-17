import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goodkredit/Router/navigate-route.dart';
import 'package:goodkredit/Theme/color-theme.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'Pages/Home-Page/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration:  BoxDecoration(
          color: MyTheme.bg,
          image: DecorationImage(
            image: AssetImage("image/map.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IntlPhoneField(
                cursorColor: MyTheme.logoColor,
                decoration:  InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: MyTheme.logoColor, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'PH',
                onChanged: (phone) {

                  phoneController.text = phone.completeNumber;
                  print(phone.completeNumber);
                },
              ),
              // TextField(
              //   controller: phoneController,
              //   decoration: InputDecoration(
              //     hintText: 'Phone Number',
              //     prefix: Padding(
              //       padding: EdgeInsets.all(4),
              //       child: Text('+63'),
              //     ),
              //   ),
              //   maxLength: 10,
              //   keyboardType: TextInputType.phone,
              // ),
              Visibility(
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'OTP',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(''),
                    ),
                  ),
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                ),
                visible: otpVisibility,
              ),
              SizedBox(
                height: 10,
              ),

              ElevatedButton(onPressed: (){
                if (otpVisibility) {
                  verifyOTP();
                } else {
                  loginWithPhone();
                }
                print(phoneController.text);
              }, child: Text("Login",style: TextStyle(fontSize: 18),)),
              SizedBox(
                height: 10,
              ),

              TextButton(onPressed: (){}, child: Text("Forgot Password?",style: TextStyle(color: Colors.white),)),

              MaterialButton(
                color: Colors.indigo[900],
                onPressed: () {
                 NavigateRoute.gotoPage(context, Home());
                },
                child: Text(
                  otpVisibility ? "Verify" : "Go To Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+63" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}