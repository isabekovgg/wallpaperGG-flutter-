import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/search.dart';
import 'package:wallpaper_app/widgets/categories.dart';
import 'package:wallpaper_app/widgets/wallpapers_list.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/curated?per_page=16",
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
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         centerTitle: true,
         title: brandName(),
         elevation: 0.0,
       ),
       body: SingleChildScrollView(
                child: Container(
           child: Column(
             children: <Widget>[
               Container(
                  decoration: BoxDecoration(
                   color: Color(0xfff5f8fd),
                   borderRadius: BorderRadius.circular(30)
                 ),
                 padding: EdgeInsets.symmetric(horizontal: 24),
                 margin: EdgeInsets.symmetric(horizontal: 24),
                 child: Row(children: <Widget>[
                   Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search Wallpapers",
                        border: InputBorder.none
                       )
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context) => Search(
                           searchQuery: searchController.text,
                         ),
                         ));
                     },
                     child: Container(
                       child: Icon(Icons.search)
                       ),
                   ),
                 ],
                 ),
               ),
              SizedBox(height: 16,),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      title: categories[index].categorieName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }),
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
             ],
             )
         ),
       ),
    );
  }
}