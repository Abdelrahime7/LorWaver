import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CraftingWorld extends StatelessWidget
{

@override
Widget build(BuildContext context)
{
return Scaffold(
  backgroundColor: Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF1B0F23)
      : const Color(0xFFF7F5F8),
  body: Stack(
    children: [
      // Main content
      Column(
        children: [
          const SizedBox(height: 200),
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              color: const Color.fromARGB(51, 75, 0, 130),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(128, 255, 215, 0),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(51, 75, 0, 130),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/CraftingIcon.svg',
                color: const Color(0xFF7005BD),
                width: 64,
                height: 64,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Crafting Your World...",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade900,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 320,
            child: Text(
              "The LoreWeaver AI is weaving the fabric of your unique realm. Please wait a few moments.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade400
                    : Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),

      // Progress bar pinned at bottom
      Positioned(
        bottom: 24,
        left: 24,
        right: 24,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.blue.withOpacity(0.3)
                    : Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.45,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Overall Progress",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[400]
                    : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);


}
}