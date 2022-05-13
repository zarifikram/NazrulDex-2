import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/widgets/item.dart';
import 'package:nazruldex2/widgets/page_title.dart';
import 'package:nazruldex2/widgets/song_list.dart';
// import "package:velocity_x/velocity_x.dart";
import "package:velocity_x/velocity_x.dart";


class AllSongsPage extends StatefulWidget  {
  @override
  State<AllSongsPage> createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  bool start = true;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    if(start == true) DataList.GetAllSongs();
    start = false;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: context.canvasColor,
        )
    );

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          CupertinoSliverNavigationBar(
            border: Border.symmetric(),
            backgroundColor: context.canvasColor,
            largeTitle: "গানের তালিকা".text.color(context.primaryColor).make()
          )
        ],
        body: Column(
          children:[
            SizedBox(height: 40,),
            TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              cursorColor: context.primaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                focusColor: context.primaryColor,
                filled: true,
                label: "Search".text.color(context.primaryColor.withOpacity(.5)).make(),
                prefixIcon: Icon(Icons.search, color: context.primaryColor.withOpacity(.5),),

                prefixIconColor: context.primaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide(
                    color: context.primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide(
                    color: context.primaryColor.withOpacity(.1),
                  ),
                ),
                fillColor: context.primaryColor.withOpacity(.03)
                // hintStyle: TextStyle(
                //   color: context.accentColor,
                //   fontWeight: FontWeight.bold,
                // ),
              ),

              onChanged: (text){
                DataList.SearchSong(text);
                setState((){});
              },
            ).px16().py8(),
            Expanded(
              child: (DataList.AllSongs!.isEmpty) ? Center(child:CircularProgressIndicator()) : SongList(),
            ),
          ],
        ),
      ),
    );
  }
}
