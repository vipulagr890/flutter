import 'dart:typed_data';

import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePickerFacade {
  Future<Uint8List> loadImage() async {
    var resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        cupertinoOptions: CupertinoOptions(
            autoCloseOnSelectionLimit: true, backgroundColor: 'black'),
        materialOptions: MaterialOptions(
          actionBarColor: 'black',
          statusBarColor: 'black',
          autoCloseOnSelectionLimit: true,
          allViewTitle: 'Pick Image',
          selectCircleStrokeColor: 'black',
          startInAllView: true,
        ));
    if (resultList.length == 0) {
      return null;
    } else {
      var asset = resultList.single;
      var byteData = await asset.getByteData();
      return byteData.buffer.asUint8List();
    }
  }
}
