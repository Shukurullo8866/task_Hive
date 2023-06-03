import 'package:hive/hive.dart';
import 'package:test_task/data/model/image_model/image_db_model.dart';


class CarAdapter extends TypeAdapter<ImageDbModel> {
  @override
  final int typeId = 0;

  @override
  ImageDbModel read(BinaryReader reader) {
     final title = reader.read().toString();
     final url = reader.read().toString();
    return ImageDbModel(title: title,url: url);
  }

  @override
  void write(BinaryWriter writer, ImageDbModel obj) {
    writer.write(obj.title);
     writer.write(obj.url);

  }
}
