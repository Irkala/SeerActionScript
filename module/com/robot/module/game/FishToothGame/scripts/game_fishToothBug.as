package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3")]
   public dynamic class game_fishToothBug extends MovieClip
   {
      
      public function game_fishToothBug()
      {
         super();
         addFrameScript(14,this.frame15);
      }
      
      internal function frame15() : *
      {
         stop();
      }
   }
}

