import 'package:flutter/material.dart';

class ProjectListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Projects', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: projectList.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projectList[index]);
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor, // Card color based on theme
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Progress Indicator and Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stack for Progress Indicator and Percentage Value
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: project.percentageCompleted / 100,
                      backgroundColor:
                          Colors.white, // Background color for progress
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Accent color for progress
                      strokeWidth: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${project.percentageCompleted}%', // Display percentage value
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ), // Theme text style
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    project.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge, // Theme text style
                  ),
                ),
                Icon(
                  Icons.work_outline,
                  color: Theme.of(context).iconTheme.color, // Theme icon color
                  size: 28,
                ),
              ],
            ),
            SizedBox(height: 10),

            // Description
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyMedium, // Theme text style
            ),
            SizedBox(height: 10),

            // Start Date, End Date, and Status
            Row(
              children: [
                Icon(Icons.calendar_today,
                    size: 16, color: Theme.of(context).iconTheme.color),
                SizedBox(width: 5),
                Text(
                  'Start: ${project.startDate}',
                  style:
                      Theme.of(context).textTheme.bodySmall, // Theme bodySmall
                ),
                SizedBox(width: 20),
                Icon(Icons.calendar_today,
                    size: 16, color: Theme.of(context).iconTheme.color),
                SizedBox(width: 5),
                Text(
                  'End: ${project.endDate}',
                  style:
                      Theme.of(context).textTheme.bodySmall, // Theme bodySmall
                ),
              ],
            ),
            SizedBox(height: 10),

            // Status and Budget
            Row(
              children: [
                _buildStatusChip(context, project.status),
                Spacer(),
                Text(
                  'Budget: ${project.budget}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ), // Theme text style
                ),
              ],
            ),
            SizedBox(height: 10),

            // Team Members Section with Avatars
            Row(
              children: [
                Text(
                  'Team Members:',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ), // Theme text style
                ),
              ],
            ),
            SizedBox(height: 8),
            _buildTeamMembersAvatars(context, project.teamMembers),
          ],
        ),
      ),
    );
  }

  // Status Chip Widget with Theme Colors
  Widget _buildStatusChip(BuildContext context, String status) {
    Color statusColor;
    if (status == 'Completed') {
      statusColor = Colors.green;
    } else if (status == 'In Progress') {
      statusColor = Colors.orange;
    } else {
      statusColor = Colors.red;
    }

    return Chip(
      label: Text(
        status,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
      backgroundColor: statusColor,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  // Function to build team members avatars
  Widget _buildTeamMembersAvatars(BuildContext context, List<String> members) {
    return Row(
      children: members.map((member) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
            child: Text(
              member,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Sample Data
List<Project> projectList = [
  Project(
    title: 'Mobile App Development',
    description: 'Building a cross-platform mobile application.',
    status: 'In Progress',
    startDate: '01 Jan 2024',
    endDate: '30 Jun 2024',
    percentageCompleted: 65,
    budget: '\$50,000',
    teamMembers: ['Alice', 'Bob', 'Charlie'],
  ),
  Project(
    title: 'Website Redesign',
    description: 'Redesigning the company website for better UX.',
    status: 'Completed',
    startDate: '01 Sep 2023',
    endDate: '31 Dec 2023',
    percentageCompleted: 100,
    budget: '\$20,000',
    teamMembers: ['David', 'Eve'],
  ),
];

// Project Model Class
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
