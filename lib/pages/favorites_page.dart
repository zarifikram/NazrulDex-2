import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nazruldex2/models/Song.dart';
import "package:velocity_x/velocity_x.dart";

import '../widgets/item.dart';

class FavoritesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var favArray = [];
    int k = 0;
    for(int i = 0; i < 3200; i++){
      if(FavoritesList.favorites[i] == "1") favArray.add(i);
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          CupertinoSliverNavigationBar(
            border: Border.symmetric(),
            backgroundColor: context.canvasColor,
            largeTitle: "পছন্দের গানসমূহ".text.color(context.primaryColor).make(),
          )
        ],
        body: (favArray.length == 0) ? "পছন্দের গানের তালিকা তৈরি করতে গান যুক্ত করুন".text.center.xl2.color(context.accentColor.withOpacity(.3)).makeCentered().px32() : SingleChildScrollView(
          child: Column(
            children:[
              ...favArray.map((element){
                  while(k < 3300){
                    var song = DataList.AllSongs![k];
                    if(song.number.compareTo(element.toString()) == 0) return ItemWidget(song: song);
                    k++;
                  }
                  return ItemWidget(song: DataList.AllSongs![3]);
              })
            ],
          ).p16(),
        ),
      ),
    );
  }

}