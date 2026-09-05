package §102_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol370")]
   public dynamic class Timeline_3 extends MovieClip
   {
      
      public var comp_1:MovieClip;
      
      public var arenaHit_1:MovieClip;
      
      public var arenaHit_2:MovieClip;
      
      public var arenaHit_3:MovieClip;
      
      public var arenaMc:MovieClip;
      
      public var douHit:MovieClip;
      
      public var enterFight:MovieClip;
      
      public var enterFightHit:MovieClip;
      
      public var buyMC:MovieClip;
      
      public var door_1:MovieClip;
      
      public var npc:MovieClip;
      
      public var JustinHit:MovieClip;
      
      public var door_2:MovieClip;
      
      public var dou_mc:MovieClip;
      
      public var buyHit:MovieClip;
      
      public var comp_2:MovieClip;
      
      public var Justin:MovieClip;
      
      public var npcHit:MovieClip;
      
      public var arenaTouchBtn_1:MovieClip;
      
      public var arenaTouchBtn_2:MovieClip;
      
      public var arenaTouchBtn_3:MovieClip;
      
      public var pet_mc:MovieClip;
      
      public function Timeline_3()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         door_2.gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         door_2.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
         door_2.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         door_2.gotoAndStop(2);
      }
   }
}

