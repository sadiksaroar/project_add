import 'package:flutter/material.dart';

void main() {
  runApp(TimeTrackerApp());
}

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProjectManagementScreen(),
    );
  }
}

class ProjectManagementScreen extends StatefulWidget {
  @override
  _ProjectManagementScreenState createState() =>
      _ProjectManagementScreenState();
}

class _ProjectManagementScreenState extends State<ProjectManagementScreen> {
  List<String> projects = ["Project A", "Project B", "Project C"];

  void showAddProjectDialog() {
    TextEditingController projectController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Project"),
          content: TextField(
            controller: projectController,
            decoration: InputDecoration(hintText: "Enter project name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (projectController.text.isNotEmpty) {
                  setState(() {
                    projects.add(projectController.text);
                  });
                }
                Navigator.pop(context); // Close dialog
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Management")),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(projects[index]),
              leading: Icon(Icons.folder, color: Colors.blue),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddProjectDialog,
        child: Icon(Icons.add),
        tooltip: "Add Project",
      ),
    );
  }
}
