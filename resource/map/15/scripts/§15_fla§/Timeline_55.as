package §15_fla§
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol280")]
   public dynamic class Timeline_55 extends MovieClip
   {
      
      public var comp_1:MovieClip;
      
      public var waterBtn:SimpleButton;
      
      public var wbHit:MovieClip;
      
      public var pos:Array;
      
      public var fireMC_3:MovieClip;
      
      public var fireMC_4:MovieClip;
      
      public var musicMc:MovieClip;
      
      public var mc:MovieClip;
      
      public var door_0:MovieClip;
      
      public var door_1:MovieClip;
      
      public var wbMC:MovieClip;
      
      public var comp_0:MovieClip;
      
      public var funComp_0:MovieClip;
      
      public var array:Array;
      
      public var musicHit:MovieClip;
      
      public var musicBtn:MovieClip;
      
      public var oreMC:MovieClip;
      
      public var fireMC_0:MovieClip;
      
      public var fireMC_1:MovieClip;
      
      public var fireMC_2:MovieClip;
      
      public function Timeline_55()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function upHandler(param1:*) : *
      {
         var _loc4_:MovieClip = null;
         var _loc5_:MovieClip = null;
         var _loc6_:Point = null;
         var _loc7_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:uint = 0;
         for each(_loc5_ in array)
         {
            if(mc.hitTestPoint(pos[_loc3_].x,pos[_loc3_].y))
            {
               _loc2_ = true;
               _loc4_ = _loc5_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            _loc6_ = pos[_loc3_];
            mc.x = _loc6_.x;
            mc.y = _loc6_.y - 55;
            _loc4_.gotoAndStop(1);
            _loc7_ = array.indexOf(_loc4_);
            array.splice(_loc4_,1);
            _loc7_ = pos.indexOf(_loc6_);
            pos.splice(_loc6_,1);
            mc.gotoAndPlay(2);
         }
         else
         {
            mc.parent.removeChild(mc);
         }
         mc.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         mc.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
         mc = null;
      }
      
      public function initMC(param1:MovieClip) : void
      {
         param1.addEventListener(Event.ENTER_FRAME,enterFrameHandler);
         param1.addEventListener(MouseEvent.MOUSE_UP,upHandler);
      }
      
      public function enterFrameHandler(param1:*) : *
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.x = this.stage.mouseX;
         _loc2_.y = this.stage.mouseY;
      }
      
      internal function frame1() : *
      {
         array = [fireMC_0,fireMC_1,fireMC_2,fireMC_3,fireMC_4];
         pos = [new Point(543,268),new Point(675,340),new Point(647,216),new Point(687,243),new Point(742,268)];
         waterBtn.addEventListener(MouseEvent.MOUSE_DOWN,clickWaterBtn);
      }
      
      public function clickWaterBtn(param1:*) : *
      {
         if(mc)
         {
            mc.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
            mc.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
            mc.parent.removeChild(mc);
         }
         mc = new WaterMC();
         mc.x = param1.stageX;
         mc.y = param1.stageY;
         this.addChild(mc);
         initMC(mc);
      }
   }
}

