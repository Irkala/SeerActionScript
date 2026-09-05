package task79donghua1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   [SWF(width="960", height="560", backgroundColor="#666666", frameRate="25")]
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var sc:SoundChannel;
      
      public var mySound:Sound;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1,1,frame2,205,frame206);
      }
      
      internal function frame1() : *
      {
         stop();
         mySound = new SoundUI();
      }
      
      internal function frame2() : *
      {
         sc = mySound.play(0,0);
      }
      
      internal function frame206() : *
      {
         dispatchEvent(new Event("EFFECT_END"));
         sc.stop();
         sc = null;
         mySound = null;
         stop();
      }
   }
}

