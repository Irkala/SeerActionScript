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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol52")]
   public dynamic class TaskPanelUI0_79 extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var txt_mc:MovieClip;
      
      public var tx:Number;
      
      public var zb_mc:MovieClip;
      
      public var tmc:MovieClip;
      
      public var biliX:Number;
      
      public var biliY:Number;
      
      public var close_btn:SimpleButton;
      
      public var ty:Number;
      
      public var light_mc:MovieClip;
      
      public var tu_mc:MovieClip;
      
      public var start_btn:SimpleButton;
      
      public function TaskPanelUI0_79()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function showZb() : void
      {
         closeBtn.visible = true;
         tu_mc.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         tu_mc.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
      }
      
      public function mouseOutHandler(param1:MouseEvent) : void
      {
         tmc.visible = false;
      }
      
      internal function frame1() : *
      {
         light_mc.visible = false;
         light_mc.light_mc.gotoAndStop(1);
         txt_mc.visible = false;
         zb_mc.visible = false;
         tmc.visible = false;
         closeBtn.visible = false;
         start_btn.addEventListener(MouseEvent.CLICK,clickStartHandler);
         biliX = 960 / tu_mc.width;
         biliY = 560 / tu_mc.height;
         tx = tu_mc.x;
         ty = tu_mc.y;
      }
      
      public function mouseMoveHandler(param1:MouseEvent) : void
      {
         tmc.visible = true;
         tmc.txt.text = String(int((this.mouseX - tx) * biliX)) + ":" + String(int((this.mouseY - ty) * biliY));
         tmc.x = this.mouseX + 5;
         tmc.y = this.mouseY - 20;
      }
      
      public function clickStartHandler(param1:MouseEvent) : void
      {
         start_btn.mouseEnabled = false;
         start_btn.enabled = false;
         light_mc.visible = true;
         light_mc.light_mc.gotoAndPlay(2);
         txt_mc.visible = true;
         light_mc.light_mc.addFrameScript(light_mc.light_mc.totalFrames - 1,endLight);
      }
      
      public function endLight() : void
      {
         light_mc.light_mc.gotoAndStop(light_mc.light_mc.totalFrames - 1);
         light_mc.light_mc.addFrameScript(light_mc.light_mc.totalFrames - 1,null);
         light_mc.visible = false;
         txt_mc.visible = false;
         zb_mc.visible = true;
         showZb();
      }
   }
}

