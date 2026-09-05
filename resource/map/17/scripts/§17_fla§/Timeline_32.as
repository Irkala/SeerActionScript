package §17_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol148")]
   public dynamic class Timeline_32 extends MovieClip
   {
      
      public var npc:MovieClip;
      
      public var boss:MovieClip;
      
      public var fire_mc:MovieClip;
      
      public function Timeline_32()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         npc.mouseChildren = false;
         npc.mouseEnabled = false;
         boss.mouseChildren = false;
         boss.mouseEnabled = false;
      }
   }
}

