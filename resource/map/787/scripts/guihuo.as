package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4")]
   public dynamic class guihuo extends MovieClip
   {
      
      public function guihuo()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         mouseChildren = false;
      }
   }
}

