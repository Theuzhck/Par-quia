class ChapelEntity {
  String chapelName;
  double chapelLocation;
  List? massTimes;
  ChapelEntity({
    required this.chapelName,
    required this.chapelLocation,
    this.massTimes,
  });
}
