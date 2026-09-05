package ui
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class Block extends Sprite
   {
      
      public var txt:TextField;
      
      public var cols:uint;
      
      public var rows:uint;
      
      private var mc:MovieClip;
      
      public function Block()
      {
         super();
         mc = new BlockMC();
         this.addChild(mc);
         txt = new TextField();
         txt.x = -15;
         txt.y = -15;
      }
      
      public function setMc(i:uint) : void
      {
         mc.gotoAndStop(i);
      }
   }
}

