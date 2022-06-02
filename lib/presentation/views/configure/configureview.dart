import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fortloom/presentation/views/configure/configure_settingsview.dart';

import '../../../core/framework/globals.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, //para que el appbar tenga el mismo color que la pagina
        elevation: 1,
        title: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/imgs/logo.png',
              height: ScreenWH(context).height * 0.1,
              width: ScreenWH(context).width * 0.25),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context)=>SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,top: 25, right: 16),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2, blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0,10)
                          )
                            ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://media.newyorker.com/photos/5909771c2179605b11ad8664/master/pass/Petrusich-Sinead-OConnor.jpg")
                        )
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.black
                      ),
                      child: Icon(Icons.edit, color: Colors.white,),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Wrap(
                  children: [
                    buildChip("Alternative"),
                    buildChip("Indie"),
                  ]
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Wrap(
                    children: [
                      buildSocialNetwork(1),
                      buildSocialNetwork(2),
                      buildSocialNetwork(3),
                    ]
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "Sinéad O'Connor", false),
              buildTextField("E-mail", "thecranberries@gmail.com",false),
              buildTextField("Password", "********", true),
              buildTextField(" New Password", "********", true),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: (){},
                      child: Text("Cancel",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                    style:
                    ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
                obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                  suffixIcon: isPasswordTextField ? IconButton(
                    onPressed: (){
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                  ) :null,
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
                ),
              ),
    );
  }

  Widget buildChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Chip(
        backgroundColor: Colors.black,
        label: Text(text,
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }

  Widget buildSocialNetwork(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: index==1 ?
          IconButton(
              onPressed: (){},
              icon: Icon(FontAwesomeIcons.facebook),
              iconSize: 35,
              splashRadius: 24,
          ):
          index ==2 ?
          IconButton(
              onPressed: (){},
               icon: Icon(FontAwesomeIcons.instagram),
               iconSize: 35,
               splashRadius: 24,
      ):
          IconButton(
            onPressed: (){},
            icon: Icon(FontAwesomeIcons.twitter),
            iconSize: 35,
            splashRadius: 24,
          )
    );
  }
}


