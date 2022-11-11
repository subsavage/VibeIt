import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vibeit/models/music.dart';
import 'package:vibeit/screens/home.dart';
import 'package:vibeit/screens/search.dart';
import 'package:vibeit/screens/yourlibrary.dart';

class VibeIt extends StatefulWidget {
  const VibeIt({super.key});

  @override
  State<VibeIt> createState() => _VibeItState();
}

class _VibeItState extends State<VibeIt> {
  final player = AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  Music? music;
  bool isPlaying = false;

  Widget miniplayer(Music? music, {bool stop = false}) {
    this.music = music;
    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      player.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(
          music.imageURL,
          fit: BoxFit.cover,
        ),
        Text(
          music.name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        IconButton(
          onPressed: () async {
            isPlaying = !isPlaying;
            if (isPlaying) {
              await player.play(DeviceFileSource(music.audioURL));
            } else {
              player.pause();
            }
            setState(() {});
          },
          icon: isPlaying
              ? Icon(
                  Icons.pause,
                  color: Colors.white,
                )
              : Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
        )
      ]),
    );
  }

  @override
  initState() {
    super.initState();
    Tabs = [Home(miniplayer), Search(), YourLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs[currentTabIndex],
        backgroundColor: Colors.black45,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            miniplayer(music),
            BottomNavigationBar(
                currentIndex: currentTabIndex,
                onTap: (currentIndex) {
                  currentTabIndex = currentIndex;
                  setState(() {});
                },
                selectedLabelStyle: TextStyle(color: Colors.white),
                selectedItemColor: Colors.white,
                backgroundColor: Colors.black,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.library_books,
                        color: Colors.white,
                      ),
                      label: "Your Library"),
                ])
          ],
        ));
  }
}
