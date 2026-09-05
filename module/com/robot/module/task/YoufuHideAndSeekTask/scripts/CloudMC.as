package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol59")]
   public dynamic class CloudMC extends MovieClip
   {
      
      public function CloudMC()
      {
         super();
         addFrameScript(23,this.frame24,45,this.frame46);
      }
      
      internal function frame46() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         gotoAndPlay(1);
      }
   }
}

