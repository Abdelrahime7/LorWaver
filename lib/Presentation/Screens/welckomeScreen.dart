import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

 

class Welckomescreen extends StatelessWidget
 {

const Welckomescreen({super.key});

@override 
 Widget build(BuildContext context)
 {
  return Scaffold(
    
   backgroundColor:Theme.of(context).colorScheme.surface,
  
  body: Column(
    
    children: [
       const SizedBox(height: 55),
      Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              color: const Color.fromARGB(51, 75, 0, 130), // primary/20
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(128, 255, 215, 0), // accent/50
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
                'assets/icons/lorewaver.svg',
                height: 48,
                width: 48,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFFFD700), // accent gold
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
            const SizedBox(height: 45),

      Align(
        
        alignment: Alignment.topCenter,
        child:   Text.rich(
          TextSpan(
            children: [
                       TextSpan
                          (
                           text: 'Welcome to ',
                           style: TextStyle(
                           color: Colors.white,
                           fontSize: 32,
                           fontWeight: FontWeight.bold,
                            ),
                          ),
                       TextSpan
                         (
                          text: 'LoreWaver',
                          style: TextStyle(
                           color: Color(0xFFFFD700), // Gold
                           fontSize: 32,
                           fontWeight: FontWeight.bold,
                           ),
                          ),
                     ],
                   ),

         textAlign: TextAlign.center,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,

        ),
        
      
        
      ),
         
             Text("our universe awaits. Forge worlds "
              "craft characters, and weave epic tales with the ultimate tool for creators.",
             textAlign: TextAlign.center,
             style: TextStyle(
              color: Color.fromARGB(255, 169, 169, 169)


             ),
          
        )
      
    ],
    
  ),

  
  bottomNavigationBar: Padding
  (padding: const EdgeInsets.all(18),
  child:ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56), // py-4 ≈ 56px height
    backgroundColor: const Color.fromARGB(255, 75, 0, 130), // bg-primary
    foregroundColor: Colors.white, // text-white
    elevation: 8, // shadow-lg
    shadowColor: const Color.fromARGB(102, 75, 0, 130), // shadow-primary/40
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // rounded-lg
    )
    
    ),
    onPressed: ()=>(),
     child: Text.rich(
      TextSpan(
       text: ' Begin Your Journey ',
                           style: TextStyle(
                           color: Colors.white,
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
     )
      ),
     
     )

  ) ,
  )
  );
      

    
 
    
    

  
 }

}