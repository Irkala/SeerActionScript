package ui
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Light extends Sprite
   {
      
      private var mc:MovieClip;
      
      public function Light()
      {
         super();
         mc = new LightMC();
         this.addChild(mc);
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      private function onEntFrame(evt:Event) : void
      {
         this.rotation += 1;
         this.scaleX = 0.8 + Math.random() * 0.2;
         this.scaleY = 0.8 + Math.random() * 0.2;
      }
   }
}

