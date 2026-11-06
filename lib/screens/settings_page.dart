import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget { const SettingsPage({super.key});
@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar( title: const Text( 'Settings', style: TextStyle(fontWeight: FontWeight.bold), ), backgroundColor: const Color(0xFFF7F8F4), ), body: Padding( padding: const EdgeInsets.all(20), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ const Text( 'App Settings', style: TextStyle( fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF344B39), ), ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.task_alt,
                color: Color(0xFF78947B),
                size: 30,
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Manager',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Organize your daily tasks easily.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
} }