package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol21")]
   public dynamic class bombparent extends MovieClip
   {
      
      public function bombparent()
      {
         super();
         addFrameScript(45,this.frame46);
      }
      
      internal function frame46() : *
      {
         stop();
      }
   }
}

