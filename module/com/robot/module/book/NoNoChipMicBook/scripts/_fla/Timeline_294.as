package _fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol865")]
   public dynamic class Timeline_294 extends MovieClip
   {
      
      public var powerMc:MovieClip;
      
      public var btn2:SimpleButton;
      
      public var i1:int;
      
      public var btn1:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var powerBtn:SimpleButton;
      
      public function Timeline_294()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         powerMc.visible = false;
         powerBtn.visible = true;
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         this.gotoAndStop(_loc3_);
         powerMc = this["mc" + _loc3_];
         powerMc.visible = true;
         powerBtn = this["btn" + _loc3_];
         powerBtn.visible = false;
      }
      
      internal function frame1() : *
      {
         this.gotoAndStop(1);
         i1 = 1;
         while(i1 <= 3)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            this["mc" + i1].visible = false;
            ++i1;
         }
         powerMc = mc1;
         powerMc.visible = true;
         powerBtn = btn1;
         powerBtn.visible = false;
      }
   }
}

