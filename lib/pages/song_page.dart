// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:nazruldex2/models/Song.dart';
import 'package:nazruldex2/pages/settings_page.dart';
import 'package:nazruldex2/widgets/per_info.dart';
import 'package:nazruldex2/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";
import "package:sliding_sheet/sliding_sheet.dart";
// import "package:wakelock/wakelock.dart";

class SongDisplay extends StatefulWidget{
  final Song song;

  const SongDisplay({Key? key, required this.song}) : super(key: key);

  @override
  State<SongDisplay> createState() => _SongDisplayState(song);
}

class _SongDisplayState extends State<SongDisplay> {
  final Song song;

  _SongDisplayState(this.song);
  late String songLyrics;

  loadData() async {
    print(song.textFile);
    songLyrics = await rootBundle.loadString("assets/txt/" + song.number + ".txt");
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    // Wakelock.enable();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        foregroundColor: context.primaryColor,
        elevation: 0.0,
        toolbarHeight: 80,
        // title: "গান পরিচিতি".text.color(context.accentColor).xl3.make(),
        actions: [InkWell(
          customBorder: CircleBorder(),
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
        ).p16(),],
      ),
      body: buildBody(),
    );
  }

  Future showSheet() => showSlidingBottomSheet(
    context,
    builder: (context) => SlidingSheetDialog(
      snapSpec: SnapSpec(
        snappings: [0.2, 0.9],
      ),
      cornerRadius: 16,
      color: context.canvasColor,
      headerBuilder: buildHeader,
      builder: buildSheet,
    ),
  );

  Widget buildSheet(BuildContext context, state) {
    final fontSize = Settings.getValue(SettingsPage.settingFont, 3);
    return Column(
      children: [
        Material(
          child: ValueChangeObserver(
            builder: (BuildContext , value, _) {
              switch(value){
                case 1: return songLyrics.text.center.xl.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                case 2: return songLyrics.text.center.xl2.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                case 3: return songLyrics.text.center.xl3.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                case 4: return songLyrics.text.center.xl4.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                case 5: return songLyrics.text.center.xl5.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                default: return songLyrics.text.center.xl3.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
              }
            },
            defaultValue: 3,
            cacheKey: SettingsPage.settingFont,
          ),
        ),
      ],
    );
  }

  Widget buildBody() => SingleChildScrollView(
    child: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          song.songTitle.text.xl4.bold.color(context.primaryColor).wrapWords(true).make().box.width(context.percentWidth*70).make().p12(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "তালঃ".text.color(context.accentColor.withOpacity(0.7)).make(),
                  song.songTaal.text.xl2.wrapWords(true).make().box.width(150).make(),
                ],
              ).py16(),
              showPrimarySongInfo(),

            ],
          ).box.shadowMd.rounded.neumorphic(
            color: context.canvasColor,
            curve: VxCurve.emboss,
            elevation: 24,
          ).make().p12(),
          PerInfo(info: song.songRaag, infoName: "রাগ"),
          PerInfo(info: song.songAbout, infoName: "বিষয়",),
          PerInfo(info: song.songCategory, infoName: "অঙ্গ",),
          PerInfo(info: song.swaralipi, infoName: "স্বরলিপি তথ্য",),
          PerInfo(info: song.otherInfo, infoName: "রেকর্ড তথ্য",),
          PerInfo(info: song.lyricist, infoName: "সুরকার",),
          PerInfo(info: song.singer, infoName: "শিল্পী",),
          PerInfo(info: song.nRecords, infoName: "রেকর্ড সংখ্যা",),
        ],
      ).px8(),
    ),
  );

  Widget buildHeader(BuildContext context, SheetState state) => Material(
    child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VxBox().color(context.accentColor.withOpacity(.8)).size(32, 8).rounded.make().py8(),
        ],
      ).box.width(context.percentWidth*100).color(context.canvasColor).make(),
    );

  Widget showPrimarySongInfo() => MaterialButton(
    onPressed: () {
      showSheet();
    },

    child: "কথা".text.xl3.color(context.cardColor).make().p16(),

  ).box.color(context.backgroundColor.withOpacity(.9)).rounded.make().py16();
}