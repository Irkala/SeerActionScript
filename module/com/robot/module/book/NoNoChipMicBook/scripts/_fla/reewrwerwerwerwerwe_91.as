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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol390")]
   public dynamic class reewrwerwerwerwerwe_91 extends MovieClip
   {
      
      public var btn15:SimpleButton;
      
      public var btn16:SimpleButton;
      
      public var btn11:SimpleButton;
      
      public var btn19:SimpleButton;
      
      public var btn13:SimpleButton;
      
      public var btn17:SimpleButton;
      
      public var btn18:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var btn4:SimpleButton;
      
      public var btn5:SimpleButton;
      
      public var btn6:SimpleButton;
      
      public var btn7:SimpleButton;
      
      public var btn8:SimpleButton;
      
      public var mc:MovieClip;
      
      public var all:uint;
      
      public var btn9:SimpleButton;
      
      public var i1:int;
      
      public var btn10:SimpleButton;
      
      public var btn12:SimpleButton;
      
      public var btn14:SimpleButton;
      
      public function reewrwerwerwerwerwe_91()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         mc.gotoAndStop(1);
         all = 19;
         i1 = 1;
         while(i1 <= all)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onClickHandler);
            ++i1;
         }
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         mc.gotoAndStop(_loc3_);
      }
   }
}

