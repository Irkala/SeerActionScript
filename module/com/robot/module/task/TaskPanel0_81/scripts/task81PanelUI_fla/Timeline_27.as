package task81PanelUI_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol72")]
   public dynamic class Timeline_27 extends MovieClip
   {
      
      public function Timeline_27()
      {
         super();
         addFrameScript(63,frame64);
      }
      
      internal function frame64() : *
      {
         MovieClip(this.parent).dispatchEvent(new Event("enddh"));
         stop();
      }
   }
}

