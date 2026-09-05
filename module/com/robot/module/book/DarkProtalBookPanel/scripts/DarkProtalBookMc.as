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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol585")]
   public dynamic class DarkProtalBookMc extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var total:uint;
      
      public var returnBtn:SimpleButton;
      
      public var btn0:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public var a:Array;
      
      public var prevBtn:SimpleButton;
      
      public var i1:int;
      
      public var nextBtn:SimpleButton;
      
      public function DarkProtalBookMc()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function onGoClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:uint = uint(_loc2_.slice(3,_loc2_.length));
         this.gotoAndStop(a[_loc3_]);
         prevBtn.visible = true;
         nextBtn.visible = true;
      }
      
      public function onReturnHandler(param1:MouseEvent) : void
      {
         prevBtn.visible = true;
         nextBtn.visible = true;
         this.gotoAndStop(2);
      }
      
      internal function frame1() : *
      {
         stop();
         total = this.totalFrames;
         returnBtn.addEventListener(MouseEvent.CLICK,onReturnHandler);
         prevBtn.visible = false;
         nextBtn.visible = true;
         prevBtn.addEventListener(MouseEvent.CLICK,onPrevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,onNextHandler);
      }
      
      internal function frame2() : *
      {
         a = [5,10,8,6];
         i1 = 0;
         while(i1 < a.length)
         {
            this["btn" + i1].addEventListener(MouseEvent.CLICK,onGoClickHandler);
            ++i1;
         }
      }
      
      public function onNextHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame < total)
         {
            this.gotoAndStop(this.currentFrame + 1);
            if(this.currentFrame == total)
            {
               prevBtn.visible = true;
               nextBtn.visible = false;
            }
            else
            {
               prevBtn.visible = true;
               nextBtn.visible = true;
            }
         }
      }
      
      public function onPrevHandler(param1:MouseEvent) : void
      {
         if(this.currentFrame > 1)
         {
            if(this.currentFrame == 2)
            {
               prevBtn.visible = false;
               nextBtn.visible = true;
            }
            else
            {
               prevBtn.visible = true;
               nextBtn.visible = true;
            }
            this.gotoAndStop(this.currentFrame - 1);
         }
      }
   }
}

