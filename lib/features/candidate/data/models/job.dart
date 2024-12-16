import 'package:flutter/foundation.dart';

import 'company.dart';

class Job {
  String? id;
  String? title;
  String? about;
  Category? sector;
  List<String>? skills;
  int? sallary;
  String? description;
  List<String>? responsibilities;
  List<String>? requirements;
  String? openDate;
  String? closeDate;
  bool? isActive;
  Company? company;

  Job(
      {this.id,
      this.title,
      this.about,
      this.sector,
      this.skills,
      this.sallary,
      this.description,
      this.responsibilities,
      this.requirements,
      this.openDate,
      this.closeDate,
      this.isActive,
      this.company});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['_id'],
      title: json['title'],
      about: json['about'],
      sector: json['sector'],
      skills: json['skills'],
      sallary: json['sallary'],
      description: json['description'],
      responsibilities: json['responsibilities'],
      requirements: json['requirements'],
      openDate: json['openDate'],
      closeDate: json['closeDate'],
      isActive: json['isActive'],
      company: json['company'],
    );
  }
}
