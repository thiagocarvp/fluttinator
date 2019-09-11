void main() {
  print(Uri.parse('/').pathSegments);
  Uri uri = Uri.parse("/a/b/c");
  print(uri.pathSegments[0]);
  print(
      uri.pathSegments.sublist(1).reduce((String a, String b) => a + '/' + b));
  print(uri.host);
  print(uri.hasScheme);
}
