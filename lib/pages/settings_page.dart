import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import "package:velocity_x/velocity_x.dart";

class SettingsPage extends StatelessWidget {
  static const settingDarkMode = "key_dark_mode";
  static const settingFont = "key-font-size";

  @override
  Widget build(BuildContext context) {
    final aboutMe = "Zarif Ikram is a Computer Science sophomore and a music enthusiast. He survives life by getting appreciated by people and laughing at mildly offensive banters.";
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 80, backgroundColor: context.canvasColor,foregroundColor: context.primaryColor,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Settings".text.xl5.color(context.primaryColor).bold.make(),
            SwitchSettingsTile(
              title: "Dark Mode",
              settingKey: SettingsPage.settingDarkMode,
              leading: Icon(Icons.dark_mode, color : context.primaryColor),
              onChange: (_) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.format_size_outlined, color: context.primaryColor).px16(),
                DropDownSettingsTile(
                selected: 3,
                title: "Lyrics Font",
                values: {1 : "Very Small", 2: "Small", 3 : "Regular", 4 : "Big", 5 : "Very Big"},
                settingKey: SettingsPage.settingFont,
              ).w64(context)]
            ),
            VxBox(
              child : ValueChangeObserver(
                builder: (BuildContext , value, _) {
                  switch(value){
                    case 1: return "তুমি শুনিতে চেওনা আমার মনের কথা".text.center.xl.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                    case 2: return "তুমি শুনিতে চেওনা আমার মনের কথা".text.center.xl2.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                    case 3: return "তুমি শুনিতে চেওনা আমার মনের কথা".text.center.xl3.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                    case 4: return "তুমি শুনিতে চেওনা আমার মনের কথা".text.center.xl4.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                    case 5: return "তুমি শুনিতে চেওনা আমার মনের কথা".text.center.xl5.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                    default: return "তুমি শুনিতে চেওনা আমার মনের কথা".text.center.xl3.color(context.accentColor.withOpacity(0.7)).makeCentered().p16();
                  }
                },
                defaultValue: 3,
                cacheKey: SettingsPage.settingFont,
              ),
            ).width(500).height(240).color(context.primaryColor.withOpacity(.07)).make().py8(),
            ExpandableSettingsTile(title: "Contact Developer", leading: Icon(Icons.email_outlined, color : context.primaryColor),children: ["1905111@cse.buet.ac.bd".text.xl.make().pOnly(bottom: 8).h8(context)]),
            ExpandableSettingsTile(title: "About Developer", leading: Icon(Icons.person, color : context.primaryColor),children: [aboutMe.text.xl.make().pOnly(bottom: 16).h20(context)]),
          ],
        ).px24().py4(),
      ),
    );
  }
}


