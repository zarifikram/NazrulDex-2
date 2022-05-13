import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/widgets/song_list.dart';
import "package:velocity_x/velocity_x.dart";

import '../widgets/song_list2.dart';

class TaalSongList extends StatelessWidget{
  final String taal;

  const TaalSongList({Key? key, required this.taal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bigText = taal;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.canvasColor,
          foregroundColor: context.primaryColor,
          elevation: 0.0,
          toolbarHeight: 80,
          title: bigText.text.xl3.make(),
        ),
        body: Column(
          children:[
            Expanded(
              child: (DataList.AllSongs!.isEmpty) ? Center(child:CircularProgressIndicator()) : SongList2(),
            ),
          ],
        ),
    );
  }

}