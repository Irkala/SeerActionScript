package §16_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol116")]
   public dynamic class Timeline_9 extends MovieClip
   {
      
      public var door_1:MovieClip;
      
      public var comp_1:MovieClip;
      
      public var door_0:MovieClip;
      
      public var gasEffectMC:MovieClip;
      
      public var stoneMC:MovieClip;
      
      public var standMC:MovieClip;
      
      public var comp_0:MovieClip;
      
      public var gasMC:MovieClip;
      
      public var hatchTaskMC:MovieClip;
      
      public function Timeline_9()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickStone(param1:*) : *
      {
         stoneMC.play();
      }
      
      internal function frame1() : *
      {
         gasMC.mouseChildren = false;
         stoneMC.buttonMode = true;
         stoneMC.addEventListener(MouseEvent.CLICK,clickStone);
      }
   }
}

