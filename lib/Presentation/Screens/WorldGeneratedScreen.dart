

import 'package:flutter/material.dart';
import 'package:lorewaver/Presentation/Screens/CraftingWorldScreen.dart';


class WorldOverviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B4B), // indigo-dark
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // === Header ===
              ElevatedButton(
                  onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CraftingWorld()),
              ),
              
              child: Text("prev")
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7).withOpacity(0.2), // gold-light/20
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle,
                    color: Color(0xFFFBBF24), size: 48), // gold
              ),
              const SizedBox(height: 16),
              const Text(
                "World Generated!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your world, Eldoria, has been successfully created.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFEF3C7), // gold-light/80
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 32),

              // === Highlights Card ===
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF312E81).withOpacity(0.8), // indigo/80
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "World Highlights",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFBBF24), // gold
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "A realm of soaring mountains and mystical forests, where ancient magic slumbers and epic destinies await. The central kingdom of Aeridor faces threats from the shadowed crags of the north.",
                      style: TextStyle(
                        color: Color(0xFFD1D5DB), // gray-300
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // === Grid ===
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Map Preview
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1B4B).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Map Preview",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      "https://lh3.googleusercontent.com/aida-public/AB6AXuDJW1SLLDlsn2euvmoTNSDn7o-hOWB0iNIFWYAkCimhFD-7bFoOzVKspIR39cE27EQLYID63HCEW7V7mQqbSktYEMA51cPvSTVJyi8vmrjMixn8BvhnPYme0zY5xg2wXFlW9XcxZWkMe1kZFJRcYG18_PH3dNojHL-PDOEtzCmhdYBeihTIzrIxLyBfO0VEp0bJ4cEuioRCObpOF-zD5zGmCndu0z9b8y4mCerqCAhv4wEqgVl0XWWSWbhILv-ZrLiRJcyOvIsohA",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Stats Column
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E1B4B).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: const [
                                    Icon(Icons.groups,
                                        color: Color(0xFFFBBF24), size: 32),
                                    SizedBox(height: 4),
                                    Text("12",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("Characters",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E1B4B).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: const [
                                    Icon(Icons.hourglass_top,
                                        color: Color(0xFFFBBF24), size: 32),
                                    SizedBox(height: 4),
                                    Text("5",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("Timeline Eras",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // === Buttons ===
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFBBF24), // gold
                  foregroundColor: const Color(0xFF1E1B4B), // indigo-dark
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Center(
                  child: Text(
                    "Explore Your World",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF312E81).withOpacity(0.5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Center(
                  child: Text(
                    "Customize Further",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // === Bottom Navigation ===
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1B4B),
        selectedItemColor: const Color(0xFFFBBF24),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Characters"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Timeline"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Lore"),
        ],
      ),
    );
  }
}

  