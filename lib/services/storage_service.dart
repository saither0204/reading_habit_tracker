import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/book.dart';

class StorageService {
  static const _bookKey = 'books';

  Future<List<Book>> getBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookListJson = prefs.getStringList(_bookKey);

    if (bookListJson == null) {
      return [];
    }

    return bookListJson.map((bookJson) {
      return Book.fromMap(jsonDecode(bookJson));
    }).toList();
  }

  Future<void> saveBooks(List<Book> books) async {
    final prefs = await SharedPreferences.getInstance();
    final bookListJson = books.map((book) {
      return jsonEncode(book.toMap());
    }).toList();

    await prefs.setStringList(_bookKey, bookListJson);
  }

  Future<void> addBook(Book book) async {
    final books = await getBooks();
    books.add(book);
    await saveBooks(books);
  }
}
