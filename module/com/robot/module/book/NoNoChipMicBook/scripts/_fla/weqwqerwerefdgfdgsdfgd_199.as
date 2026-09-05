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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol625")]
   public dynamic class weqwqerwerefdgfdgsdfgd_199 extends MovieClip
   {
      
      public var btn2:SimpleButton;
      
      public var pw:Sprite;
      
      public var i1:int;
      
      public var btn1:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public function weqwqerwerefdgfdgsdfgd_199()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onThisBtnClickHandler(param1:MouseEvent) : void
      {
         if(pw)
         {
            pw.visible = false;
         }
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         this.gotoAndStop(_loc3_);
         this["mc" + _loc3_].visible = true;
         pw = this["mc" + _loc3_];
      }
      
      internal function frame1() : *
      {
         stop();
         i1 = 1;
         while(i1 < 4)
         {
            this["mc" + i1].visible = false;
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onThisBtnClickHandler);
            ++i1;
         }
         this["mc1"].visible = true;
         pw = this["mc1"];
      }
   }
}

