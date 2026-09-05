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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol79")]
   public dynamic class TaskPanelUI0_73 extends MovieClip
   {
      
      public var close_btn:SimpleButton;
      
      public var isOver:Boolean;
      
      public var _shape:Shape;
      
      public var _time:Timer;
      
      public var color_uint:String;
      
      public var ren_mc:MovieClip;
      
      public var bar_mc:MovieClip;
      
      public var name_txt:TextField;
      
      public var color_1:SimpleButton;
      
      public var color_2:SimpleButton;
      
      public var color_0:SimpleButton;
      
      public var isDownB:Boolean;
      
      public var clear_btn:SimpleButton;
      
      public var quit_btn:SimpleButton;
      
      public var ok_btn:SimpleButton;
      
      public var start_btn:SimpleButton;
      
      public function TaskPanelUI0_73()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7);
      }
      
      public function click0Handler(param1:MouseEvent) : void
      {
         color_uint = "0xF5B82C";
      }
      
      public function showBox() : *
      {
         var cls:*;
         var clickOKHandler:Function = null;
         var clickQutiHandler:Function = null;
         clickOKHandler = function(param1:MouseEvent):void
         {
            gotoAndStop(4);
         };
         clickQutiHandler = function(param1:MouseEvent):void
         {
            gotoAndStop(1);
         };
         ok_btn.addEventListener(MouseEvent.CLICK,clickOKHandler);
         quit_btn.addEventListener(MouseEvent.CLICK,clickQutiHandler);
         cls = getDefinitionByName("com.robot.core.manager.MainManager");
         name_txt.text = cls.actorInfo.nick;
      }
      
      public function timeCompHandler(param1:TimerEvent) : void
      {
         isOver = true;
      }
      
      public function upHandler(param1:MouseEvent) : void
      {
         isDownB = false;
      }
      
      public function clickStartHandler(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      public function moveHandler(param1:MouseEvent) : void
      {
         if(isDownB)
         {
            if(this.mouseX > 107 && this.mouseX < 325 && this.mouseY > 66 && this.mouseY < 285)
            {
               _shape.graphics.lineTo(this.mouseX,this.mouseY);
            }
         }
      }
      
      public function click2Handler(param1:MouseEvent) : void
      {
         color_uint = "0x7A82B8";
      }
      
      public function downHandler(param1:MouseEvent) : void
      {
         if(color_uint == null)
         {
            return;
         }
         _shape.graphics.moveTo(this.mouseX,this.mouseY);
         _shape.graphics.lineStyle(1,uint(color_uint),1);
         isDownB = true;
      }
      
      public function click1Handler(param1:MouseEvent) : void
      {
         color_uint = "0xA3A5A9";
      }
      
      public function showBox1() : *
      {
         var clickOKHandler:Function = null;
         var clickQutiHandler:Function = null;
         clickOKHandler = function(param1:MouseEvent):void
         {
            gotoAndStop(5);
         };
         clickQutiHandler = function(param1:MouseEvent):void
         {
            gotoAndStop(3);
         };
         ok_btn.addEventListener(MouseEvent.CLICK,clickOKHandler);
         quit_btn.addEventListener(MouseEvent.CLICK,clickQutiHandler);
      }
      
      public function showBox2() : void
      {
         var clickOkHandler:Function = null;
         clickOkHandler = function(param1:MouseEvent):void
         {
            clickClearHandler();
            _time.removeEventListener(TimerEvent.TIMER_COMPLETE,timeCompHandler);
            _time.stop();
            _time = null;
            if(isOver)
            {
               gotoAndStop(7);
            }
            else
            {
               gotoAndStop(6);
            }
         };
         color_0.addEventListener(MouseEvent.CLICK,click0Handler);
         color_1.addEventListener(MouseEvent.CLICK,click1Handler);
         color_2.addEventListener(MouseEvent.CLICK,click2Handler);
         MovieClip(this).addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
         MovieClip(this).addEventListener(MouseEvent.MOUSE_UP,upHandler);
         MovieClip(this).addEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
         clear_btn.addEventListener(MouseEvent.CLICK,clickClearHandler);
         _time = new Timer(10,1000);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,timeCompHandler);
         ok_btn.addEventListener(MouseEvent.CLICK,clickOkHandler);
      }
      
      internal function frame2() : *
      {
         stop();
         ren_mc.gotoAndStop(1);
      }
      
      internal function frame3() : *
      {
         stop();
         ren_mc.gotoAndStop(1);
         showBox();
      }
      
      internal function frame4() : *
      {
         stop();
         showBox1();
         ren_mc.gotoAndStop(1);
      }
      
      internal function frame5() : *
      {
         stop();
         ren_mc.gotoAndStop(4);
         showBox2();
         color_uint = "";
         isOver = false;
         color_0.visible = true;
         color_1.visible = true;
         color_2.visible = true;
         _shape = new Shape();
         addChild(_shape);
         isDownB = false;
      }
      
      internal function frame6() : *
      {
         stop();
         ren_mc.gotoAndStop(6);
         showBox3();
         color_uint = "";
         color_0.visible = false;
         color_1.visible = false;
         color_2.visible = false;
         MovieClip(this).removeEventListener(MouseEvent.MOUSE_DOWN,downHandler);
         MovieClip(this).removeEventListener(MouseEvent.MOUSE_UP,upHandler);
         MovieClip(this).removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
      }
      
      internal function frame1() : *
      {
         stop();
         stop();
         ren_mc.gotoAndStop(1);
         start_btn.addEventListener(MouseEvent.CLICK,clickStartHandler);
      }
      
      public function clickClearHandler(param1:MouseEvent = null) : void
      {
         _shape.graphics.clear();
      }
      
      public function showBox5() : void
      {
         var clickOkHandler:Function = null;
         clickOkHandler = function(param1:MouseEvent):void
         {
            dispatchEvent(new Event("taskover"));
         };
         ok_btn.addEventListener(MouseEvent.CLICK,clickOkHandler);
      }
      
      internal function frame7() : *
      {
         stop();
         ren_mc.gotoAndStop(10);
         showBox5();
      }
      
      public function showBox3() : void
      {
         var clickOkHandler:Function = null;
         clickOkHandler = function(param1:MouseEvent):void
         {
            ok_btn.removeEventListener(MouseEvent.CLICK,clickOkHandler);
            prevFrame();
         };
         ok_btn.addEventListener(MouseEvent.CLICK,clickOkHandler);
      }
   }
}

