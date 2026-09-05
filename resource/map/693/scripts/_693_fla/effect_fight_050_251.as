package _693_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol763")]
   public dynamic class effect_fight_050_251 extends MovieClip
   {
      
      public function effect_fight_050_251()
      {
         super();
         addFrameScript(67,frame68);
      }
      
      internal function frame68() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

