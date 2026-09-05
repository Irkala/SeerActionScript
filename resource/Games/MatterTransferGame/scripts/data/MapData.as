package data
{
   import flash.utils.Dictionary;
   
   public class MapData
   {
      
      public static const mapData:Array = [];
      
      public static const stgWidth:Number = 960;
      
      public static const stgHeight:Number = 560;
      
      public static const blockWidth:Number = 122;
      
      public static const blockHeight:Number = 96;
      
      public static var gameMapDic:Dictionary = new Dictionary(true);
      
      public static var gameBlockDic:Dictionary = new Dictionary(true);
      
      public function MapData()
      {
         super();
      }
      
      public static function destroy() : void
      {
         gameMapDic = new Dictionary(true);
         gameBlockDic = new Dictionary(true);
      }
   }
}

