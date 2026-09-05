package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol276")]
   public dynamic class BigThings extends MovieClip
   {
      
      public function BigThings()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
      }
   }
}

