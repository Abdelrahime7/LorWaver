 
import 'package:flutter/material.dart';

 class UserTtype extends StatelessWidget
 {
  const UserTtype ({super.key});

@override
 Widget build(BuildContext context)
 {
  return Scaffold(
       backgroundColor:Theme.of(context).colorScheme.surface,
 
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
    fontSize: 16, // equivalent to text-base
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade400 // dark:text-slate-400
        : Colors.grey.shade600, // text-slate-600
  ),
),
Container(
  margin: const EdgeInsets.only(top: 40), // mt-10
  padding: const EdgeInsets.all(16), // p-4
  decoration: BoxDecoration(
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.blueGrey.shade900.withOpacity(0.5) // dark:bg-slate-900/50
        : Colors.white, // bg-white
    borderRadius: BorderRadius.circular(12), // rounded-lg
    border: Border.all(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.blueGrey.shade700 // dark:border-slate-700
          : Colors.blueGrey.shade300, // border-slate-300
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // justify-between
    children: [
      Text(
        'Gamers',
        style: TextStyle(
          fontWeight: FontWeight.w500, // font-medium
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade200 // dark:text-slate-200
              : Colors.blueGrey.shade800, // text-slate-800
          fontSize: 16,
        ),
      ),
      // You can add a trailing widget here, like a checkbox or icon
    ],
  ),
),
Container(
  margin: const EdgeInsets.only(top: 40), // mt-10
  padding: const EdgeInsets.all(16), // p-4
  decoration: BoxDecoration(
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.blueGrey.shade900.withOpacity(0.5) // dark:bg-slate-900/50
        : Colors.white, // bg-white
    borderRadius: BorderRadius.circular(12), // rounded-lg
    border: Border.all(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.blueGrey.shade700 // dark:border-slate-700
          : Colors.blueGrey.shade300, // border-slate-300
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // justify-between
    children: [
      Text(
        'Writer',
        style: TextStyle(
          fontWeight: FontWeight.w500, // font-medium
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade200 // dark:text-slate-200
              : Colors.blueGrey.shade800, // text-slate-800
          fontSize: 16,
        ),
      ),
      // You can add a trailing widget here, like a checkbox or icon
    ],
  ),
),
Container(
  margin: const EdgeInsets.only(top: 40), // mt-10
  padding: const EdgeInsets.all(16), // p-4
  decoration: BoxDecoration(
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.blueGrey.shade900.withOpacity(0.5) // dark:bg-slate-900/50
        : Colors.white, // bg-white
    borderRadius: BorderRadius.circular(12), // rounded-lg
    border: Border.all(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.blueGrey.shade700 // dark:border-slate-700
          : Colors.blueGrey.shade300, // border-slate-300
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // justify-between
    children: [
      Text(
        'Movies creators',
        style: TextStyle(
          fontWeight: FontWeight.w500, // font-medium
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade200 // dark:text-slate-200
              : Colors.blueGrey.shade800, // text-slate-800
          fontSize: 16,
        ),
      ),
      // You can add a trailing widget here, like a checkbox or icon
    ],
  ),
),
Container(
  margin: const EdgeInsets.only(top: 40), // mt-10
  padding: const EdgeInsets.all(16), // p-4
  decoration: BoxDecoration(
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.blueGrey.shade900.withOpacity(0.5) // dark:bg-slate-900/50
        : Colors.white, // bg-white
    borderRadius: BorderRadius.circular(12), // rounded-lg
    border: Border.all(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.blueGrey.shade700 // dark:border-slate-700
          : Colors.blueGrey.shade300, // border-slate-300
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // justify-between
    children: [
      Text(
        'Animies Makers',
        style: TextStyle(
          fontWeight: FontWeight.w500, // font-medium
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade200 // dark:text-slate-200
              : Colors.blueGrey.shade800, // text-slate-800
          fontSize: 16,
        ),
      ),
      // You can add a trailing widget here, like a checkbox or icon
    ],
  ),
)





      
        ],
      
      
      ),
    ) ,




  );
 }
 }