class Work {
  String? id;
  String? job_title;
  String? company;
  String? company_location;
  String? work_type;
  String? startDate;
  String? endDate;

  Work({
    this.id,
    this.job_title,
    this.company,
    this.company_location,
    this.work_type,
    this.startDate,
    this.endDate,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
    id: json['id'],
    job_title: json['job_title'],
    company: json['company'],
    company_location: json['company_location'],
    work_type: json['work_type'],
    startDate: json['startDate'],
    endDate: json['endDate'],
  );
  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'job_title': job_title,
      'company': company,
      'company_location': company_location,
      'work_type': work_type,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
