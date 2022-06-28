import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fortloom/presentation/views/configure/configure_settingsview.dart';
import 'package:fortloom/presentation/widgets/screenBase.dart';
import 'package:fortloom/presentation/widgets/sideBar/navigationBloc.dart';

import '../../../core/framework/globals.dart';
import 'package:fortloom/core/service/ProfileService.dart';
import 'package:fortloom/core/service/AuthService.dart';
import 'package:fortloom/domain/entities/PersonResource.dart';

import 'package:url_launcher/url_launcher.dart';

class EditProfilePage extends StatefulWidget with NavigationStates{
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = true;
  ProfileService profileService=new ProfileService();
  AuthService authService= new AuthService();
  final TextEditingController realnameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController newpasswordController = new TextEditingController();
  final Uri _urlF = Uri.parse('https://www.facebook.com/?sk=welcome');
  final Uri _urlI = Uri.parse('https://www.instagram.com');
  final Uri _urlT = Uri.parse('https://twitter.com/i/flow/login');
  var list = ['Rock','Jazz','Indie','Blues','Classical','Country','Dance','Electronic','Rap','Latin','Metal','Punk','Reggae','Funk','Soul','Pop','Progressive','Criolla','Fusion','Trap'];

  String username="Usuario";
  PersonResource personResource= new PersonResource(0, "username", "realname", "lastname", "email", "password");

  @override
  void initState() {

    super.initState();
    String tep;

    this.authService.getToken().then((result){

      setState(() {
        tep= result.toString();
        username=this.authService.GetUsername(tep);

        this.authService.getperson(username).then((result) {

          setState(() {
            personResource=result;
            newpasswordController.text=personResource.password;
          });

        });

      });

    }) ;

  }
  List<Widget> lstChips =[];


  @override
  Widget build(BuildContext context){
    return ScreenBase(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context)=>SettingsPage()));
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 16,top: 25, right: 16),
                child: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: ScreenWH(context).width,
                    height: 500,
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
                          height: 15,
                        ),
                        Center(
                          child: Wrap(
                              children: [
                                addChipButton(),
                              ]
                          ),
                        ),
                        Center(
                          child: Wrap(
                              children: [
                                Container(
                                    width: 400,
                                    height: 50,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: lstChips.length,
                                        itemBuilder: (context, index){
                                          return lstChips[index];
                                        })
                                )
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
                        buildTextField("Full Name",personResource.realname,realnameController,false),
                        buildTextField("Full Name",personResource.lastname,lastnameController,false),
                        buildTextField("E-mail", personResource.email,emailController,false),
                        buildTextField(" New Password", "", newpasswordController, true),
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
                              onPressed: (){
                                realnameController.text=personResource.realname;
                                lastnameController.text=personResource.lastname;
                                emailController.text=personResource.email;
                                newpasswordController.text=personResource.password;
                              },
                              child: Text("Cancel",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                if(realnameController.text==''){
                                  realnameController.text=personResource.realname;
                                }
                                if(lastnameController.text==''){
                                  lastnameController.text=personResource.lastname;
                                }
                                if(emailController.text==''){
                                  emailController.text=personResource.email;
                                }
                                profileService.editProfile(personResource.id, realnameController.text.trim(), lastnameController.text.trim(), emailController.text.trim(), newpasswordController.text.trim());
                              },
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
                ),
              ),

            ],
          ),
        )
    );
  }

  Widget buildTextField(String labelText, String placeholder, TextEditingController controller, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
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


  Widget buildChip() {

    //para cambiar el orden de todos los elementos de la lista aleatoriamente
    //y devolver el primer elemento de la lista
    var randomItem = (list..shuffle()).first;
    list.removeAt(0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Chip(
        backgroundColor: Colors.black,
        label: Text(randomItem,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  Widget addChipButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child:
        IconButton(
          onPressed: (){
            setState(() {
              lstChips.add(buildChip());
            });
            print('lst lenght ${lstChips.length}');
          },
          icon: Icon(Icons.add),

          iconSize: 35,
          splashRadius: 24,
        )
    );
  }

  Widget buildSocialNetwork(int index) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: index==1 ?
        IconButton(
          onPressed: (){
            _launchUrl(_urlF);
          },
          icon: Icon(FontAwesomeIcons.facebook),
          iconSize: 35,
          splashRadius: 24,
        ):
        index ==2 ?
        IconButton(
          onPressed: (){
            _launchUrl(_urlI);
          },
          icon: Icon(FontAwesomeIcons.instagram),
          iconSize: 35,
          splashRadius: 24,
        ):
        IconButton(
          onPressed: (){
            _launchUrl(_urlT);
          },
          icon: Icon(FontAwesomeIcons.twitter),
          iconSize: 35,
          splashRadius: 24,
        )
    );
  }
  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}


