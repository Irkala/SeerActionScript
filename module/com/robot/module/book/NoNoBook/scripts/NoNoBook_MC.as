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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol359")]
   public dynamic class NoNoBook_MC extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var bookLinkBtn:SimpleButton;
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var i1:int;
      
      public var superNo_btn:SimpleButton;
      
      public var po:MovieClip;
      
      public function NoNoBook_MC()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:uint = uint(param1.currentTarget.name.slice(3,param1.currentTarget.name.length));
         this.gotoAndStop(_loc2_);
         po.visible = false;
         this["mc" + _loc2_].visible = true;
         po = this["mc" + _loc2_];
      }
      
      internal function frame1() : *
      {
         stop();
         i1 = 1;
         while(i1 < 5)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            this["mc" + i1].visible = false;
            ++i1;
         }
         this["mc1"].visible = true;
         po = this["mc1"];
         bookLinkBtn.addEventListener(MouseEvent.CLICK,onClickHandler1);
         superNo_btn.addEventListener(MouseEvent.CLICK,onClickHandler2);
      }
      
      public function onClickHandler2(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("supernonooper"));
      }
      
      public function onClickHandler1(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event(Event.OPEN));
      }
   }
}

