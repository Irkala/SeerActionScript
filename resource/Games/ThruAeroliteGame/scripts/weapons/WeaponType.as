package weapons
{
   public class WeaponType
   {
      
      public static const Nothing:Object = {"id":0};
      
      public static const RedBullet:Object = {
         "id":1,
         "interval":3
      };
      
      public static const BlueBullet:Object = {
         "id":2,
         "interval":3
      };
      
      public function WeaponType()
      {
         super();
      }
   }
}

