package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16")]
   public dynamic class ChooseSuccessMC extends MovieClip
   {
      
      public function ChooseSuccessMC()
      {
         super();
         addFrameScript(0,frame1,31,frame32);
      }
      
      internal function frame32() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

