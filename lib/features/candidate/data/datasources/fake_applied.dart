import '../models/applyed_jobs.dart';
import 'fake_jobs.dart';

final fakeAppliedJobs = [
  AppliedJob(
    job: fakeJobs[0], // First job from fakeJobs
    appliedDate: "2024-12-10",
    status: "Applied",
  ),
  AppliedJob(
    job: fakeJobs[1], // Second job from fakeJobs
    appliedDate: "2024-12-05",
    status: "Under Review",
  ),
  AppliedJob(
    job: fakeJobs[2], // Third job from fakeJobs
    appliedDate: "2024-11-25",
    status: "Interview Scheduled",
  ),
  AppliedJob(
    job: fakeJobs[3], // Fourth job from fakeJobs
    appliedDate: "2024-12-01",
    status: "Accepted",
  ),
];
