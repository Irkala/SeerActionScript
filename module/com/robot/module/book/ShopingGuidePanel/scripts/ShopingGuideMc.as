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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol697")]
   public dynamic class ShopingGuideMc extends MovieClip
   {
      
      public var __id5_:MovieClip;
      
      public var linkBtn:SimpleButton;
      
      public var __id6_:MovieClip;
      
      public var prevBtn:SimpleButton;
      
      public var __id7_:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var __id10_:MovieClip;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public var menuMc:MovieClip;
      
      public var wordNe:MovieClip;
      
      public var __id8_:MovieClip;
      
      public var __id11_:MovieClip;
      
      public var nextBtn:SimpleButton;
      
      public var __id0_:MovieClip;
      
      public var word2:MovieClip;
      
      public var icon:SimpleButton;
      
      public var __id9_:MovieClip;
      
      public var __id12_:MovieClip;
      
      public var menuBtn:SimpleButton;
      
      public var __id1_:MovieClip;
      
      public var __id13_:MovieClip;
      
      public var __id2_:MovieClip;
      
      public var indexA:Array;
      
      public var __id14_:MovieClip;
      
      public var __id3_:MovieClip;
      
      public var icon2:SimpleButton;
      
      public var __id4_:MovieClip;
      
      public var i1:int;
      
      public function ShopingGuideMc()
      {
         super();
         addFrameScript(0,frame1,6,frame7,7,frame8,8,frame9,18,frame19,2,frame3,3,frame4,4,frame5,5,frame6,9,frame10,10,frame11,11,frame12,12,frame13,13,frame14,14,frame15,15,frame16,16,frame17,17,frame18);
      }
      
      internal function __setProp___id5___12() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240016;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___13() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240017;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
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
         __id8_.itemID = 240023;
         try
         {
            __id8_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onGotoHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         menuMc.visible = false;
         menuMc.gotoAndStop(1);
         this.gotoAndStop(indexA[_loc3_]);
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
         __id4_.itemID = 240030;
         try
         {
            __id4_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___14() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240011;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id12__() : *
      {
         try
         {
            __id12_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id12_.itemID = 240013;
         try
         {
            __id12_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onPrevHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame > 1)
         {
            menuMc.visible = false;
            menuMc.gotoAndStop(1);
            this.gotoAndStop(this.currentFrame - 1);
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
         __id3_.itemID = 240031;
         try
         {
            __id3_["componentInspectorSetting"] = false;
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
         __id7_.itemID = 240019;
         try
         {
            __id7_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame10() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 10)
         {
            __setPropDict[__id5_] = 10;
            __setProp___id5___6();
         }
      }
      
      internal function frame11() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 11)
         {
            __setPropDict[__id5_] = 11;
            __setProp___id5___7();
         }
      }
      
      internal function frame12() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 12)
         {
            __setPropDict[__id5_] = 12;
            __setProp___id5___8();
         }
      }
      
      internal function frame13() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 13)
         {
            __setPropDict[__id5_] = 13;
            __setProp___id5___9();
         }
      }
      
      internal function frame15() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 15)
         {
            __setPropDict[__id5_] = 15;
            __setProp___id5___11();
         }
      }
      
      internal function frame17() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 17)
         {
            __setPropDict[__id5_] = 17;
            __setProp___id5___13();
         }
      }
      
      internal function frame18() : *
      {
         if(__setPropDict[__id14_] == undefined || int(__setPropDict[__id14_]) != 18)
         {
            __setPropDict[__id14_] = 18;
            __setProp___id14__();
         }
         if(__setPropDict[__id13_] == undefined || int(__setPropDict[__id13_]) != 18)
         {
            __setPropDict[__id13_] = 18;
            __setProp___id13__();
         }
         if(__setPropDict[__id12_] == undefined || int(__setPropDict[__id12_]) != 18)
         {
            __setPropDict[__id12_] = 18;
            __setProp___id12__();
         }
         if(__setPropDict[__id11_] == undefined || int(__setPropDict[__id11_]) != 18)
         {
            __setPropDict[__id11_] = 18;
            __setProp___id11__();
         }
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 18)
         {
            __setPropDict[__id5_] = 18;
            __setProp___id5___14();
         }
      }
      
      internal function frame19() : *
      {
         linkBtn.addEventListener(MouseEvent.CLICK,onLinkClickHandler);
      }
      
      internal function frame14() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 14)
         {
            __setPropDict[__id5_] = 14;
            __setProp___id5___10();
         }
      }
      
      internal function frame16() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 16)
         {
            __setPropDict[__id5_] = 16;
            __setProp___id5___12();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id4_] == undefined || int(__setPropDict[__id4_]) != 3)
         {
            __setPropDict[__id4_] = 3;
            __setProp___id4__();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 3)
         {
            __setPropDict[__id3_] = 3;
            __setProp___id3__();
         }
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 3)
         {
            __setPropDict[__id2_] = 3;
            __setProp___id2__();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 3)
         {
            __setPropDict[__id1_] = 3;
            __setProp___id1__();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 3)
         {
            __setPropDict[__id0_] = 3;
            __setProp___id0__();
         }
      }
      
      internal function frame4() : *
      {
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 4)
         {
            __setPropDict[__id0_] = 4;
            __setProp___id0___1();
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
      
      internal function frame8() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 8)
         {
            __setPropDict[__id5_] = 8;
            __setProp___id5___4();
         }
      }
      
      internal function frame9() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 9)
         {
            __setPropDict[__id5_] = 9;
            __setProp___id5___5();
         }
         stop();
         prevBtn.addEventListener(MouseEvent.CLICK,onPrevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,onNextHandler);
         menuBtn.addEventListener(MouseEvent.CLICK,onMenuClickHandler);
      }
      
      internal function frame6() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 6)
         {
            __setPropDict[__id5_] = 6;
            __setProp___id5___2();
         }
      }
      
      internal function frame7() : *
      {
         if(__setPropDict[__id10_] == undefined || int(__setPropDict[__id10_]) != 7)
         {
            __setPropDict[__id10_] = 7;
            __setProp___id10__();
         }
         if(__setPropDict[__id9_] == undefined || int(__setPropDict[__id9_]) != 7)
         {
            __setPropDict[__id9_] = 7;
            __setProp___id9__();
         }
         if(__setPropDict[__id8_] == undefined || int(__setPropDict[__id8_]) != 7)
         {
            __setPropDict[__id8_] = 7;
            __setProp___id8__();
         }
         if(__setPropDict[__id7_] == undefined || int(__setPropDict[__id7_]) != 7)
         {
            __setPropDict[__id7_] = 7;
            __setProp___id7__();
         }
         if(__setPropDict[__id6_] == undefined || int(__setPropDict[__id6_]) != 7)
         {
            __setPropDict[__id6_] = 7;
            __setProp___id6__();
         }
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 7)
         {
            __setPropDict[__id5_] = 7;
            __setProp___id5___3();
         }
      }
      
      internal function frame1() : *
      {
         stop();
         indexA = [3,2,5,6,14,16];
         prevBtn.addEventListener(MouseEvent.CLICK,onPrevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,onNextHandler);
         menuBtn.addEventListener(MouseEvent.CLICK,onMenuClickHandler);
         i1 = 0;
         while(i1 < indexA.length)
         {
            menuMc["mc"]["btn" + i1].addEventListener(MouseEvent.CLICK,onGotoHandler);
            ++i1;
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
         __id5_.itemID = 240018;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
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
         __id5_.itemID = 240001;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___5() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240024;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___6() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240025;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___7() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240002;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___8() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240003;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___9() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240004;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id11__() : *
      {
         try
         {
            __id11_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id11_.itemID = 240012;
         try
         {
            __id11_["componentInspectorSetting"] = false;
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
         __id2_.itemID = 240029;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onNextHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame < this.totalFrames)
         {
            menuMc.visible = false;
            menuMc.gotoAndStop(1);
            this.gotoAndStop(this.currentFrame + 1);
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
         __id5_.itemID = 240000;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id6__() : *
      {
         try
         {
            __id6_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id6_.itemID = 240021;
         try
         {
            __id6_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onMenuClickHandler(param1:MouseEvent) : void
      {
         menuMc.visible = true;
         menuMc.gotoAndPlay(2);
      }
      
      internal function __setProp___id10__() : *
      {
         try
         {
            __id10_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id10_.itemID = 240022;
         try
         {
            __id10_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id14__() : *
      {
         try
         {
            __id14_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id14_.itemID = 240014;
         try
         {
            __id14_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function onLinkClickHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("linkTopayPage"));
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
         __id1_.itemID = 240028;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
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
         __id5_.itemID = 240026;
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
         __id9_.itemID = 240020;
         try
         {
            __id9_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0___1() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 240032;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id13__() : *
      {
         try
         {
            __id13_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id13_.itemID = 240015;
         try
         {
            __id13_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
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
         __id0_.itemID = 240027;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___10() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240009;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5___11() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.itemID = 240010;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

