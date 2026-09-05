package ui
{
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class LineSprite extends Sprite
   {
      
      public function LineSprite()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.filters = [new GlowFilter(16777215,1,8,8)];
      }
      
      public function draw(start:Point, target:Point) : void
      {
         this.graphics.clear();
         this.graphics.lineStyle(2,11403263);
         this.graphics.moveTo(start.x,start.y);
         this.graphics.lineTo(target.x,target.y);
      }
      
      public function clear() : void
      {
         this.graphics.clear();
      }
      
      public function startDraw(p:Point) : void
      {
         this.graphics.lineStyle(2,11403263);
         this.graphics.moveTo(p.x,p.y);
      }
      
      public function endDraw(start:Point, target:Point) : void
      {
         this.graphics.clear();
         var line:Sprite = new Sprite();
         line.graphics.lineStyle(3,11403263);
         line.graphics.moveTo(start.x,start.y);
         line.graphics.lineTo(target.x,target.y);
         this.addChild(line);
         line.filters = [new GlowFilter(16777215,1,5,5)];
      }
   }
}

