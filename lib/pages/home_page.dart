import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/pages/all_songs_page.dart';
import 'package:nazruldex2/pages/favorites_page.dart';
import 'package:nazruldex2/pages/home_screen.dart';
import "package:velocity_x/velocity_x.dart";

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int value = 0;

  final _pageOptions = [
    HomeScreen(),
    AllSongsPage(),
    FavoritesPage(),
  ];

  loadData() async {
    var json = await rootBundle.loadString("assets/files/data.txt");
    var decodedData = jsonDecode(json);
    var songList = decodedData["songList"];
    DataList.AllSongs = List.from(songList).map<Song>((song)=>Song.fromMap(song)).toList();
    DataList.SearchedSongs = DataList.AllSongs;
    FavoritesList.Load();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0, backgroundColor: context.canvasColor,),
      body: _pageOptions[value],
      bottomNavigationBar: GNav(
        gap : 16,
        // backgroundColor: context.primaryColor.withOpacity(.07),
        activeColor: context.primaryColor,
        color: context.primaryColor,
        tabBackgroundColor: context.primaryColor.withOpacity(.2),
        padding: EdgeInsets.all(16),
        selectedIndex: 0,
        tabs: [
          GButton(icon: Icons.home_outlined, text: "হোম",),
          GButton(icon: Icons.list_outlined, text: "তালিকা",),
          GButton(icon: Icons.favorite_border_outlined, text: "পছন্দ",),
        ],
        onTabChange: (_){setState(() {
          value = _;
        });},
      ).p12().backgroundColor(context.primaryColor.withOpacity(.03))


    );
  }





}