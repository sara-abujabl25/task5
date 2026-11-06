import 'package:flutter/material.dart';
class HomePage extends StatefulWidget { const HomePage({super.key});
@override State<HomePage> createState() => _HomePageState(); }
class _HomePageState extends State<HomePage> { final _formKey = GlobalKey<FormState>();
final _titleController = TextEditingController(); final _descriptionController = TextEditingController();
String? _priority;
final List<Map<String, String>> _tasks = [];
final Color green = const Color(0xFF78947B);
@override void dispose() { _titleController.dispose(); _descriptionController.dispose(); super.dispose(); }
void _addTask() { if (_formKey.currentState!.validate()) { setState(() { _tasks.add({ 'title': _titleController.text.trim(), 'description': _descriptionController.text.trim(), 'priority': _priority!, }); });
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Task added successfully!'),
      backgroundColor: Color(0xFF78947B),
    ),
  );

  _titleController.clear();
  _descriptionController.clear();

  setState(() {
    _priority = null;
  });

  _formKey.currentState!.reset();
}
}
@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar( title: const Text( 'Task Manager', style: TextStyle(fontWeight: FontWeight.bold), ), backgroundColor: const Color(0xFFF7F8F4), ), body: SingleChildScrollView( padding: const EdgeInsets.all(20), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ const Text( 'Stay Organized', style: TextStyle( fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF344B39), ), ),
        const SizedBox(height: 6),

        Text(
          'Add your tasks and keep track of your day.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'Add New Task',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Task Title'),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter task title',
                    prefixIcon: const Icon(Icons.edit_note),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter task title';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                const Text('Description'),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Enter task description',
                    prefixIcon: const Icon(Icons.description_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                const Text('Priority'),
const SizedBox(height: 8),

                DropdownButtonFormField<String>(
                  initialValue: _priority,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.flag_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  hint: const Text('Select priority'),
                  items: ['Low', 'Medium', 'High']
                      .map((priority) {
                    return DropdownMenuItem(
                      value: priority,
                      child: Text(priority),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _priority = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select priority';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 22),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _addTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 28),

        const Text(
          'My Tasks',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        if (_tasks.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'No tasks yet. Add your first task!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),

        ..._tasks.map((task) {
          return Card(
            color: Colors.white,
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(
                Icons.check_circle_outline,
                color: green,
              ),
              title: Text(
                task['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(task['description']!),
              trailing: Text(
                task['priority']!,
                style: TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ],
    ),
  ),
);
} }