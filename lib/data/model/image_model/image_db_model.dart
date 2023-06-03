import 'package:hive/hive.dart';

import 'image_model.dart';

 class ImageDbModel extends HiveObject {
//   @HiveField(1)
//   num albumId;
//   @HiveField(1)
//   num id;
   @HiveField(0)
   String title;
   @HiveField(0)
   String url;
  //@HiveField(3)
  //List<dynamic> imageModel;

  ImageDbModel({required this.url,required this.title,});
}
