package _999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol99")]
   public dynamic class pet_1_21 extends MovieClip
   {
      
      public var pet_in:MovieClip;
      
      public var pet_out:MovieClip;
      
      public function pet_1_21()
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

