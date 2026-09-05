package _fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol885")]
   public dynamic class Timeline_317 extends MovieClip
   {
      
      public var btn1:SimpleButton;
      
      public var mc:MovieClip;
      
      public var mc1:MovieClip;
      
      public function Timeline_317()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         mc1.visible = false;
         mc.gotoAndStop(1);
         btn1.visible = true;
         btn1.addEventListener(MouseEvent.CLICK,onBtnClickHandler);
      }
      
      public function onBtnClickHandler(param1:MouseEvent) : void
      {
         mc1.visible = true;
         btn1.visible = false;
         mc.gotoAndStop(2);
      }
   }
}

