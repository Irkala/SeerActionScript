package _10293_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol586")]
   public dynamic class effect_fight_025_211 extends MovieClip
   {
      
      public function effect_fight_025_211()
      {
         super();
         addFrameScript(29,frame30);
      }
      
      internal function frame30() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

