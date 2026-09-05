package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol20")]
   public dynamic class attack_mc extends MovieClip
   {
      
      public function attack_mc()
      {
         super();
         addFrameScript(0,frame1,32,frame33);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame33() : *
      {
         stop();
      }
   }
}

