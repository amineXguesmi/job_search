import 'job.dart';

class AppliedJob {
  Job? job;
  String? appliedDate;
  String? status;

  AppliedJob({
    this.job,
    this.appliedDate,
    this.status,
  });

  factory AppliedJob.fromJson(Map<String, dynamic> json) {
    return AppliedJob(
      job: json['job'],
      appliedDate: json['appliedDate'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job': job,
      'appliedDate': appliedDate,
      'status': status,
    };
  }
}
