String getInitials(String name) {
  // Pisahkan nama berdasarkan spasi
  List<String> words = name.split(' ');

  // Ambil huruf pertama dari setiap kata, jika ada
  String initials = words.map((word) => word.isNotEmpty ? word[0] : '').join();

  // Batasi inisial hanya 2 huruf
  return initials.length > 2
      ? initials.substring(0, 2).toUpperCase()
      : initials.toUpperCase();
}
