import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/pages/taal_page.dart';
import 'package:nazruldex2/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';

class TaalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        ...TaalNameList.Taals.map((taal)
      {
        var index = TaalNameList.Taals.indexOf(taal);
        return InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            DataList.SearchSongWithTaal(taal);
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaalSongList(taal: taal)));
            },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                taal.text.xl2.color(context.accentColor.withOpacity(0.9)).make().px32(),
              ],
              ).box.height(100).roundedLg.neumorphic(color: context.canvasColor, elevation: 4).make().py4(),
        );
          }
        ),
      ],
    );
  }


}