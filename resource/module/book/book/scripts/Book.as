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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol633")]
   public dynamic class Book extends MovieClip
   {
      
      public var btnName:String;
      
      public var btn_1:SimpleButton;
      
      public var btn_2:SimpleButton;
      
      public var btn_3:SimpleButton;
      
      public var btn_4:SimpleButton;
      
      public var btn_5:SimpleButton;
      
      public var btn_6:SimpleButton;
      
      public var btn_7:SimpleButton;
      
      public var btn_8:SimpleButton;
      
      public var btn_9:SimpleButton;
      
      public var fowardBtn:SimpleButton;
      
      public var exitBtn:SimpleButton;
      
      public var btn_11:SimpleButton;
      
      public var btn_10:SimpleButton;
      
      public var btn_12:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var btn:SimpleButton;
      
      public var i:uint;
      
      public var firstPageBtn:SimpleButton;
      
      public function Book()
      {
         super();
         addFrameScript(0,frame1,1,frame2,12,frame13,13,frame14);
      }
      
      public function onFirstPage(param1:*) : void
      {
         this.gotoAndStop(1);
      }
      
      public function onFoward(param1:*) : void
      {
         this.prevFrame();
      }
      
      public function onExit(param1:*) : void
      {
         this.parent.removeChild(this);
      }
      
      internal function frame14() : *
      {
         nextBtn.visible = false;
      }
      
      internal function frame13() : *
      {
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
      
      public function onNext(param1:*) : void
      {
         this.nextFrame();
      }
      
      internal function frame1() : *
      {
         stop();
         firstPageBtn.addEventListener(MouseEvent.CLICK,onFirstPage);
         fowardBtn.addEventListener(MouseEvent.CLICK,onFoward);
         nextBtn.addEventListener(MouseEvent.CLICK,onNext);
         exitBtn.addEventListener(MouseEvent.CLICK,onExit);
         fowardBtn.visible = false;
      }
      
      public function onMosClick(param1:*) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:uint = uint(_loc2_.split("_")[1]);
         this.gotoAndStop(_loc3_ + 2);
      }
      
      internal function frame2() : *
      {
         i = 1;
         while(i < 13)
         {
            btnName = "btn_" + i;
            btn = this.getChildByName(btnName) as SimpleButton;
            if(btn)
            {
               btn.addEventListener(MouseEvent.CLICK,onMosClick);
            }
            ++i;
         }
         fowardBtn.visible = true;
         nextBtn.visible = true;
      }
   }
}

