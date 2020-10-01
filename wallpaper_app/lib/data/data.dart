import 'package:wallpaper_app/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001d25da5c048c34fe7be7ee93613a8e51f";
//row of categories
List<CategoriesModel> getCategories(){

  List<CategoriesModel> categories = new List();
  CategoriesModel categorieModel = new CategoriesModel();

  categorieModel.imgUrl = "https://images.pexels.com/photos/2440024/pexels-photo-2440024.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //

  categorieModel.imgUrl = "https://images.pexels.com/photos/1004014/pexels-photo-1004014.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categorieModel.categorieName = "Anime";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //

    categorieModel.imgUrl = "https://images.pexels.com/photos/2440024/pexels-photo-2440024.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Movies";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //

  categorieModel.imgUrl = "https://images.pexels.com/photos/1004014/pexels-photo-1004014.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categorieModel.categorieName = "Street";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;

}