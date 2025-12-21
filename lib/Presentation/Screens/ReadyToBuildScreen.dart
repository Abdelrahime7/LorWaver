

import 'package:flutter/material.dart';
import 'package:lorewaver/Presentation/Screens/CraftingWorldScreen.dart';


 class ReadytoBuild extends StatelessWidget 
{
  
  const ReadytoBuild( {super.key});


  
@override
Widget build(BuildContext context)
{
  return Scaffold(
  backgroundColor: Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF1B0F23)
      : const Color(0xFFF7F5F8),
  body: SafeArea(
    child: Column(
      children: [
        Expanded(child: _MainContent()),
         _BottomNavBar(),
      ],
    ),
  ),
);


}


}
class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
        children: [
          // Background image
          Expanded(
    
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuBqFFGF5E2AU1jLN4LrZvBYj-qn4c4jl6oQgQ7tYJ7v-JUg95fE2rnia5Z2A7OKFLMJtKQUJkSu_0mzZ9cpSRuuXm2st8bonv3BfMSiqJ0VhTkr0V7fpsAuO8q8qWco5pJWsJKiqk2sdxAr1po4VQef3V1D6fR-MnvhjF_UxTyv4euKOZEO8Y0g7ZCtbq8vmO1K9FsdlDrQWvioN4oHwQDLyj-ThbApdvWi-B7eETStNNx5RKJAev757fSviccdLCIXHo9fgzzHqA",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Headline and description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ready to Build Your World?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                ),

                const SizedBox(height: 24),
                Text(
                  "Dive into a realm of endless possibilities. Create your first world or explore templates for inspiration.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark ? Colors.grey[300] : Colors.grey[700],
                      ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),

         

          // Buttons
         
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7005BD),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CraftingWorld()),
              ),
              child: const Text("Create New World"),
            ),
          ),
        
          
        ]
    );
      
    
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final inactiveColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xCC1B0F23) : const Color(0xFFF7F5F8),
        border: const Border(top: BorderSide(color: Color(0x337005BD))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _NavItem(icon: Icons.home, active: true),
          _NavItem(icon: Icons.search),
          _NavItem(icon: Icons.add_box),
          _NavItem(icon: Icons.bookmark),
          _NavItem(icon: Icons.person),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool active;

  const _NavItem({required this.icon, this.active = false});

  @override
  Widget build(BuildContext context) {
    final color = active
        ? const Color(0xFF7005BD)
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[400]
            : Colors.grey[600];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: color),
      ],
    );
  }
}
