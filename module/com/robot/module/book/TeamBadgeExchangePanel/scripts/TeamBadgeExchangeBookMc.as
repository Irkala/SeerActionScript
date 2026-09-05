package
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol154")]
   public dynamic class TeamBadgeExchangeBookMc extends MovieClip
   {
      
      public var __id9_:MovieClip;
      
      public var __id7_:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var __id5_:MovieClip;
      
      public var __id3_:MovieClip;
      
      public var __id1_:MovieClip;
      
      public var total:uint;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public var __id8_:MovieClip;
      
      public var __id4_:MovieClip;
      
      public var __id2_:MovieClip;
      
      public var nextBtn:SimpleButton;
      
      public var prevBtn:SimpleButton;
      
      public function TeamBadgeExchangeBookMc()
      {
         super();
         addFrameScript(0,frame1,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8);
      }
      
      internal function __setProp___id5__() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.exId = 2;
         __id5_.needCount = 255;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id7__() : *
      {
         try
         {
            __id7_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id7_.exId = 8;
         __id7_.needCount = 20;
         try
         {
            __id7_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___3() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.exId = 11;
         __id5_.needCount = 1;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id9__() : *
      {
         try
         {
            __id9_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id9_.exId = 9;
         __id9_.needCount = 20;
         try
         {
            __id9_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame1() : *
      {
         stop();
         total = this.totalFrames;
         prevBtn.visible = false;
         nextBtn.visible = true;
         prevBtn.addEventListener(MouseEvent.CLICK,onPrevClickHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,onNextClickHandler);
      }
      
      internal function __setProp___id8__() : *
      {
         try
         {
            __id8_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id8_.exId = 10;
         __id8_.needCount = 20;
         try
         {
            __id8_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id4_] == undefined || int(__setPropDict[__id4_]) != 4)
         {
            __setPropDict[__id4_] = 4;
            __setProp___id4__();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 4)
         {
            __setPropDict[__id3_] = 4;
            __setProp___id3__();
         }
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 4)
         {
            __setPropDict[__id2_] = 4;
            __setProp___id2__();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 4)
         {
            __setPropDict[__id1_] = 4;
            __setProp___id1___1();
         }
      }
      
      internal function frame6() : *
      {
         if(__setPropDict[__id9_] == undefined || int(__setPropDict[__id9_]) != 6)
         {
            __setPropDict[__id9_] = 6;
            __setProp___id9__();
         }
         if(__setPropDict[__id8_] == undefined || int(__setPropDict[__id8_]) != 6)
         {
            __setPropDict[__id8_] = 6;
            __setProp___id8__();
         }
         if(__setPropDict[__id7_] == undefined || int(__setPropDict[__id7_]) != 6)
         {
            __setPropDict[__id7_] = 6;
            __setProp___id7__();
         }
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 6)
         {
            __setPropDict[__id5_] = 6;
            __setProp___id5___2();
         }
      }
      
      internal function frame8() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 8)
         {
            __setPropDict[__id5_] = 8;
            __setProp___id5___4();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 3)
         {
            __setPropDict[__id1_] = 3;
            __setProp___id1__();
         }
      }
      
      internal function __setProp___id1___1() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.exId = 3;
         __id1_.needCount = 50;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame5() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 5)
         {
            __setPropDict[__id5_] = 5;
            __setProp___id5__();
         }
      }
      
      internal function frame7() : *
      {
         if(__setPropDict[__id8_] == undefined || int(__setPropDict[__id8_]) != 7)
         {
            __setPropDict[__id8_] = 7;
            __setProp___id8___6();
         }
         if(__setPropDict[__id7_] == undefined || int(__setPropDict[__id7_]) != 7)
         {
            __setPropDict[__id7_] = 7;
            __setProp___id7___5();
         }
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 7)
         {
            __setPropDict[__id5_] = 7;
            __setProp___id5___3();
         }
      }
      
      internal function __setProp___id5___2() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.exId = 7;
         __id5_.needCount = 40;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onPrevClickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame > 1)
         {
            if(this.currentFrame == 2)
            {
               prevBtn.visible = false;
               nextBtn.visible = true;
            }
            else
            {
               prevBtn.visible = true;
               nextBtn.visible = true;
            }
            this.gotoAndStop(this.currentFrame - 1);
         }
      }
      
      internal function __setProp___id5___4() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.exId = 1;
         __id5_.needCount = 200;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id7___5() : *
      {
         try
         {
            __id7_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id7_.exId = 12;
         __id7_.needCount = 1;
         try
         {
            __id7_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id8___6() : *
      {
         try
         {
            __id8_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id8_.exId = 13;
         __id8_.needCount = 3;
         try
         {
            __id8_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onNextClickHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame < total)
         {
            if(this.currentFrame == total - 1)
            {
               prevBtn.visible = true;
               nextBtn.visible = false;
            }
            else
            {
               prevBtn.visible = true;
               nextBtn.visible = true;
            }
            this.gotoAndStop(this.currentFrame + 1);
         }
      }
      
      internal function __setProp___id1__() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.exId = 14;
         __id1_.needCount = 300;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2__() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.exId = 5;
         __id2_.needCount = 30;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3__() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.exId = 4;
         __id3_.needCount = 30;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id4__() : *
      {
         try
         {
            __id4_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id4_.exId = 6;
         __id4_.needCount = 30;
         try
         {
            __id4_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

