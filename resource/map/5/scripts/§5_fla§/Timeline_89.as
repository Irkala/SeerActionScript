package §5_fla§
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol566")]
   public dynamic class Timeline_89 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var tgBtn:SimpleButton;
      
      public var npcHit_mc:MovieClip;
      
      public var petSkillBtn:MovieClip;
      
      public var nibu_npc:MovieClip;
      
      public var wbNpc:MovieClip;
      
      public var fusionMC:MovieClip;
      
      public var monsterBtn:SimpleButton;
      
      public var evHitMC:MovieClip;
      
      public var newMonrMC:MovieClip;
      
      public var petBuyMC:MovieClip;
      
      public var petPropMC:MovieClip;
      
      public var hit_mc:MovieClip;
      
      public var petBook_btn:MovieClip;
      
      public var hitFusionMC:MovieClip;
      
      public var fire_btn:MovieClip;
      
      public var evDoorMC:MovieClip;
      
      public var collectBtn:MovieClip;
      
      public var door_0:MovieClip;
      
      public var glowMC:MovieClip;
      
      public var yanghu_mc:SimpleButton;
      
      public var getPet:MovieClip;
      
      public var getPetHit:MovieClip;
      
      public var hitWbMC:MovieClip;
      
      public var npcDoctor:MovieClip;
      
      public var newMonStand:MovieClip;
      
      public var doctorMC:MovieClip;
      
      public var standWBMC:MovieClip;
      
      public var wbArea:MovieClip;
      
      public var petGene:MovieClip;
      
      public var petGeneHit:MovieClip;
      
      public function Timeline_89()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         glowMC.mouseEnabled = false;
         glowMC.mouseChildren = false;
         glowMC.visible = false;
         glowMC.stop();
         collectBtn.addEventListener(MouseEvent.MOUSE_OVER,onCollOverHandler);
         collectBtn.addEventListener(MouseEvent.MOUSE_OUT,onCollOutHandler);
      }
      
      public function onCollOverHandler(param1:MouseEvent) : void
      {
         collectBtn.gotoAndStop(2);
      }
      
      public function onCollOutHandler(param1:MouseEvent) : void
      {
         collectBtn.gotoAndStop(1);
      }
   }
}

