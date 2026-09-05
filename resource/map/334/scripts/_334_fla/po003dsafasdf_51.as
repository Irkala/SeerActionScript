package _334_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol135")]
   public dynamic class po003dsafasdf_51 extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public function po003dsafasdf_51()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function onMouseOver(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

