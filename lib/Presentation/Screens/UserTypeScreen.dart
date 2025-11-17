 
import 'package:flutter/material.dart';
import 'package:lorewaver/Presentation/Screens/ReadyToBuildScreen.dart';



class UserTtype extends StatefulWidget {
  const UserTtype({super.key});

  @override
  State<UserTtype> createState() => _UserTtypeState();
}

class _UserTtypeState extends State<UserTtype> {
  String? selectedRole;

  @override
@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final screenHeight = size.height;
  final screenWidth = size.width;

  final fontScale = screenHeight / 800;
  final paddingScale = screenWidth / 430;

  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
    body: SafeArea(
      child: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * paddingScale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40 * fontScale),
                    Text(
                      "What are you creating?",
                      style: TextStyle(
                        fontSize: 32 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12 * fontScale),
                    Text(
                      'Select your primary role to customize your initial experience.',
                      style: TextStyle(
                        fontSize: 16 * fontScale,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 24 * fontScale),
                    buildRoleContainer(context, 'Gamers', fontScale),
                    buildRoleContainer(context, 'Writer', fontScale),
                    buildRoleContainer(context, 'Movies creators', fontScale),
                    buildRoleContainer(context, 'Animies Makers', fontScale),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20 * paddingScale),
              child: SizedBox(
                width: double.infinity,
                height: 56 * fontScale,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 75, 0, 130),
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ReadytoBuild()),
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 15 * fontScale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



  Widget buildRoleContainer(BuildContext context, String roleLabel, double fontScale) {
  return Container(
    margin: EdgeInsets.only(top: 24 * fontScale),
    padding: EdgeInsets.all(16 * fontScale),
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
            fontSize: 16 * fontScale,
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