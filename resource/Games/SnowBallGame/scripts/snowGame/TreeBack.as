package snowGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class TreeBack extends Sprite
   {
      
      private var endX:Number;
      
      private var degrees:Number;
      
      private var _speedX:Number;
      
      private var _speedY:Number;
      
      private var _tree:MovieClip;
      
      private var endY:Number;
      
      public function TreeBack(classt:Class, ran:Number, beishu:int, fx:Number, fy:Number)
      {
         super();
         _tree = new classt();
         addChild(_tree);
         _tree.x = -_tree.width;
         endX = 960 + _tree.width * 2;
         degrees = (90 + ran) * Math.PI / 180;
         _tree.y = (fx - _tree.x) / Math.tan(degrees) + fy;
         degrees = Math.abs(ran) * Math.PI / 180;
         endY = fy - Math.tan(degrees) * (endX - fx);
         var nn:int = (20 - Math.abs(ran)) * beishu * 0.5;
         _speedX = (endX - _tree.x) / nn;
         _speedY = (endY - _tree.y) / nn;
      }
      
      public function destroy() : void
      {
         _tree = null;
      }
      
      public function get endx() : Number
      {
         return endX;
      }
      
      public function get speedY() : Number
      {
         return _speedY;
      }
      
      public function get speedX() : Number
      {
         return _speedX;
      }
   }
}

