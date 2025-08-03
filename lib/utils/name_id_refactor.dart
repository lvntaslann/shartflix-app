class NameIdRefactor {
 static String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

static String shortenId(String id) {
  if (id.isEmpty) return "------";
  return id.length > 6 ? id.substring(0, 6) : id;
}
}