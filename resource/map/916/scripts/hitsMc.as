package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol47")]
   public dynamic class hitsMc extends MovieClip
   {
      
      public function hitsMc()
      {
         super();
         addFrameScript(24,frame25);
      }
      
      internal function frame25() : *
      {
         stop();
         this.parent.removeChild(this);
      }
   }
}

