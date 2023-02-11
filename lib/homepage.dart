import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  XFile? imagepicker;
  XFile? imagepicker2;
  imagefctn() async {
    ImagePicker _imagepicker = await ImagePicker();
    imagepicker = await _imagepicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  imagefctn2() async {
    ImagePicker _imagepicker = await ImagePicker();
    imagepicker2 = await _imagepicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  DateTime? DOB;
  String? gender;
  TextEditingController emailcontroller = TextEditingController();
  GlobalKey<FormState> _fromkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student Informationpage"),
      ),
      body: Form(
        key: _fromkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name field is empty";
                  }

                  var email = RegExp(r"^[a-zA-Z]+").hasMatch(value.toString());
                  if (email == false) {
                    return "Invalid Name ";
                  }
                },
                cursorColor: Color(0xff8E8E93),
                controller: emailcontroller,
                style: TextStyle(color: Color(0xff8E8E93)),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Color(0xff8E8E93))),
                    hintText: "Enter your name",
                    hintStyle:
                        TextStyle(color: Color(0xff8E8E93), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xff8A8A8E),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email field is empty";
                  }

                  var email = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.toString());
                  if (email == false) {
                    return "Invalid email ";
                  }
                },
                cursorColor: Color(0xff8E8E93),
                controller: emailcontroller,
                style: TextStyle(color: Color(0xff8E8E93)),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Color(0xff8E8E93))),
                    hintText: "Enter your email address",
                    hintStyle:
                        TextStyle(color: Color(0xff8E8E93), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xff8A8A8E),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone number field is empty";
                  }
                  if (value.length > 18) {
                    return "Phone number is large";
                  }
                },
                cursorColor: Color(0xff8E8E93),
                controller: emailcontroller,
                style: TextStyle(color: Color(0xff8E8E93)),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Color(0xff8E8E93))),
                    hintText: "Enter your Phone number",
                    hintStyle:
                        TextStyle(color: Color(0xff8E8E93), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Color(0xff8A8A8E),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Address  field is empty";
                  }
                  if (value.length > 30) {
                    return "Phone number is large";
                  }
                },
                cursorColor: Color(0xff8E8E93),
                controller: emailcontroller,
                style: TextStyle(color: Color(0xff8E8E93)),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Color(0xff8E8E93))),
                    hintText: "Enter your Address",
                    hintStyle:
                        TextStyle(color: Color(0xff8E8E93), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Color(0xff8A8A8E),
                    )),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 210,
                  child: RadioListTile(
                    title: Text("Male"),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  width: 210,
                  child: RadioListTile(
                    title: Text("Female"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now())
                          .then((value) {
                        setState(() {
                          DOB = value!;
                        });
                      });
                    },
                    child: Text(
                      'Select your DOB',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Text(
                  "${DOB == null ? "selecte date of birth" : DOB}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xff8E8E93),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              imagefctn();
                            },
                            icon: imagepicker == null
                                ? Icon(
                                    Icons.photo_camera,
                                    size: 25,
                                    color: Color(0xffFFFFFF),
                                  )
                                : Image.file(File(imagepicker!.path)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              imagefctn2();
                            },
                            icon: imagepicker == null
                                ? Icon(
                                    Icons.photo_library,
                                    size: 25,
                                    color: Color.fromARGB(255, 120, 54, 54),
                                  )
                                : Image.file(File(imagepicker!.path)))),
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  if (_fromkey.currentState!.validate()) {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext) => ()));

                    print("Done");
                  }
                  ;
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                      child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w600),
                  )),
                )),
          ],
        ),
      ),
    ));
  }
}
