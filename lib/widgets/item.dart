import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/pages/song_page.dart';
import "package:velocity_x/velocity_x.dart";

class ItemWidget extends StatefulWidget{
  final Song song;

  const ItemWidget({Key? key, required this.song}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SongDisplay(song: widget.song)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.song.songTitle.text.xl.color(context.accentColor.withOpacity(0.9)).make(),
              (widget.song.songTaal.compareTo("n/a") == 0 ? "" : widget.song.songTaal).text.color(context.accentColor.withOpacity(0.7)).make(),
            ],
          ).w64(context).py12().px24(),
          InkWell(
            child: VxBox(
              child: FavoritesList.favorites[int.parse(widget.song.number)] == "1" ? Icon(Icons.favorite_outlined).p8() : Icon(Icons.favorite_border_outlined).p8(),
            ).roundedFull.neumorphic(color: context.cardColor, elevation: 2, curve: VxCurve.flat).make(),

            onTap: (){
              int number = int.parse(widget.song.number);
              FavoritesList.favorites = FavoritesList.favorites[number] == "1" ? FavoritesList.favorites.replaceRange(number, number + 1, "0") : FavoritesList.favorites.replaceRange(number, number + 1, "1");
              setState(() {});
              FavoritesList.write();
              // save it
            },
          ),
        ],
      ).px4().box.roundedLg.neumorphic(
          color: context.canvasColor,
          curve: VxCurve.concave,
          elevation: 4
      ).make().py8(),
    );
  }
}