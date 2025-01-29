import '../models/job.dart';

class JobService {
  static List<Job> fetchFeaturedJobs() {
    return [
      Job(title: "Campus Bookstore Assistant", type: "Part-time", salary: 15.0),
    ];
  }
}
