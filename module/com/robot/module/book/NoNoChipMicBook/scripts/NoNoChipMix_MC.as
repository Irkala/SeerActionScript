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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1203")]
   public dynamic class NoNoChipMix_MC extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var btn5:SimpleButton;
      
      public var btn6:SimpleButton;
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var mc5:MovieClip;
      
      public var mc6:MovieClip;
      
      public var mc7:MovieClip;
      
      public var mc8:MovieClip;
      
      public var btn8:SimpleButton;
      
      public var powerBtn:SimpleButton;
      
      public var i1:int;
      
      public var btn7:SimpleButton;
      
      public var powerMc:MovieClip;
      
      public function NoNoChipMix_MC()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         powerMc = mc1;
         powerBtn = btn1;
         i1 = 1;
         while(i1 < 9)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            this["mc" + i1].visible = false;
            ++i1;
         }
         powerMc.visible = true;
         powerBtn.visible = false;
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
   }
}

