import 'package:flutter/material.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/pages/song_page.dart';
import 'package:nazruldex2/widgets/item.dart';
import 'package:nazruldex2/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";
import "dart:math";

class RandomSongList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var randArray = [];
    var rng = Random();
    for(int i = 0; i < 8; i++)randArray.add(rng.nextInt(3000));
    return Column(
      children:[
        ...randArray.map((element){
          var song = DataList.AllSongs![element];
          return ItemWidget(song: song);
        })
      ]
    );
  }
}