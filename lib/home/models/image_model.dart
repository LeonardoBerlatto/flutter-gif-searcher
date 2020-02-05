class ImageModel {
  String height;
  String size;
  String url;
  String width;

  ImageModel({String height, String size, String url, String width});

  ImageModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    size = json['size'];
    url = json['url'];
    width = json['width'];
  }
}
