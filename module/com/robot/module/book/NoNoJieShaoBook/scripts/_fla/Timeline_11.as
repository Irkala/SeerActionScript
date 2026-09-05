package _fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
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
   import flash.text.engine.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol232")]
   public dynamic class Timeline_11 extends MovieClip
   {
      
      public var b0:SimpleButton;
      
      public var b1:SimpleButton;
      
      public var b2:SimpleButton;
      
      public var b3:SimpleButton;
      
      public var b4:SimpleButton;
      
      public var b5:SimpleButton;
      
      public var b6:SimpleButton;
      
      public var len:int;
      
      public var b8:SimpleButton;
      
      public var b7:SimpleButton;
      
      public function Timeline_11()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function overHandler(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = param1.currentTarget as SimpleButton;
         this.setChildIndex(_loc2_,this.len);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         var _loc3_:SimpleButton = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc3_ = this["b" + _loc2_] as SimpleButton;
            _loc3_.removeEventListener(MouseEvent.MOUSE_OVER,this.overHandler);
            _loc3_ = null;
            _loc2_++;
         }
         MovieClip(this.parent).gotoAndStop(2);
      }
      
      internal function frame1() : *
      {
         stop();
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler1);
      }
      
      public function enterFrameHandler1(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:SimpleButton = null;
         if(this["b7"])
         {
            this.len = this.numChildren - 1;
            removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler1);
            _loc2_ = 0;
            while(_loc2_ < 9)
            {
               _loc3_ = this["b" + _loc2_] as SimpleButton;
               _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this.overHandler);
               _loc3_ = null;
               _loc2_++;
            }
         }
      }
   }
}

