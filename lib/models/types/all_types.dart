class AllTypesResult {
  int count;
  String next;
  String previous;
  List<AllTypes> allTypes = [];

  AllTypesResult(this.count, this.next, this.previous, this.allTypes);

  AllTypesResult.fromJson(Map<String, dynamic> json) {
    this.count = json['count'];
    this.next = json['next'];
    this.previous = json['previous'];

    if (json['results'] != null)
      json['results'].forEach((element) {
        this.allTypes.add(AllTypes.fromJson(element));
      });
  }
}

class AllTypes {
  String name;
  String url;

  AllTypes(this.name, this.url);

  AllTypes.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }
}
