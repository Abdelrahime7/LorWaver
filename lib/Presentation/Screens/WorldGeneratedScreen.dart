


import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:lorewaver/Presentation/Screens/CraftingWorldScreen.dart';

typedef WorldData = ({
  String? name,
  String? description,
  String? highlights,
  String? characters,
  String? eras,
  String? mapImageUrl,
  Uint8List? mapImageBytes,
});


class WorldOverviewPage extends StatefulWidget {
  const WorldOverviewPage({super.key, required this.data});
  final WorldData data;

  @override
  State<WorldOverviewPage> createState() => _WorldOverviewPageState();
}

class _WorldOverviewPageState extends State<WorldOverviewPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      _HomeTab(data: widget.data),
      _MapTab(data: widget.data),
      _CharactersTab(data: widget.data),
      _TimelineTab(data: widget.data),
      _LoreTab(data: widget.data),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1E1B4B), // indigo-dark
      body: SafeArea(
        child: screens[_selectedIndex],
      ),

      // === Bottom Navigation ===
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
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

class _HomeTab extends StatelessWidget {
  const _HomeTab({required this.data});
  final WorldData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              Text(
                "Your world,${data.name}, has been successfully created.",
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                    Text(
                    "${data.description}",
                      style: const TextStyle(
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
                                    child: data.mapImageBytes != null
                                        ? Image.memory(data.mapImageBytes!, fit: BoxFit.cover)
                                        : Image.network(
                                            data.mapImageUrl ?? "https://lh3.googleusercontent.com/aida-public/AB6AXuDJW1SLLDlsn2euvmoTNSDn7o-hOWB0iNIFWYAkCimhFD-7bFoOzVKspIR39cE27EQLYID63HCEW7V7mQqbSktYEMA51cPvSTVJyi8vmrjMixn8BvhnPYme0zY5xg2wXFlW9XcxZWkMe1kZFJRcYG18_PH3dNojHL-PDOEtzCmhdYBeihTIzrIxLyBfO0VEp0bJ4cEuioRCObpOF-zD5zGmCndu0z9b8y4mCerqCAhv4wEqgVl0XWWSWbhILv-ZrLiRJcyOvIsohA",
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
                                  children: [
                                    const Icon(Icons.groups,
                                        color: Color(0xFFFBBF24), size: 32),
                                    const SizedBox(height: 4),
                                    Text("${data.characters}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    const Text("Characters",
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
                                  children: [
                                    const Icon(Icons.hourglass_top,
                                        color: Color(0xFFFBBF24), size: 32),
                                    const SizedBox(height: 4),
                                    Text("${data.eras}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    const Text("Timeline Eras",
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
        );
  }
}

class _MapTab extends StatelessWidget {
  const _MapTab({required this.data});
  final WorldData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.public, size: 64, color: Color(0xFFFBBF24)),
          const SizedBox(height: 16),
          Text("Map of ${data.name}",
              style: const TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: data.mapImageBytes != null
                    ? Image.memory(data.mapImageBytes!, fit: BoxFit.contain)
                    : Image.network(
                        data.mapImageUrl ?? "https://lh3.googleusercontent.com/aida-public/AB6AXuDJW1SLLDlsn2euvmoTNSDn7o-hOWB0iNIFWYAkCimhFD-7bFoOzVKspIR39cE27EQLYID63HCEW7V7mQqbSktYEMA51cPvSTVJyi8vmrjMixn8BvhnPYme0zY5xg2wXFlW9XcxZWkMe1kZFJRcYG18_PH3dNojHL-PDOEtzCmhdYBeihTIzrIxLyBfO0VEp0bJ4cEuioRCObpOF-zD5zGmCndu0z9b8y4mCerqCAhv4wEqgVl0XWWSWbhILv-ZrLiRJcyOvIsohA",
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator(color: Color(0xFFFBBF24)));
                        },
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CharactersTab extends StatelessWidget {
  const _CharactersTab({required this.data});
  final WorldData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 64, color: Color(0xFFFBBF24)),
          const SizedBox(height: 16),
          Text("Characters in ${data.name}",
              style: const TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 8),
          Text("Population: ${data.characters}",
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 32),
          const Text("Character list coming soon...",
              style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}

class _TimelineTab extends StatelessWidget {
  const _TimelineTab({required this.data});
  final WorldData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timeline, size: 64, color: Color(0xFFFBBF24)),
          const SizedBox(height: 16),
          Text("Timeline of ${data.name}",
              style: const TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 8),
          Text("Eras: ${data.eras}",
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 32),
          const Text("Timeline events coming soon...",
              style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}

class _LoreTab extends StatelessWidget {
  const _LoreTab({required this.data});
  final WorldData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Icon(Icons.menu_book, size: 64, color: Color(0xFFFBBF24))),
          const SizedBox(height: 16),
          Center(
              child: Text("Lore of ${data.name}",
                  style: const TextStyle(color: Colors.white, fontSize: 24))),
          const SizedBox(height: 32),
          const Text("Description",
              style: TextStyle(
                  color: Color(0xFFFBBF24),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("${data.description}",
              style: const TextStyle(color: Colors.white70, height: 1.5)),
          const SizedBox(height: 24),
          const Text("Highlights",
              style: TextStyle(
                  color: Color(0xFFFBBF24),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("${data.highlights}",
              style: const TextStyle(color: Colors.white70, height: 1.5)),
        ],
      ),
    );
  }
}

  