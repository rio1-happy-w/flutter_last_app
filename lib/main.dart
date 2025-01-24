// Flutter Task Management App
import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My cool task app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, dynamic>> tasks = [];

  void _addTask(String taskName) {
    setState(() {
      tasks.add({'name': taskName, 'completed': false});
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: tasks.isEmpty
          ? Center(child: Text('タスクがありません。タスクを追加して始めましょう！'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          tasks[index]['name'],
                          style: TextStyle(
                            decoration: tasks[index]['completed']
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      Checkbox(
                        value: tasks[index]['completed'],
                        onChanged: (bool? value) {
                          _toggleTaskCompletion(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(
                onTaskAdded: _addTask,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  final Function(String) onTaskAdded;

  AddTaskScreen({required this.onTaskAdded});

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  onTaskAdded(_taskController.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
