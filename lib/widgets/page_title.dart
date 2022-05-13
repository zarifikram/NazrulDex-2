import 'package:flutter/cupertino.dart';
import "package:velocity_x/velocity_x.dart";
class PageTitle extends StatelessWidget{
  final String title;

  const PageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title.text.bold.xl4.make();
  }


}