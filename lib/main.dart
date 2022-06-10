import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'Data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
      },
      home: MyApp()));
}

class Login extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String email = " ";
   String password = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 50,
              ),
              Container(
                height: 200.0,
                child: Image.asset('assets1/img.png'),
              ),
              Center(
                child: Text('Hospital Management System',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade400, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your password.',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade400, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MyApp()));
                      if(email != " " && password !=" "){
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MyApp()));
                          }
                        } catch (e) {
                          print(e);
                          showAlertDialog2(context);
                        }
                      }
                      else {
                        showAlertDialog(context);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.deepPurple.shade900),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(
      "Please! Enter All Fields.",
      style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 20),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog1(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.deepPurple.shade900),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(
      "Successful!",
      style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 20),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.deepPurple.shade900),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(
      "No Data Available !",
      style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 20),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showAlertDialog3(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.deepPurple.shade900),
    ),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(
      "Use Proper Email Format !",
      style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 20),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  String patient_id = " ";
  String final_name = " ";
  String final_amount = " ";
  String arrearsfinal = " ";
  String bill_paid = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    "Hospital Management System",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text("", style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset("assets1/hospital_logo.PNG"),
                  ),
                ),
              ),
              InkWell(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bill()));
                },
                leading: Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.white,
                ),
                title: Text(
                  "View Bill",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => appointment()));
                },
                leading: Icon(
                  CupertinoIcons.checkmark_rectangle,
                  color: Colors.white,
                ),
                title: Text(
                  "Book Appointment",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
                leading: Icon(
                  CupertinoIcons.square_arrow_left,
                  color: Colors.white,
                ),
                title: Text(
                  "Log Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 175.0,
                width: 50.0,
                child: Image.asset('assets1/img3.png'),
              ),
              Container(
                child: Center(
                  child: Text(
                    "Hospital Management System",
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) {
                  patient_id = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter Patient Id'),
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  elevation: 2.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {});
                      print("Data start ");
                      final ref = FirebaseDatabase.instance.ref();
                      final totalamount = await ref
                          .child('patient/$patient_id/Total Amount: ')
                          .get();
                      final billpaid = await ref
                          .child('patient/$patient_id/Bill Paid: ')
                          .get();
                      final name =
                          await ref.child("patient/$patient_id/Name: ").get();
                      final arrears = await ref
                          .child("patient/$patient_id/Arrears: ")
                          .get();
                      if (totalamount.exists) {
                        final_name = jsonEncode(name.value);
                        final_amount = jsonEncode(totalamount.value);
                        bill_paid = jsonEncode(billpaid.value);
                        arrearsfinal = jsonEncode(arrears.value);
                        showAlertDialog1(context);
                      } else {
                        showAlertDialog2(context);
                      }
                      print("Data end");
                      ;
                      // DatabaseReference ref = FirebaseDatabase.instance.ref("doctor/-N2fUn8ftCkM82xZH4wA");
                      // DatabaseEvent event = await ref.once();
                      // print(event.snapshot.value); // { "name": "John" }
                    },
                    minWidth: 90.0,
                    height: 32.0,
                    child: Text(
                      'Check Bill',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 20,
                child: Text(
                  "             Patient Data",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                height: 200,
                width: 100,
                child: Text(
                  " \n Name :     $final_name\n Amount :  $final_amount\n Bill Paid:   $bill_paid\n Arrears:    $arrearsfinal ",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 25),
                ),
              ),
              Container(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  String Patient_name = " ";
  String Phone_number = " ";
  String CNIC = " ";
  String Doctor_name = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    "Hospital Management System",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text("", style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset("assets1/hospital_logo.PNG"),
                  ),
                ),
              ),
              InkWell(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bill()));
                },
                leading: Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.white,
                ),
                title: Text(
                  "View Bill",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => appointment()));
                },
                leading: Icon(
                  CupertinoIcons.checkmark_rectangle,
                  color: Colors.white,
                ),
                title: Text(
                  "Book Appointment",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
                leading: Icon(
                  CupertinoIcons.square_arrow_left,
                  color: Colors.white,
                ),
                title: Text(
                  "Log Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 175.0,
                // width: 50.0,
                child: Image.asset('assets1/img5.png'),
              ),
              Container(
                child: Center(
                  child: Text(
                    "Hospital Management System",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) {
                  Patient_name = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter Patient Name'),
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                onChanged: (value) {
                  Phone_number = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter Phone Number'),
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                onChanged: (value) {
                  CNIC = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter CNIC'),
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                onChanged: (value) {
                  Doctor_name = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Doctor Name'),
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  elevation: 2.0,
                  child: MaterialButton(
                    onPressed: () async {
                      if (Patient_name != " " &&
                          Phone_number != " " &&
                          CNIC != " " &&
                          Doctor_name != " ") {
                        DatabaseReference ref =
                            FirebaseDatabase.instance.ref("appointment/");
                        await ref.set({
                          "Name": Patient_name,
                          "Phone Number": Phone_number,
                          "CNIC": CNIC,
                          "Doctor Name": Doctor_name
                        });

                        showAlertDialog1(context);
                      } else {
                        showAlertDialog(context);
                      }
                    },
                    minWidth: 90.0,
                    height: 32.0,
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    "Hospital Management System",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text("", style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset("assets1/hospital_logo.PNG"),
                  ),
                ),
              ),
              InkWell(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bill()));
                },
                leading: Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.white,
                ),
                title: Text(
                  "View Bill",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => appointment()));
                },
                leading: Icon(
                  CupertinoIcons.checkmark_rectangle,
                  color: Colors.white,
                ),
                title: Text(
                  "Book Appointment",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
                leading: Icon(
                  CupertinoIcons.square_arrow_left,
                  color: Colors.white,
                ),
                title: Text(
                  "Log Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 275.0,
              // width: 50.0,
              child: Image.asset('assets1/img1.png'),
            ),
            Container(
              height: 5,
            ),
            Container(
              child: Center(
                child: Text(
                  "Hospital Management System",
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(height: 20.0),
            Container(
              height: 75.0,
              width: 50.0,
              color: Colors.blue.shade900,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bill()));
                },
                color: Colors.blue.shade400,
                height: 100.0,
                child: Text(
                  "Calculate Bill",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Container(height: 20.0),
            Container(
              height: 75.0,
              width: 50.0,
              // color: Colors.tealAccent,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => appointment()));
                },
                color: Colors.blue.shade400,
                height: 100.0,
                child: Text(
                  "Book an Appointment",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  static const String id = 'Registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
   String email = " ";
   String password = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 50,
              ),
              Container(
                height: 200.0,
                child: Image.asset('assets1/img.png'),
              ),
              Center(
                child: Text('Hospital Management System',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade400, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  // fillColor: Colors.white,
                  hintText: 'Enter your password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade400, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      if(email !=" " && password != "")
                        {
                          try {
                            final newuser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            if (newuser != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MyApp()));
                            }
                          } catch (e) {
                            print(e);
                            showAlertDialog3(context);
                          }
                        }
                      else
                        {
                          showAlertDialog(context);
                        }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Welcome extends StatefulWidget {
  static const String id = 'Welcome1';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Image.asset('assets1/img.png'),
                  height: 200.0,
                ),
                Text(
                  'Hospital Management System ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Registration.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
