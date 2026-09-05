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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol352")]
   public dynamic class Timeline_82 extends MovieClip
   {
      
      public var t4:SimpleButton;
      
      public var t5:SimpleButton;
      
      public var t7:SimpleButton;
      
      public var t6:SimpleButton;
      
      public var t8:SimpleButton;
      
      public var t3:SimpleButton;
      
      public var len1:int;
      
      public var pp:MovieClip;
      
      public var t0:SimpleButton;
      
      public var t1:SimpleButton;
      
      public var t2:SimpleButton;
      
      public function Timeline_82()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function enterFrameHandler(param1:Event) : *
      {
         if(this.t0)
         {
            this.len1 = this.numChildren - 1;
            removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
            this.eve();
         }
      }
      
      public function overHandler1(param1:MouseEvent) : void
      {
         var _loc2_:SimpleButton = param1.currentTarget as SimpleButton;
         this.pp.setChildIndex(_loc2_,this.len1);
      }
      
      public function eve() : void
      {
         var _loc2_:SimpleButton = null;
         var _loc1_:int = 0;
         while(_loc1_ < 9)
         {
            trace(_loc1_);
            _loc2_ = this["t" + _loc1_] as SimpleButton;
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.overHandler1);
            _loc2_ = null;
            _loc1_++;
         }
      }
      
      internal function frame1() : *
      {
         this.pp = this;
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
   }
}

