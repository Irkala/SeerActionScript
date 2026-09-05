package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol8")]
   public dynamic class effect extends MovieClip
   {
      
      public function effect()
      {
         super();
         addFrameScript(0,frame1,75,frame76);
      }
      
      internal function frame76() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

