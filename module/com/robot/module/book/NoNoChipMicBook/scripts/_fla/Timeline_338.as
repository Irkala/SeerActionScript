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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol968")]
   public dynamic class Timeline_338 extends MovieClip
   {
      
      public var __id0_:MovieClip;
      
      public var btn:SimpleButton;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public function Timeline_338()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         trace("=====================");
         var _loc2_:* = getDefinitionByName("com.robot.app.buyItem.HeadquartersAction");
         if(_loc2_)
         {
            _loc2_.buySinItem(700402,1);
         }
      }
      
      internal function frame1() : *
      {
         stop();
         btn.visible = false;
      }
      
      internal function frame2() : *
      {
         stop();
         btn.visible = false;
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 3)
         {
            __setPropDict[__id0_] = 3;
            __setProp___id0__();
         }
         btn.visible = true;
         btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
      
      internal function __setProp___id0__() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 900951;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

