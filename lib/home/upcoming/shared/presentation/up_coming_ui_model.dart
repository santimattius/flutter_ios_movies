class UpComingModel {
  final String title;
  final String description;
  final String image;
  String releaseDate;

  UpComingModel(
      {required this.title,
      required this.description,
      required this.image,
      this.releaseDate = ""});
}
