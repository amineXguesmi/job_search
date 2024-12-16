import 'package:job_search/features/candidate/data/models/job_model.dart';

class GetData {
  final instalogo =
      "https://th.bing.com/th/id/OIP.v-UXvWMoMMUrKl1qlNY3ZQHaHv?rs=1&pid=ImgDetMain";
  final uberlogo =
      "https://th.bing.com/th/id/OIP.7FzBf3Kxd0RtNloMTIsMPQHaHa?rs=1&pid=ImgDetMain";
  final tiktok =
      "https://th.bing.com/th/id/OIP.UAw1TKUOGJGmFnXAksIBwAHaHa?rs=1&pid=ImgDetMain";
  List<JobModel> getJobData() {
    List<JobModel> Jobs = [
      JobModel(
          title: "Senior UX Designer",
          salary: "LKR 80000 / Month",
          companyName: "Instagram",
          logo: instalogo,
          city: "Colombo",
          time: "27 Days Left"),
      JobModel(
          title: "Senior UI Designer",
          salary: "LKR 90000 / Month",
          companyName: "Uber",
          logo: uberlogo,
          city: "Kurunagala",
          time: "27 Days Left"),
      JobModel(
          title: "Senior Mobile App Developer",
          salary: "LKR 180000 / Month",
          companyName: "TikTok",
          logo: tiktok,
          city: "Kandy",
          time: "57 Days Left"),
      JobModel(
          title: "Senior Web Developer",
          salary: "LKR 100000 / Month",
          companyName: "Instagram",
          logo: instalogo,
          city: "Gampaha",
          time: "4 Days Left"),
    ];
    return Jobs;
  }
}
