package bullet
{
   public class BaseBullet
   {
      
      public var num:int = 0;
      
      public function BaseBullet(num:int)
      {
         super();
         this.num = num;
      }
      
      public function getType() : String
      {
         return "";
      }
   }
}

