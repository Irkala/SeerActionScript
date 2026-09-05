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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol507")]
   public dynamic class Timeline_115 extends MovieClip
   {
      
      public var pp:MovieClip;
      
      public var b0:SimpleButton;
      
      public var b1:SimpleButton;
      
      public var b2:SimpleButton;
      
      public var b3:SimpleButton;
      
      public var b4:SimpleButton;
      
      public var b5:SimpleButton;
      
      public var b6:SimpleButton;
      
      public var b7:SimpleButton;
      
      public var b8:SimpleButton;
      
      public var len1:int;
      
      public function Timeline_115()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function eve() : void
      {
         var _loc2_:SimpleButton = null;
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            trace(_loc1_);
            _loc2_ = this["b" + _loc1_] as SimpleButton;
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.overHandler1);
            _loc2_ = null;
            _loc1_++;
         }
      }
      
      public function enterFrameHandler(param1:Event) : *
      {
         if(this.b0)
         {
            this.len1 = this.numChildren - 1;
            removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
            this.eve();
         }
      }
      
      internal function frame1() : *
      {
         this.pp = this;
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      public function overHandler1(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = param1.currentTarget as SimpleButton;
         this.pp.setChildIndex(_loc2_,this.len1);
      }
   }
}

