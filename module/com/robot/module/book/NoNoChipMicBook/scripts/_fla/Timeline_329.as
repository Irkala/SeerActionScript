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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol925")]
   public dynamic class Timeline_329 extends MovieClip
   {
      
      public var btn1:SimpleButton;
      
      public var mc:MovieClip;
      
      public var i1:int;
      
      public var mc1:MovieClip;
      
      public function Timeline_329()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         mc.gotoAndStop(_loc3_ + 1);
         mc1.visible = true;
         btn1.visible = false;
      }
      
      internal function frame1() : *
      {
         mc.gotoAndStop(1);
         mc1.visible = false;
         btn1.visible = true;
         i1 = 1;
         while(i1 < 2)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            ++i1;
         }
      }
   }
}

