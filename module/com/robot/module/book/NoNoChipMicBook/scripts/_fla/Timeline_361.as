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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1202")]
   public dynamic class Timeline_361 extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public var proMc:SimpleButton;
      
      public var str:String;
      
      public var preBtn:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var colorMc:MovieClip;
      
      public var btn6:SimpleButton;
      
      public var btn7:SimpleButton;
      
      public var btn5:SimpleButton;
      
      public var btn08:SimpleButton;
      
      public var btn09:SimpleButton;
      
      public var i1:int;
      
      public var i2:int;
      
      public var curPage:uint;
      
      public var nextBtn:SimpleButton;
      
      public var totalPage:uint;
      
      public var btn10:SimpleButton;
      
      public var btn11:SimpleButton;
      
      public var btn12:SimpleButton;
      
      public function Timeline_361()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = param1.currentTarget as SimpleButton;
         if(proMc)
         {
            if(proMc == _loc2_)
            {
               return;
            }
         }
         initMc(_loc2_);
         _loc2_.scaleX *= 1.1;
         _loc2_.scaleY *= 1.1;
         var _loc3_:String = _loc2_.name;
         _loc3_ = _loc3_.substr(3,1);
         toMc(int(_loc3_));
      }
      
      public function onPreBtnClickHandler(param1:MouseEvent) : void
      {
         if(curPage > 1)
         {
            --curPage;
            this.gotoAndStop(curPage);
         }
      }
      
      public function onNextBtnClickHandler(param1:MouseEvent) : void
      {
         if(curPage < totalPage)
         {
            ++curPage;
            this.gotoAndStop(curPage);
         }
      }
      
      public function initMc(param1:SimpleButton) : void
      {
         if(proMc)
         {
            if(proMc == param1)
            {
               return;
            }
            proMc.scaleX *= 0.9;
            proMc.scaleY *= 0.9;
            proMc = param1;
            return;
         }
         proMc = param1;
      }
      
      public function clickHandler1(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = param1.currentTarget as SimpleButton;
         if(proMc)
         {
            if(proMc == _loc2_)
            {
               return;
            }
         }
         initMc(_loc2_);
         _loc2_.scaleX *= 1.1;
         _loc2_.scaleY *= 1.1;
         var _loc3_:String = _loc2_.name;
         _loc3_ = _loc3_.substr(3,2);
         toMc(int(_loc3_));
      }
      
      internal function frame1() : *
      {
         totalPage = 2;
         curPage = 1;
         preBtn.addEventListener(MouseEvent.CLICK,onPreBtnClickHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,onNextBtnClickHandler);
         stop();
         i1 = 1;
         while(i1 < 8)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,clickHandler);
            ++i1;
         }
      }
      
      internal function frame2() : *
      {
         i2 = 8;
         while(i2 < 13)
         {
            str = i2.toString();
            if(i2 < 10)
            {
               str = "0" + str;
            }
            this["btn" + str].addEventListener(MouseEvent.CLICK,clickHandler1);
            ++i2;
         }
      }
      
      public function toMc(param1:int) : void
      {
         mc.gotoAndStop(param1);
         colorMc.gotoAndStop(param1);
      }
   }
}

