import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import "package:velocity_x/velocity_x.dart";

class Song{
  final String number;
  final String instituteNumber;
  final String audioRef;
  final String songTitle;
  final String nRecords;
  final String songCategory;
  final String songAbout;
  final String songTaal;
  final String songRaag;
  final String lyricist;
  final String singer;
  final String youtubeLink;
  final String swaralipi;
  final String recordInfo;
  final String otherInfo;
  final String textFile;
  Song(
      {required this.number,
        required this.instituteNumber,
        required this.audioRef,
        required this.songTitle,
        required this.nRecords,
        required this.songCategory,
        required this.songAbout,
        required this.songTaal,
        required this.songRaag,
        required this.lyricist,
        required this.singer,
        required this.youtubeLink,
        required this.swaralipi,
        required this.recordInfo,
        required this.otherInfo,
        required this.textFile,
      }
      );



  factory Song.fromMap(Map<String, dynamic> map){
    return Song(
      number: map["number"],
      instituteNumber: map["instituteNumber"],
      audioRef: map["audioRef"],
      songTitle: map["songTitle"],
      nRecords: map["nRecords"],
      songCategory: map["songCategory"],
      songAbout: map["songAbout"],
      songTaal: map["songTaal"],
      songRaag: map["songRaag"],
      lyricist: map["lyricist"],
      singer: map["singer"],
      youtubeLink: map["youtubeLink"],
      swaralipi: map["swaralipi"],
      recordInfo: map["recordInfo"],
      otherInfo: map["otherInfo"],
      textFile: map["textFile"],
    );
  }

  toMap() =>
      {
        "number": number,
        "instituteNumber": instituteNumber,
        "audioRef": audioRef,
        "songTitle": songTitle,
        "nRecords": nRecords,
        "songCategory": songCategory,
        "songAbout": songAbout,
        "songTaal": songTaal,
        "songRaag": songRaag,
        "lyricist": lyricist,
        "singer": singer,
        "youtubeLink": youtubeLink,
        "swaralipi": swaralipi,
        "recordInfo": recordInfo,
        "otherInfo": otherInfo,
        "textFile": textFile,
      };
}

class DataList {
  static List<Song>? AllSongs;
  static List<Song>? SearchedSongs;
  static List<Song>? SearchedTaalSongs;
  static void SearchSong(String key){
    SearchedSongs = AllSongs!.filter(
            (song) => song.songTitle.contains(key) || song.songAbout.contains(key) || song.songTaal.contains(key) || song.songCategory.contains(key)
                || song.lyricist.contains(key) || song.singer.contains(key) || song.songRaag.contains(key)
    ).toList();
  }
  static void SearchSongWithTaal(String key){
    SearchedTaalSongs = AllSongs!.filter(
            (song) => song.songTaal.compareTo(key) == 0
    ).toList();
  }
  static void GetAllSongs(){ SearchedSongs = AllSongs;}
}


class TaalNameList {
  static List<String> Taals = ["ত্রিতাল", "কাহারবা", "একতাল", "ঝাঁপতাল", "দাদরা", "ফেরতা"];
}

class FavoritesList {
  static String favorites = "";
  static Future<void> Save() async {
    File file = File("favorites.txt");
    print(Directory.current);
    await file.writeAsString(favorites, mode: FileMode.write);
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/favorites.txt');
  }

  static Future<File> write() async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$favorites');
  }

  static void Load() async {
    try {
      final file = await _localFile;

      // Read the file
      favorites = await file.readAsString();

    } catch (e) {
      favorites = await rootBundle.loadString("assets/files/favorites.txt");
      write();
    }
  }
}