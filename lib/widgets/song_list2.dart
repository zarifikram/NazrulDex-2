import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:velocity_x/src/flutter/padding.dart';

import 'item.dart';

class SongList2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: DataList.SearchedTaalSongs!.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(song: DataList.SearchedTaalSongs![index],).px16();
        },
      ),
    );
  }

}