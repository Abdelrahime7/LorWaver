 
import 'package:flutter/material.dart';

class UserTtype extends StatefulWidget {
  const UserTtype({super.key});

  @override
  State<UserTtype> createState() => _UserTtypeState();
}

class _UserTtypeState extends State<UserTtype> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 55),
            Text(
              "What are you creating ?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Select your primary role to customize your initial experience.',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade400
                    : Colors.grey.shade600,
              ),
            ),

            // Gamers
            buildRoleContainer(context, 'Gamers'),

            // Writer
            buildRoleContainer(context, 'Writer'),

            // Movies creators
            buildRoleContainer(context, 'Movies creators'),

            // Animies Makers
            buildRoleContainer(context, 'Animies Makers'),
          ],
        ),
      ),
    );
  }

  Widget buildRoleContainer(BuildContext context, String roleLabel) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.blueGrey.shade900.withOpacity(0.5)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.blueGrey.shade700
              : Colors.blueGrey.shade300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            roleLabel,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade200
                  : Colors.blueGrey.shade800,
              fontSize: 16,
            ),
          ),
          Radio<String>(
            value: roleLabel,
            groupValue: selectedRole,
            onChanged: (value) {
              setState(() {
                selectedRole = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
