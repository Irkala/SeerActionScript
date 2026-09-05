package _403_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol150")]
   public dynamic class pet_1_in_50 extends MovieClip
   {
      
      public var circle:MovieClip;
      
      public var pet_static:MovieClip;
      
      public function pet_1_in_50()
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

