import 'package:vibeit/models/category.dart';

class CategoryOps {
  CategoryOps._() {}
  static List<Category> getCategories() {
    return <Category>[
      Category("Top Songs",
          "https://w7.pngwing.com/pngs/927/243/png-transparent-music-song-arabesque-art-music-miscellaneous-blue-logo.png"),
      Category("MJ hits",
          "https://i.pinimg.com/originals/3b/72/bf/3b72bf0bdd391b9e82cd43d1505975d9.jpg"),
      Category("Top Songs",
          "https://w7.pngwing.com/pngs/927/243/png-transparent-music-song-arabesque-art-music-miscellaneous-blue-logo.png"),
      Category("MJ Hits",
          "https://i.pinimg.com/originals/3b/72/bf/3b72bf0bdd391b9e82cd43d1505975d9.jpg"),
    ];
  }
}
