import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:greatcom/profile.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() =>ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  Profile myProfile = Profile(surname: "Lupin", name: "Meyer" );
  late TextEditingController surname;
  late TextEditingController name;
  late TextEditingController parcours;
  late TextEditingController pwd;
  late TextEditingController age;
  bool showSecret = false;

  Map<String, bool> hobbies = {
    "Pétanque": false,
    "Football": false,
    "Rugby": false,
    "Code": false,
    "Manga": false,
    "Foooood": false
  };

  ImagePicker picker = new ImagePicker();
  File? imageFile;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    surname = TextEditingController();
    name = TextEditingController();
    parcours = TextEditingController();
    pwd = TextEditingController();
    age = TextEditingController();
    surname.text = myProfile.surname;
    name.text = myProfile.name;
    parcours.text = myProfile.parcours;
    age.text = myProfile.age.toString();
    pwd.text = myProfile.pwd;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    surname.dispose();
    name.dispose();
    parcours.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width /4;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                color: Colors.teal.shade100,
                elevation: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(myProfile.setName()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: (imageFile == null)
                                  ? Image.network("https://codabee.com/wp-content/uploads/2018/03/cropped-Artboard-2.png", height: imageSize, width: imageSize)
                                  : Image.file(imageFile!, height: imageSize, width: imageSize)
                          ),
                          Column(
                            children: [
                              Text("Age: ${myProfile.setAge()}"),
                              Text("Taille: ${myProfile.setHeight()}"),
                              Text("Genre: ${myProfile.genderString()}"),
                            ],
                          )
                        ],
                      ),
                      Text("Hobbies: ${myProfile.setHobbies()}"),
                      Text("Langage de programmation favori: ${myProfile.favoritesLang}"),
                      Text("Parcours: ${myProfile.setParcours()}",),
                    ],
                  ),
                )
                ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(onPressed: (() => getImage(source: ImageSource.camera)), icon: const Icon(Icons.camera_alt_rounded), color: Colors.teal,),
                  IconButton(onPressed: (() => getImage(source: ImageSource.gallery)), icon: const Icon(Icons.photo_album_outlined), color: Colors.teal,),

                ],
              ),
              separ(),
              myTitle("Modifier les infos"),

              myTextField(controller: surname, hint: "Entrez votre prénom", isSecret: false),
              myTextField(controller: name, hint: "Entrez votre nom", isSecret: false),
              myTextField(controller: parcours, hint: "Dites nous votre parcours", isSecret: false),
              myTextField(controller: pwd, hint: "Entrer votre mot de passe secret", isSecret: true),
              myTextField(controller: age, hint: "Entrez votre âge", isSecret: false, type: TextInputType.number),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Genre: ${myProfile.genderString()}"),
                  Switch(value: myProfile.gender, onChanged: ((newBool) {
                    setState(() {
                      myProfile.gender = newBool;
                    });
                  })),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Taille: ${myProfile.setHeight()}"),
                  Slider(
                      value: myProfile.height,
                      min: 0,
                      max: 250,
                      onChanged: ((newHeight) {
                        setState(() {
                          myProfile.height = newHeight;
                        });
                      }))
                ],
              ),
              separ(),
              myHobbies(),
              separ(),
              myRadio(),
            ],
          ),
        )
    );
  }

  TextField myTextField({required TextEditingController controller,required String hint, isSecret, TextInputType type: TextInputType.text}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      keyboardType: type,
      obscureText: isSecret,
      onSubmitted: ((newValue) {
        updateUser();
      }),
    );
  }

  updateUser() {
    setState(() {
      myProfile = Profile(
          surname: (surname.text != myProfile.surname) ? surname.text : myProfile.surname,
          name: name.text,
          parcours: parcours.text,
          favoritesLang:myProfile.favoritesLang,
          hobbies: myProfile.hobbies,
          height: myProfile.height,
          pwd: myProfile.pwd,
          age: int.parse(age.text),
          gender: myProfile.gender
      );
    });
  }


  Column myHobbies() {
    List<Widget> widgets = [myTitle("Mes Hobies")];
    hobbies.forEach((hobby, like) {
      Row r = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(hobby),
          Checkbox(value: like, onChanged: ((newBool) {
            setState(() {
              hobbies[hobby] = newBool ?? false;
              List<String> str = [];
              hobbies.forEach((key, value) {
                if (value){
                  str.add(key);
                }
              });
              myProfile.hobbies = str;
            });
          }))
        ],
      );
      widgets.add(r);
    });
    return Column(children: widgets);
  }

  Column myRadio(){
    List<Widget> w = [];
    List<String> langs = ["Dart", "Swift", "Kotlin", "Java", "Python"];
    int index = langs.indexWhere((lang) => lang.startsWith(myProfile.favoritesLang));
    for(var x = 0; x< langs.length; x++){
      Column c = Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(langs[x]),
          Radio(value: x, groupValue: index, onChanged: ((newValue) {
            setState(() {
              myProfile.favoritesLang = langs[newValue as int];
            });
          }))
        ],
      );
      w.add(c);
    }
    return Column(
        children: [ myTitle("Langage préféré"),
          const Padding(padding: EdgeInsets.only(bottom: 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: w,
          )
        ]
    );
  }

  Text myTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
    );
  }

  Divider separ() {
    return const Divider(color: Colors.teal, thickness: 2,);
  }

  Future getImage({ required source}) async {
    final chosenFile = await picker.getImage(source: source);
    setState(() {
      if(chosenFile == null) {
        print("Je n'ai rien ajouté");
      } else {
        imageFile = File(chosenFile.path);
      }
    });
  }

}