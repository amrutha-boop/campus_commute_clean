class LostItem {
  String name;
  String description;
  String contact;
  String? imagePath;
  String category;
  bool isFound;
  int likes;
  DateTime timestamp;

  LostItem({
    required this.name,
    required this.description,
    required this.contact,
    this.imagePath,
    this.category='uncategorized',
    this.isFound=false,
    this.likes=0,
    DateTime?timestamp,
  }): timestamp=timestamp ?? DateTime.now();
}