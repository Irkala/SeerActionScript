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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol978")]
   public dynamic class Timeline_337 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc:MovieClip;
      
      public var i1:int;
      
      public var btn1:SimpleButton;
      
      public var powerBtn:SimpleButton;
      
      public var powerMc:MovieClip;
      
      public var mc2:MovieClip;
      
      public var btn2:SimpleButton;
      
      public function Timeline_337()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         mc.gotoAndStop(_loc3_ + 1);
         if(powerMc)
         {
            powerMc.visible = false;
         }
         if(powerBtn)
         {
            powerBtn.visible = true;
         }
         powerMc = this["mc" + _loc3_];
         powerMc.visible = true;
         powerBtn = this["btn" + _loc3_];
         powerBtn.visible = false;
      }
      
      internal function frame1() : *
      {
         mc.gotoAndStop(1);
         powerMc = new MovieClip();
         powerBtn = new SimpleButton();
         i1 = 1;
         while(i1 < 3)
         {
            this["mc" + i1].visible = false;
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            ++i1;
         }
      }
   }
}

