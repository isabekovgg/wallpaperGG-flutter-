import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/wallpapers_list.dart';
import 'package:wallpaper_app/widgets/widget.dart';

class Categorie extends StatefulWidget {

  final String categorieName;
  Categorie({this.categorieName});

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  
    List<WallpaperModel> wallpapers = new List();

getSearchWallpapers(String query) async {
    //change value per_page(ne zabit')
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=16",
    headers: {
      "Authorization" : apiKey
    });

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel); 
    });

    setState(() {
      
    });
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categorieName);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: brandName(),
         elevation: 0.0,
       ),
       body: SingleChildScrollView(
                child: Container(
           child: Column(
             children: <Widget>[
                 SizedBox(height: 16,),
                 wallpapersList(wallpapers: wallpapers, context: context)
           ],)
         ),
       ),
    );
  }
}