package §25_fla§
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol263")]
   public dynamic class Timeline_19 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var standWasteMC:MovieClip;
      
      public var bigMaomao:MovieClip;
      
      public var switchMC:MovieClip;
      
      public var standKMC:MovieClip;
      
      public var mcStone:MovieClip;
      
      public var hitStone:SimpleButton;
      
      public var taskMC:MovieClip;
      
      public var gasEffectMC:MovieClip;
      
      public var door_0:MovieClip;
      
      public var hitMaoMaoMc:MovieClip;
      
      public var standMC:MovieClip;
      
      public var hitKMC:MovieClip;
      
      public var gasMC:MovieClip;
      
      public var kettleMC:MovieClip;
      
      public var mainStone:MovieClip;
      
      public var wasteMC:MovieClip;
      
      public function Timeline_19()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onCliclk(param1:*) : *
      {
         hitStone.visible = false;
         mainStone.addEventListener(Event.ENTER_FRAME,onEnterStone);
         mainStone.gotoAndStop(2);
      }
      
      public function onEnterFalling(param1:*) : *
      {
         var _loc2_:MovieClip = mcStone.mcFalling as MovieClip;
         if(_loc2_.currentFrame == _loc2_.totalFrames)
         {
            mcStone.mcFalling.removeEventListener(Event.ENTER_FRAME,onEnterFalling);
            _loc2_.stop();
            mainStone.mouseChildren = false;
            mainStone.mouseEnabled = false;
            mainStone.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      internal function frame1() : *
      {
         wasteMC.visible = false;
         switchMC.mouseChildren = false;
         switchMC.mouseEnabled = false;
         hitStone.addEventListener(MouseEvent.CLICK,onCliclk);
         mcStone = mainStone;
      }
      
      public function onEnterStone(param1:*) : *
      {
         if(mcStone.currentFrame == 2)
         {
            if(mcStone.mcFalling)
            {
               mainStone.removeEventListener(Event.ENTER_FRAME,onEnterStone);
               mcStone.mcFalling.addEventListener(Event.ENTER_FRAME,onEnterFalling);
            }
         }
      }
   }
}

