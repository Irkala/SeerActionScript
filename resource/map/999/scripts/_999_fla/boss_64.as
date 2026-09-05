package _999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol189")]
   public dynamic class boss_64 extends MovieClip
   {
      
      public var boss_out:MovieClip;
      
      public var circle:MovieClip;
      
      public function boss_64()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

