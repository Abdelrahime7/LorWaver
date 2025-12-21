 class WorldPrompt
{
  WorldPrompt._();
  
  static String ?type;
   static String ?role;
  static String ?worldSize;
  

 String prompt() => 'generate a $worldSize $type world for $role';

}