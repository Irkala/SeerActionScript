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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol308")]
   public dynamic class EliteCoinBook extends MovieClip
   {
      
      public var __id5_:MovieClip;
      
      public var __id16_:MovieClip;
      
      public var __id17_:MovieClip;
      
      public var __id6_:MovieClip;
      
      public var prevBtn:SimpleButton;
      
      public var __id18_:MovieClip;
      
      public var __id7_:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var __id10_:MovieClip;
      
      public var btn5:SimpleButton;
      
      public var __setPropDict:Dictionary = new Dictionary(true);
      
      public var __id19_:MovieClip;
      
      public var __id8_:MovieClip;
      
      public var nextBtn:SimpleButton;
      
      public var __id0_:MovieClip;
      
      public var __id11_:MovieClip;
      
      public var __id9_:MovieClip;
      
      public var __id12_:MovieClip;
      
      public var __id1_:MovieClip;
      
      public var _cur:uint;
      
      public var __id13_:MovieClip;
      
      public var frames:uint;
      
      public var __id2_:MovieClip;
      
      public var __id14_:MovieClip;
      
      public var __id3_:MovieClip;
      
      public var __id15_:MovieClip;
      
      public var __id4_:MovieClip;
      
      public var onBtn:SimpleButton;
      
      public function EliteCoinBook()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8);
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
         __id8_.itemID = 200107;
         try
         {
            __id8_["componentInspectorSetting"] = false;
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
         __id0_.itemID = 200128;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2___10() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.itemID = 200120;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2___11() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.itemID = 200099;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function clickNextHandler(param1:MouseEvent) : void
      {
         if(_cur < frames)
         {
            ++_cur;
            gotoAndStop(_cur);
         }
      }
      
      internal function __setProp___id11___19() : *
      {
         try
         {
            __id11_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id11_.itemID = 200072;
         try
         {
            __id11_["componentInspectorSetting"] = false;
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
         __id12_.itemID = 200061;
         try
         {
            __id12_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id16__() : *
      {
         try
         {
            __id16_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id16_.itemID = 200069;
         try
         {
            __id16_["componentInspectorSetting"] = false;
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
         __id3_.itemID = 200131;
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
         __id7_.itemID = 200105;
         try
         {
            __id7_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame1() : *
      {
         stop();
         frames = this.totalFrames;
         _cur = 1;
         prevBtn.addEventListener(MouseEvent.CLICK,clickPrevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,clickNextHandler);
         onBtn.addEventListener(MouseEvent.CLICK,clickNextHandler1);
      }
      
      internal function __setProp___id4___16() : *
      {
         try
         {
            __id4_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id4_.itemID = 200119;
         try
         {
            __id4_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id4___17() : *
      {
         try
         {
            __id4_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id4_.itemID = 200101;
         try
         {
            __id4_["componentInspectorSetting"] = false;
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
            __setProp___id4___16();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 4)
         {
            __setPropDict[__id3_] = 4;
            __setProp___id3___13();
         }
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 4)
         {
            __setPropDict[__id2_] = 4;
            __setProp___id2___10();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 4)
         {
            __setPropDict[__id1_] = 4;
            __setProp___id1___6();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 4)
         {
            __setPropDict[__id0_] = 4;
            __setProp___id0___2();
         }
      }
      
      internal function frame5() : *
      {
         if(__setPropDict[__id5_] == undefined || int(__setPropDict[__id5_]) != 5)
         {
            __setPropDict[__id5_] = 5;
            __setProp___id5__();
         }
         if(__setPropDict[__id4_] == undefined || int(__setPropDict[__id4_]) != 5)
         {
            __setPropDict[__id4_] = 5;
            __setProp___id4___17();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 5)
         {
            __setPropDict[__id3_] = 5;
            __setProp___id3___14();
         }
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 5)
         {
            __setPropDict[__id2_] = 5;
            __setProp___id2___11();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 5)
         {
            __setPropDict[__id1_] = 5;
            __setProp___id1___7();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 5)
         {
            __setPropDict[__id0_] = 5;
            __setProp___id0___3();
         }
      }
      
      internal function frame2() : *
      {
         if(__setPropDict[__id4_] == undefined || int(__setPropDict[__id4_]) != 2)
         {
            __setPropDict[__id4_] = 2;
            __setProp___id4__();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 2)
         {
            __setPropDict[__id3_] = 2;
            __setProp___id3__();
         }
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 2)
         {
            __setPropDict[__id2_] = 2;
            __setProp___id2__();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 2)
         {
            __setPropDict[__id1_] = 2;
            __setProp___id1__();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 2)
         {
            __setPropDict[__id0_] = 2;
            __setProp___id0__();
         }
      }
      
      internal function frame3() : *
      {
         if(__setPropDict[__id4_] == undefined || int(__setPropDict[__id4_]) != 3)
         {
            __setPropDict[__id4_] = 3;
            __setProp___id4___15();
         }
         if(__setPropDict[__id3_] == undefined || int(__setPropDict[__id3_]) != 3)
         {
            __setPropDict[__id3_] = 3;
            __setProp___id3___12();
         }
         if(__setPropDict[__id2_] == undefined || int(__setPropDict[__id2_]) != 3)
         {
            __setPropDict[__id2_] = 3;
            __setProp___id2___9();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 3)
         {
            __setPropDict[__id1_] = 3;
            __setProp___id1___5();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 3)
         {
            __setPropDict[__id0_] = 3;
            __setProp___id0___1();
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
         if(__setPropDict[__id6_] == undefined || int(__setPropDict[__id6_]) != 6)
         {
            __setPropDict[__id6_] = 6;
            __setProp___id6__();
         }
         if(__setPropDict[__id1_] == undefined || int(__setPropDict[__id1_]) != 6)
         {
            __setPropDict[__id1_] = 6;
            __setProp___id1___8();
         }
         if(__setPropDict[__id0_] == undefined || int(__setPropDict[__id0_]) != 6)
         {
            __setPropDict[__id0_] = 6;
            __setProp___id0___4();
         }
      }
      
      internal function frame7() : *
      {
         if(__setPropDict[__id15_] == undefined || int(__setPropDict[__id15_]) != 7)
         {
            __setPropDict[__id15_] = 7;
            __setProp___id15__();
         }
         if(__setPropDict[__id14_] == undefined || int(__setPropDict[__id14_]) != 7)
         {
            __setPropDict[__id14_] = 7;
            __setProp___id14__();
         }
         if(__setPropDict[__id13_] == undefined || int(__setPropDict[__id13_]) != 7)
         {
            __setPropDict[__id13_] = 7;
            __setProp___id13__();
         }
         if(__setPropDict[__id12_] == undefined || int(__setPropDict[__id12_]) != 7)
         {
            __setPropDict[__id12_] = 7;
            __setProp___id12__();
         }
         if(__setPropDict[__id11_] == undefined || int(__setPropDict[__id11_]) != 7)
         {
            __setPropDict[__id11_] = 7;
            __setProp___id11__();
         }
         if(__setPropDict[__id10_] == undefined || int(__setPropDict[__id10_]) != 7)
         {
            __setPropDict[__id10_] = 7;
            __setProp___id10__();
         }
      }
      
      internal function __setProp___id1___5() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200127;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id4___15() : *
      {
         try
         {
            __id4_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id4_.itemID = 200124;
         try
         {
            __id4_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id1___7() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200102;
         try
         {
            __id1_["componentInspectorSetting"] = false;
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
         __id11_.itemID = 200066;
         try
         {
            __id11_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id15__() : *
      {
         try
         {
            __id15_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id15_.itemID = 200064;
         try
         {
            __id15_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id1___8() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200108;
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
         __id2_.itemID = 200130;
         try
         {
            __id2_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id19__() : *
      {
         try
         {
            __id19_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id19_.itemID = 200071;
         try
         {
            __id19_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id1___6() : *
      {
         try
         {
            __id1_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id1_.itemID = 200122;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame8() : *
      {
         if(__setPropDict[__id19_] == undefined || int(__setPropDict[__id19_]) != 8)
         {
            __setPropDict[__id19_] = 8;
            __setProp___id19__();
         }
         if(__setPropDict[__id18_] == undefined || int(__setPropDict[__id18_]) != 8)
         {
            __setPropDict[__id18_] = 8;
            __setProp___id18__();
         }
         if(__setPropDict[__id17_] == undefined || int(__setPropDict[__id17_]) != 8)
         {
            __setPropDict[__id17_] = 8;
            __setProp___id17__();
         }
         if(__setPropDict[__id16_] == undefined || int(__setPropDict[__id16_]) != 8)
         {
            __setPropDict[__id16_] = 8;
            __setProp___id16__();
         }
         if(__setPropDict[__id11_] == undefined || int(__setPropDict[__id11_]) != 8)
         {
            __setPropDict[__id11_] = 8;
            __setProp___id11___19();
         }
         if(__setPropDict[__id10_] == undefined || int(__setPropDict[__id10_]) != 8)
         {
            __setPropDict[__id10_] = 8;
            __setProp___id10___18();
         }
      }
      
      internal function __setProp___id10___18() : *
      {
         try
         {
            __id10_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id10_.itemID = 200067;
         try
         {
            __id10_["componentInspectorSetting"] = false;
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
         __id6_.itemID = 200104;
         try
         {
            __id6_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
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
         __id10_.itemID = 200063;
         try
         {
            __id10_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id18__() : *
      {
         try
         {
            __id18_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id18_.itemID = 200070;
         try
         {
            __id18_["componentInspectorSetting"] = false;
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
         __id14_.itemID = 200062;
         try
         {
            __id14_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3___12() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200126;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3___13() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200121;
         try
         {
            __id3_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id3___14() : *
      {
         try
         {
            __id3_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id3_.itemID = 200100;
         try
         {
            __id3_["componentInspectorSetting"] = false;
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
         __id9_.itemID = 200106;
         try
         {
            __id9_["componentInspectorSetting"] = false;
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
         __id5_.itemID = 200098;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
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
         __id1_.itemID = 200132;
         try
         {
            __id1_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function clickNextHandler1(param1:MouseEvent) : void
      {
         gotoAndStop(1);
         _cur = 1;
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
         __id0_.itemID = 200123;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0___2() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200118;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      public function clickPrevHandler(param1:MouseEvent) : void
      {
         if(_cur > 1)
         {
            --_cur;
            gotoAndStop(_cur);
         }
      }
      
      internal function __setProp___id0___4() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200103;
         try
         {
            __id0_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id0___3() : *
      {
         try
         {
            __id0_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id0_.itemID = 200097;
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
         __id13_.itemID = 200065;
         try
         {
            __id13_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id17__() : *
      {
         try
         {
            __id17_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id17_.itemID = 200068;
         try
         {
            __id17_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id2___9() : *
      {
         try
         {
            __id2_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id2_.itemID = 200125;
         try
         {
            __id2_["componentInspectorSetting"] = false;
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
         __id4_.itemID = 200129;
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

