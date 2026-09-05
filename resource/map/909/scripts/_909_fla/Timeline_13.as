package _909_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol237")]
   public dynamic class Timeline_13 extends MovieClip
   {
      
      public var toothMv:MovieClip;
      
      public var door_0:MovieClip;
      
      public var door_1:MovieClip;
      
      public var earHit:MovieClip;
      
      public var ear:MovieClip;
      
      public var comp_0:MovieClip;
      
      public var comp_1:MovieClip;
      
      public var standCable:MovieClip;
      
      public var cableMC:MovieClip;
      
      public function Timeline_13()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function overHandler(param1:*) : *
      {
         this.cableMC.gotoAndStop(2);
      }
      
      public function outHandler(param1:*) : *
      {
         this.cableMC.gotoAndStop(1);
      }
      
      public function clickHandler(param1:*) : *
      {
         this.cableMC.gotoAndStop(3);
      }
      
      internal function frame1() : *
      {
         this.cableMC.visible = false;
         this.cableMC.addEventListener(MouseEvent.MOUSE_OVER,this.overHandler);
         this.cableMC.addEventListener(MouseEvent.MOUSE_OUT,this.outHandler);
         this.cableMC.addEventListener(MouseEvent.CLICK,this.clickHandler);
      }
   }
}

