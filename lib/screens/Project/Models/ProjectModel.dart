class Project {
  final String title;
  final String description;
  final String status;
  final String startDate;
  final String endDate;
  final int percentageCompleted;
  final String budget;
  final List<String> teamMembers;

  Project({
    required this.title,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.percentageCompleted,
    required this.budget,
    required this.teamMembers,
  });
}
