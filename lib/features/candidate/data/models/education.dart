class Education {
  String? id;
  String? degree;
  String? college;
  String? startDate;
  String? endDate;

  Education({
    this.id,
    this.degree,
    this.college,
    this.startDate,
    this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json['id'],
    degree: json['degree'],
    college: json['college'],
    startDate: json['startDate'],
    endDate: json['endDate'],
  );
  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'degree': degree,
      'college': college,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
