package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol131")]
   public dynamic class Two extends MovieClip
   {
      
      public function Two()
      {
         addFrameScript(20,this.frame21);
         super();
      }
      
      internal function frame21() : *
      {
         stop();
      }
   }
}

