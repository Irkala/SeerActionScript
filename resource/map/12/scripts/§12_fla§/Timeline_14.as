package §12_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol108")]
   public dynamic class Timeline_14 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var hatchTaskMC:MovieClip;
      
      public var smallMC:MovieClip;
      
      public var bigMC:MovieClip;
      
      public var stoneMC:GuoMC;
      
      public var door_0:MovieClip;
      
      public function Timeline_14()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickSmall(param1:*) : *
      {
         smallMC.gotoAndPlay("down");
         bigMC.gotoAndPlay("up");
      }
      
      internal function frame1() : *
      {
         bigMC.addEventListener(MouseEvent.CLICK,clickBig);
         smallMC.addEventListener(MouseEvent.CLICK,clickSmall);
         bigMC.buttonMode = true;
         smallMC.buttonMode = true;
      }
      
      public function clickBig(param1:*) : *
      {
         bigMC.gotoAndPlay("down");
         smallMC.gotoAndPlay("up");
      }
   }
}

