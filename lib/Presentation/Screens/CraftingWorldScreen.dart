// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lorewaver/Application/logic/aigeneratWorld.dart';
import 'package:lorewaver/Presentation/Screens/WorldGeneratedScreen.dart';
 

   

class CraftingWorld extends StatefulWidget
{
  const CraftingWorld({super.key});

  @override
  State<CraftingWorld> createState() => _CraftingWorldState();
}

class _CraftingWorldState extends State<CraftingWorld> {
  double _progress = 0.0;
  Timer? _timer;
  late var future ;

  @override
  void initState() {
    super.initState();
    _generateWorld();
  }
  Future<void> _generateWorld() async { // Start generation once 
  future = AiGenerateWorld.generate(); // Progress simulation: tick every 200ms until 90% 
  _timer = Timer.periodic(const Duration(milliseconds: 350),
   (timer) { setState(() { if (_progress < 0.9) { _progress += 0.01; } }); }); 
   // Wait for generation to finish (~20s)
    var result = await future; // Stop timer and animate to 100%  
    _timer?.cancel(); if (mounted) { 
      // Smooth animation instead of instant jump 
      _animateToCompletion(result); 
      }
       }
       void _animateToCompletion(dynamic result) {
         // Animate progress to 100% over 500ms
        const duration = Duration(milliseconds: 500);
         final target = 1.0; final step = (target - _progress) / (duration.inMilliseconds / 50);
          Timer.periodic(const Duration(milliseconds: 50),
           (timer) { setState(() { _progress += step; if (_progress >= target)
            { _progress = target; timer.cancel(); // Navigate once animation finishes

        Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => WorldOverviewPage(data: result), ), ); } }); }); }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
 


 

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
          Center(
            child: Container(
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
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF7005BD),
                    BlendMode.srcIn,
                  ),
                  width: 64,
                  height: 64,
                ),
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
                    // ignore: deprecated_member_use
                    ? Colors.blue.withOpacity(0.3)
                    : Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _progress,
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
              "Overall Progress ${(_progress * 100).toInt()}%",
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