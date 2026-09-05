package _1368_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol86")]
   public dynamic class qweweewterterttert_6 extends MovieClip
   {
      
      public var sd:sound1;
      
      public var sc:SoundChannel;
      
      public function qweweewterterttert_6()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         sd = new sound1();
         sc = sd.play();
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         if(sc != null)
         {
            sc.stop();
         }
      }
      
      internal function frame1() : *
      {
         stop();
         addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
         addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
         sd = new sound1();
      }
   }
}

