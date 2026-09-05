package §27_fla§
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol567")]
   public dynamic class Timeline_44 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var bossMC:MovieClip;
      
      public var bomDoorMc:MovieClip;
      
      public var door_mc:MovieClip;
      
      public var allMovie:MovieClip;
      
      public var doorHit_mc:MovieClip;
      
      public var birdHit:MovieClip;
      
      public var musicMc:MovieClip;
      
      public var door_0:MovieClip;
      
      public var birdBtn:MovieClip;
      
      public var dis_mc:MovieClip;
      
      public var standBoss:MovieClip;
      
      public var birdMc:MovieClip;
      
      public var ruleMc:MovieClip;
      
      public var standRobot:MovieClip;
      
      public var bomMc:MovieClip;
      
      public function Timeline_44()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         door_mc.removeEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
         door_mc.mc1.visible = false;
         door_mc.mc1.gotoAndStop(1);
         door_mc.mc2.visible = true;
      }
      
      internal function frame1() : *
      {
         door_mc.mc1.visible = false;
         door_mc.mc1.gotoAndStop(1);
         door_mc.mc2.visible = true;
         door_mc.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : *
      {
         door_mc.mc1.visible = true;
         door_mc.mc1.play();
         door_mc.mc2.visible = false;
         door_mc.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
   }
}

