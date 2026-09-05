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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class mainPanel extends MovieClip
   {
      
      public var nextBtn:SimpleButton;
      
      public var cls:*;
      
      public var backBtn:SimpleButton;
      
      public var starBtn:MovieClip;
      
      public var exitBtn:SimpleButton;
      
      public function mainPanel()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function clickHandler(param1:*) : void
      {
         this.cls = getDefinitionByName("com.robot.core.manager.MapManager");
         this.cls.changeMap(325);
      }
      
      public function backHandler(param1:*) : *
      {
         prevFrame();
      }
      
      internal function frame1() : *
      {
         stop();
         this.backBtn.addEventListener(MouseEvent.CLICK,this.backHandler);
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.nextHandler);
         setTimeout(this.fun,200);
         this.starBtn.visible = false;
      }
      
      public function nextHandler(param1:*) : *
      {
         nextFrame();
      }
      
      public function fun() : *
      {
         this.starBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
      }
   }
}

