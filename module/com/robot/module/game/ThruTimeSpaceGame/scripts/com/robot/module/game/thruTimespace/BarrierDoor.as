package com.robot.module.game.thruTimespace
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   public class BarrierDoor extends Sprite
   {
      
      public var type:uint = 0;
      
      public var mc:MovieClip;
      
      private var mcArr:Array = [ThruTimespace_DoorMC_0,ThruTimespace_DoorMC_1,ThruTimespace_DoorMC_2];
      
      private var m:MovieClip;
      
      public function BarrierDoor(i:uint)
      {
         super();
         m = new mcArr[i]();
         this.addChild(m);
         mc = m["mc"];
         this.addEventListener(Event.ENTER_FRAME,onEntFrame);
      }
      
      private function onEntFrame(evt:Event) : void
      {
         m.rotation += 2;
      }
      
      public function destroy() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
      }
   }
}

