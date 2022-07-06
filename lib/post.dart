class Post {
  String _name = "";
  String time;
  String _imagePath = "";
  String desc;
  int likes;
  int comments;

  Post({
    String name = "",
    required this.time,
    String imagePath = "",
    required this.desc,
    this.likes = 0,
    this.comments = 0
  }) {
    this._imagePath = imagePath;
    this._name = name;
  }

  String get name {
    return _name;
  }

  String get imagePath {
    return _imagePath;
  }

  set image(String newUrl) {
    if(newUrl != ""){
      _imagePath = newUrl;
    }
  }

  String getTime() => " Il y a $time";

  String getLikes() => "$likes étoiles";

  String getComments() {
    if (comments > 1) {
      return "$comments commentaires";
    } else {
      return "$comments commentaire";
    }
  }

}