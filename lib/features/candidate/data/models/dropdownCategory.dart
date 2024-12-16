class DropdownCategory {
  String? id;
  String? title;

  DropdownCategory({this.id, this.title});

  factory DropdownCategory.fromJson(Map<String, dynamic> json) {
    return DropdownCategory(
      id: json['_id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
    };
  }
}
