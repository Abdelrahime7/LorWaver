 class WorldPrompt
{
  WorldPrompt._();
  
  static String ?type;
   static String ?role;
  static String ?worldSize;
  

  static String prompt() {
    return '''
Generate a ${worldSize ?? "Standard"} ${type ?? "Fantasy"} world designed for a ${role ?? "Game Master"}.
Return ONLY a valid JSON object with the following structure:
{
  "name": "The name of the world",
  "description": "A short one-sentence tagline",
  "highlights": "A detailed paragraph describing the geography, magic/technology, and central conflict",
  "stats": { "characters": 10, "eras": 5 },
  "map_description": "A visual description of the map"
}''';
  }

}