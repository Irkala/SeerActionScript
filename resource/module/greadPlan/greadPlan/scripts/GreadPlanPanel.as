package
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol242")]
   public dynamic class GreadPlanPanel extends MovieClip
   {
      
      public var mySound:Sound;
      
      public var movie_mc:MovieClip;
      
      public var play_btn:SimpleButton;
      
      public var soundc:SoundChannel;
      
      public var close_btn:SimpleButton;
      
      public var btn_mc:MovieClip;
      
      public var light_mc:MovieClip;
      
      public function GreadPlanPanel()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,4,this.frame5,5,this.frame6);
      }
      
      public function closeHandler(param1:MouseEvent) : void
      {
         if(this.soundc)
         {
            this.soundc.stop();
            this.mySound = null;
            this.soundc = null;
         }
         this.btn_mc.prev_btn.removeEventListener(MouseEvent.CLICK,this.prevClickHandler);
         this.btn_mc.next_btn.removeEventListener(MouseEvent.CLICK,this.nextClickHandler);
         this.parent.removeChild(this);
      }
      
      public function prevClickHandler(param1:MouseEvent) : void
      {
         this.prevFrame();
      }
      
      public function playOverHandler(param1:Event) : void
      {
         this.play_btn.visible = true;
         this.light_mc.visible = true;
         this.btn_mc.visible = true;
      }
      
      internal function frame1() : *
      {
         stop();
         this.btn_mc.prev_btn.addEventListener(MouseEvent.CLICK,this.prevClickHandler);
         this.btn_mc.next_btn.addEventListener(MouseEvent.CLICK,this.nextClickHandler);
         this.btn_mc.prev_btn.buttonMode = false;
         this.btn_mc.next_btn.buttonMode = true;
         this.close_btn.addEventListener(MouseEvent.CLICK,this.closeHandler);
      }
      
      internal function frame5() : *
      {
         this.btn_mc.next_btn.buttonMode = true;
      }
      
      internal function frame6() : *
      {
         this.play_btn.addEventListener(MouseEvent.CLICK,this.playClickHandler);
         this.movie_mc.addEventListener("playover",this.playOverHandler);
         this.btn_mc.next_btn.buttonMode = false;
      }
      
      public function playClickHandler(param1:MouseEvent) : void
      {
         this.play_btn.visible = false;
         this.light_mc.visible = false;
         this.btn_mc.visible = false;
         this.movie_mc.gotoAndPlay(2);
         this.mySound = new SoundPlay();
         this.soundc = this.mySound.play();
      }
      
      public function nextClickHandler(param1:MouseEvent) : void
      {
         this.nextFrame();
      }
      
      internal function frame2() : *
      {
         this.btn_mc.prev_btn.buttonMode = true;
      }
   }
}

