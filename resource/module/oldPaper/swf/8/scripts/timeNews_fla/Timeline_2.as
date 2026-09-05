package timeNews_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol164")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var nextBtn:SimpleButton;
      
      public var boxBtn:SimpleButton;
      
      public var fowardBtn:SimpleButton;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,6,this.frame7,7,this.frame8);
      }
      
      internal function frame1() : *
      {
         stop();
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.goNext);
         this.fowardBtn.addEventListener(MouseEvent.CLICK,this.goFoward);
         this.nextBtn.visible = true;
         this.fowardBtn.visible = false;
      }
      
      internal function frame2() : *
      {
         this.nextBtn.visible = true;
         this.fowardBtn.visible = true;
      }
      
      internal function frame7() : *
      {
         this.nextBtn.visible = true;
         this.fowardBtn.visible = true;
         this.boxBtn.addEventListener(MouseEvent.CLICK,this.showBox);
      }
      
      internal function frame8() : *
      {
         this.nextBtn.visible = false;
         this.fowardBtn.visible = true;
      }
      
      public function goFoward(param1:*) : *
      {
         if(currentFrame > 1)
         {
            prevFrame();
         }
      }
      
      public function showBox(param1:*) : *
      {
         var _loc2_:* = getDefinitionByName("com.robot.app.newspaper.AlertNews");
         _loc2_.show();
      }
      
      public function goNext(param1:*) : *
      {
         if(currentFrame < totalFrames)
         {
            nextFrame();
         }
      }
   }
}

