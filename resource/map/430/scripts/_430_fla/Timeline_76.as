package _430_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol268")]
   public dynamic class Timeline_76 extends MovieClip
   {
      
      public var c:Class;
      
      public function Timeline_76()
      {
         super();
         addFrameScript(140,frame141);
      }
      
      internal function frame141() : *
      {
         stop();
         c = getDefinitionByName("org.taomee.manager.EventManager") as Class;
         c.dispatchEvent(new Event("SPT672MOV_End"));
      }
   }
}

