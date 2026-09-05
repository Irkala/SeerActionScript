package gunCon
{
   import flash.display.MovieClip;
   
   public interface IGun
   {
      
      function stopShot() : void;
      
      function getBulletTye() : String;
      
      function shot() : void;
      
      function getMC() : MovieClip;
      
      function keepShot() : void;
   }
}

