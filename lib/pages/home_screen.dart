import 'package:flutter/material.dart';
import 'package:nazruldex2/pages/settings_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/Song.dart';
import '../widgets/random_song_row.dart';
import '../widgets/taal_list.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          VxBox().height(48).make(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "হোম".text.xl5.color(context.primaryColor).bold.make(),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
              }, icon: Icon(Icons.settings, size: 32, color: context.primaryColor,))
            ],
          ),

          TaalList().box.make().py8(),
          VxBox().height(20).make(),
          "Discover".text.xl5.color(context.primaryColor).bold.make().py8(),
          (DataList.AllSongs == null || DataList.AllSongs!.isEmpty) ? CircularProgressIndicator().box.makeCentered().p8():RandomSongList().box.make().py8(),
        ],
      ).box.px16.make(),
    );
  }

}