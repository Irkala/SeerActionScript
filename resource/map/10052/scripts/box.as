package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol78")]
   public dynamic class box extends MovieClip
   {
      
      public var mc_2:MovieClip;
      
      public var mc_3:MovieClip;
      
      public function box()
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

