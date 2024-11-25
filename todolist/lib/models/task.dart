class Task {
  String? _imageUrl;
  String? _title;
  int? _dificulty;

  Task(
      {required String imageUrl,
      required String title,
      required int dificulty}) {
    _imageUrl = imageUrl;
    _title = title;
    _dificulty = dificulty;
  }

  String? get imageUrl => _imageUrl;
  String? get title => _title;
  int? get dificulty => _dificulty;

  set setTitle(title) => _title = title;
  set setImageUrl(imageUrl) => _imageUrl = imageUrl;
  set setDificulty(dificulty) => _dificulty = dificulty;
}
