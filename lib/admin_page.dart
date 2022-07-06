import 'package:flutter/material.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  AdminPageState createState() =>AdminPageState();
}

class AdminPageState extends State<AdminPage> {

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width /4;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  myTitle('Créer un compte'),
                  MyCustomForm(),
                  separ(),
                  myTitle('Modifier le type de profile'),
                  separ(),
                  myTitle('Réinitialiser un mot de passe'),
                  separ(),
                  myTitle('Signalements'),
                ]
              ),

            ),
          ],
        ),
      ),
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


}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Entrez le nom',
              labelText: 'Nom',
            ),
            validator: (value) {
              if (value == '') {
                return 'Veuillez remplir ce champs';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Entrez le prénom',
              labelText: 'Prénom',
            ),
            validator: (value) {
              if (value == '') {
                return 'Veuillez remplir ce champs';
              }
              return null;
            },
          ),
          TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: '0102030405',
              labelText: 'n° de téléphone',
            ),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.mail),
              hintText: 'Pnom@ensup.eu',
              labelText: 'Adresse email',
            ),
            validator: (value){
              if(value== '' || !RegExp(r'^[\w-\.]+@ensup.eu$').hasMatch(value!)){
                return "Entrez une adresse mail valide";
              }else{
                return null;
              }
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              icon: const Icon(Icons.lock),
              hintText: 'Entrer le mot de passe',
              labelText: 'Mot de passe',
            ),
            validator: (value) {
              if (value == '') {
                return 'Veuillez remplir ce champs';
              }
              return null;
            },
          ),
          new Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 135.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enregistrement du compte')),
                    );
                  }
                },
                child: const Text('Enregistrer'),
              ),
          )
        ],
      ),
    );
  }
}
