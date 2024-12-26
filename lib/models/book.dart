class Book {
  String title;
  String author;
  String status; // "To Read", "Reading", "Finished"
  DateTime? startDate;
  DateTime? finishDate;

  Book({
    required this.title,
    required this.author,
    required this.status,
    this.startDate,
    this.finishDate,
  });

  // Convert a Book object to a Map (for storage)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'status': status,
      'startDate': startDate?.toIso8601String(), // Store dates as ISO strings
      'finishDate': finishDate?.toIso8601String(),
    };
  }

  // Create a Book object from a Map (for retrieval from storage)
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'],
      author: map['author'],
      status: map['status'],
      startDate:
          map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
      finishDate:
          map['finishDate'] != null ? DateTime.parse(map['finishDate']) : null,
    );
  }
}
