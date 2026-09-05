package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol186")]
   public dynamic class HitedEffect extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public function HitedEffect()
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

