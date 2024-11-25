import 'dart:math';

String getInitials(String name) {
  List<String> words = name.split(' ');

  String initials = words.map((word) => word.isNotEmpty ? word[0] : '').join();

  return initials.length > 2
      ? initials.substring(0, 2).toUpperCase()
      : initials.toUpperCase();
}

String randomString(int length) {
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();

  return List.generate(
      length, (index) => characters[random.nextInt(characters.length)]).join();
}
