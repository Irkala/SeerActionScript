package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol10")]
   public dynamic class One extends MovieClip
   {
      
      public function One()
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

