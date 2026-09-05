package _10012_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol269")]
   public dynamic class Timeline_97 extends MovieClip
   {
      
      public function Timeline_97()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         play();
      }
      
      internal function frame1() : *
      {
         buttonMode = true;
         mouseChildren = false;
         addEventListener(MouseEvent.CLICK,onClick);
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

