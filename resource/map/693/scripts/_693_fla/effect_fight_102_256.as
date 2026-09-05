package _693_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol745")]
   public dynamic class effect_fight_102_256 extends MovieClip
   {
      
      public function effect_fight_102_256()
      {
         super();
         addFrameScript(59,frame60);
      }
      
      internal function frame60() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

