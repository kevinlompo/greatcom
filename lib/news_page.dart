import 'package:flutter/material.dart';
import 'package:greatcom/post.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  NewsPageState createState() =>NewsPageState();
}

class NewsPageState extends State<NewsPage> {

 @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: allPosts(),
     ),
   );
  }
}

Column allPosts() {
  List<Post> posts = [
    Post(name: "Meyer Lupin", time: "5 minutes", imagePath: "images/carnaval.jpg", desc: "Petit tour au Magic World, on s'est bien amusés et en plus il n'y avait pas grand nombre. Bref, le kiff", likes: 70, comments: 20),
    Post(name: "Meyer Lupin", time: "2 jours", imagePath: "images/mountain.jpg", desc: "La montagne ça vous gagne", likes: 38, comments: 5),
    Post(name: "Meyer Lupin", time: "1 semaines", imagePath: "images/work.jpg", desc: "Retour au boulot àprès plusieurs mois de confinement", likes: 10, comments: 2),
    Post(name: "Meyer Lupin", time: "5 ans", imagePath: "images/playa.jpg", desc: "Le boulot en remote c'est le pied: la preuve ceci sera mon bureau pour les prochaines semaines", likes: 535, comments: 100)
  ];
  List<Widget> postToAdd = [];
  posts.forEach((element) {
    postToAdd.add(post(post: element));
  });
  return Column(children: postToAdd);
}

Container post({required Post post}){
  return Container(
    margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromRGBO(225, 225, 225, 1),

    ),
    child: Column(
      children: [
        Row(
          children: [
          ],
        ),
        Row(
          children: [
            myProfilePic(radius: 20),
            const Padding(padding: EdgeInsets.only(left: 8)),
            Text(post.name),
            const Spacer(),
            timeText(post.getTime())
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(post.imagePath, fit: BoxFit.cover,)
        ),
        Text(post.desc, style: const TextStyle(
            color: Colors.teal
        ),
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            const Icon(Icons.star),
            // IconButton(onPressed: () {
            //   setState((post.likes));
            // }, icon: Icon(Icons.star)),
            Text(post.getLikes()),
            const Icon(Icons.message),
            Text(post.getComments())
          ],
        )
      ],
    ),
  );
}

// void setState(likes) {
//   likes +=1;
// }

Text timeText(String time) {
  return Text("Il y a $time", style: const TextStyle(color: Colors.teal),);
}
CircleAvatar myProfilePic({required double radius}) {
  return  CircleAvatar(radius: radius, backgroundImage: const AssetImage("images/profile.jpg"),);
}