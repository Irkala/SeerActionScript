package stone
{
   import flash.display.Sprite;
   
   public class ConSprite
   {
      
      public static var con2:Sprite;
      
      public static var con:Sprite;
      
      public function ConSprite()
      {
         super();
      }
      
      public static function setup2() : void
      {
         if(con2)
         {
            ShootGame.getRoot().removeChild(con2);
         }
      }
      
      public static function setup() : void
      {
         con = new Sprite();
         ShootGame.getRoot().addChildAt(con,1);
         con2 = new Sprite();
         ShootGame.getRoot().addChildAt(con2,2);
      }
   }
}

