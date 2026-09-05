package _1368_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol112")]
   public dynamic class Timeline_19 extends MovieClip
   {
      
      public var sd:sound2;
      
      public var sc:SoundChannel;
      
      public function Timeline_19()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         sd = new sound2();
         sc = sd.play();
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         sc.stop();
      }
      
      internal function frame1() : *
      {
         stop();
         addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
         addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
         sd = new sound2();
      }
   }
}

