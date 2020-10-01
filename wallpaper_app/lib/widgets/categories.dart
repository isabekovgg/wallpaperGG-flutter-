import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/categories.dart';
import 'package:wallpaper_app/views/categories.dart';
import 'package:wallpaper_app/views/image_view.dart';

class CategoriesTile extends StatelessWidget {

  final String imgUrl, title;
  CategoriesTile({@required this.title,@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Categorie(
            categorieName: title.toLowerCase(),
          ) ));
      },
          child: Container(
        margin: EdgeInsets.only(right:4),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover)
            ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),),
          )
        ],)
      ),
    );
  }
}