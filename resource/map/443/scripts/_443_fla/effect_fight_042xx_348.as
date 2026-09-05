package _443_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1243")]
   public dynamic class effect_fight_042xx_348 extends MovieClip
   {
      
      public function effect_fight_042xx_348()
      {
         super();
         addFrameScript(40,frame41);
      }
      
      internal function frame41() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

