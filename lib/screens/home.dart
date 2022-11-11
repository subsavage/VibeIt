import 'package:flutter/material.dart';
import 'package:vibeit/models/category.dart';
import 'package:vibeit/services/categoryops.dart';
import 'package:vibeit/services/musicops.dart';

import '../models/music.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);
  // const Home({super.key});

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imageURL, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: InkWell(
                onTap: () {
                  _miniPlayer(music, stop: true);
                },
                child: Image.network(music.imageURL, fit: BoxFit.cover)),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList = CategoryOps.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOps.getMusic();
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        child: Column(
          children: [
            createAppBar("Hey There!"),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList("Made for You"),
            createMusicList("Popular Hits")
          ],
        ),
      )),
    );
  }
}
