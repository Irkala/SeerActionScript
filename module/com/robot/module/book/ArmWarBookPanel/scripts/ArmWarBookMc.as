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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol270")]
   public dynamic class ArmWarBookMc extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var btn0:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var i1:int;
      
      public var nextBtn:SimpleButton;
      
      public var prevBtn:SimpleButton;
      
      public var curPage:uint;
      
      public var a:Array;
      
      public function ArmWarBookMc()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         gotoAndStop(a[_loc3_]);
         curPage = a[_loc3_];
      }
      
      internal function frame1() : *
      {
         stop();
         curPage = 1;
         this["prevBtn"].addEventListener(MouseEvent.CLICK,onPrevClickHandler);
         this["prevBtn"].visible = false;
         this["nextBtn"].visible = true;
         this["nextBtn"].addEventListener(MouseEvent.CLICK,onNextClickHandler);
      }
      
      internal function frame2() : *
      {
         a = [6,10,7,4,8];
         i1 = 0;
         while(i1 < a.length)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            ++i1;
         }
      }
      
      public function onNextClickHandler(param1:MouseEvent) : void
      {
         if(curPage < this.totalFrames)
         {
            this["prevBtn"].visible = true;
            ++curPage;
            this.gotoAndStop(curPage);
            if(curPage == this.totalFrames)
            {
               this["nextBtn"].visible = false;
            }
         }
      }
      
      public function onPrevClickHandler(param1:MouseEvent) : void
      {
         if(curPage > 1)
         {
            this["nextBtn"].visible = true;
            --curPage;
            this.gotoAndStop(curPage);
            if(curPage == 1)
            {
               this["prevBtn"].visible = false;
            }
         }
      }
   }
}

