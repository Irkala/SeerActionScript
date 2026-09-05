package starGame.game
{
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class DrawLine
   {
      
      public static const linecolor:int = 16777215;
      
      public static const linecolor1:int = 16711680;
      
      public static const linecolor2:int = 9301449;
      
      public var star_map:MovieClip;
      
      private var gline:Shape = new Shape();
      
      public function DrawLine()
      {
         super();
         init();
      }
      
      private function getMcLocX(m:SimpleButton) : Number
      {
         return getLocaPoint(m).x;
      }
      
      public function getGline() : Shape
      {
         return gline;
      }
      
      public function changeToRed(s:Sprite, m1:SimpleButton, m2:SimpleButton, c:int, size:int) : void
      {
         s.graphics.clear();
         lineSet(s,m1,m2,c,size);
      }
      
      public function mcTomc(m1:SimpleButton, m2:SimpleButton, c:int, size:int) : Sprite
      {
         var line:Sprite = new Sprite();
         lineSet(line,m1,m2,c,size);
         return line;
      }
      
      public function changeToW(s:Sprite) : void
      {
         s.graphics.clear();
         s.graphics.lineStyle(2,linecolor);
      }
      
      private function lineSet(spr:Sprite, m1:SimpleButton, m2:SimpleButton, c:int, size:int) : void
      {
         spr.graphics.clear();
         spr.graphics.lineStyle(size,c);
         spr.graphics.moveTo(getMcLocX(m1),getMcLocY(m1));
         spr.graphics.lineTo(getMcLocX(m2),getMcLocY(m2));
         setFilter(spr,linecolor);
      }
      
      private function init() : void
      {
         setFilter(gline,linecolor);
      }
      
      public function glineClear() : void
      {
         gline.graphics.clear();
      }
      
      private function getMcLocY(m:SimpleButton) : Number
      {
         return getLocaPoint(m).y;
      }
      
      public function removeLine() : void
      {
         gline.graphics.clear();
      }
      
      private function getLocaPoint(m:SimpleButton) : Point
      {
         var m1:Point = new Point(m.x,m.y);
         var pp:Point = new Point(m.x,m.y);
         if(star_map)
         {
            pp = star_map.localToGlobal(m1);
         }
         return pp;
      }
      
      private function setFilter(s:*, co:int) : void
      {
         var filter:BitmapFilter = getBitmapFilter(co);
         var myFilters:Array = new Array();
         myFilters.push(filter);
         s.filters = myFilters;
      }
      
      private function getBitmapFilter(co:int) : BitmapFilter
      {
         var color:Number = co;
         var alpha:Number = 0.8;
         var blurX:Number = 3;
         var blurY:Number = 3;
         var strength:Number = 3;
         var inner:Boolean = false;
         var knockout:Boolean = false;
         var quality:Number = BitmapFilterQuality.HIGH;
         return new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner,knockout);
      }
      
      public function mcTop(m1:SimpleButton, msx:Number, msy:Number) : void
      {
         gline.graphics.clear();
         gline.graphics.lineStyle(1,linecolor);
         gline.graphics.moveTo(getMcLocX(m1),getMcLocY(m1));
         gline.graphics.lineTo(msx,msy);
      }
   }
}

