package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol115")]
   public dynamic class AggMachineMC extends MovieClip
   {
      
      public var giveGift:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var goldMC:MovieClip;
      
      public var goldNum:TextField;
      
      public var bigBox:MovieClip;
      
      public var btn_0:MovieClip;
      
      public var btn_1:MovieClip;
      
      public var btn_2:MovieClip;
      
      public var mc:MovieClip;
      
      public function AggMachineMC()
      {
         addFrameScript(0,this.frame1);
         super();
      }
      
      public function playMC(param1:MouseEvent) : void
      {
         this.mc.gotoAndPlay(1);
      }
      
      internal function frame1() : *
      {
         this.mc.addEventListener(MouseEvent.CLICK,this.playMC);
         this.mc.buttonMode = true;
      }
   }
}

