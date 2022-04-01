class Profile {
  String surname;
  String name;
  int age;
  bool gender;
  double height;
  List<String> hobbies = [];
  String favoritesLang;
  String parcours;


  Profile({
    this.surname = "",
    this.name = "",
    this.age = 0,
    this.gender = true,
    this.height = 0.0,
    this.hobbies = const [],
    this.favoritesLang = "Dart",
    this.parcours = ""
  });

  String setName() => "$surname $name";

  String setAge() {
    String ageString = "$age an";
    if (age > 1) {
      ageString+= "s";
    }
    return ageString;
  }

  String genderString() => (gender) ? "Féminin" : "Masculin";

  String setParcours() {
    String parcour = "";
    if(parcours == ""){
      return parcour;
    } else {
      parcour = "J'ai fait $parcours";
    }
    return parcour;
  }

  String setHeight()=> "${height.toInt()} cm";

  String setHobbies() {
    String toHobbiesString = "";
    if(hobbies.isEmpty) {
      return toHobbiesString;
    } else {
      toHobbiesString = "Mes hobbies sont:";
      hobbies.forEach((hobbie) {
        toHobbiesString += " $hobbie,";
      });
      return toHobbiesString;
    }
  }

}