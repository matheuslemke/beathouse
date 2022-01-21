class Folder {
  final String name;

  Folder(this.name);

  Map<String, dynamic> toMap() {
    return {
      /// TODO: add identifier
      'name': name,
    };
  }
}
