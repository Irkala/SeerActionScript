package _443_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1241")]
   public dynamic class effect_fight_04_1xx_360 extends MovieClip
   {
      
      public function effect_fight_04_1xx_360()
      {
         super();
         addFrameScript(41,frame42);
      }
      
      internal function frame42() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

