import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class PerInfo extends StatelessWidget{
  String infoName, info;
  PerInfo({Key? key, required this.infoName, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(info == "n/a") return Container();
    if(infoName == "স্বরলিপি তথ্য" && info[0] == '[') info = info.eliminateFirst;
    if(infoName == "স্বরলিপি তথ্য" && info.endsWith(']')) info = info.eliminateLast;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (infoName+"ঃ").text.color(context.accentColor.withOpacity(0.7)).make(),
            info.text.xl2.wrapWords(true).make().box.width(context.percentWidth*60).make(),
          ],
        ).py24(),

      ],
    ).box.color(context.canvasColor).shadowMd.rounded.px32.neumorphic(
      color: context.canvasColor,
      curve: VxCurve.emboss,
      elevation: 24,
    ).make().p12();

  }
}