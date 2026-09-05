package com.robot.module.app.cutBmp.cutWithChat
{
   import com.adobe.images.JPGEncoder;
   import com.robot.app.imgPanel.ImagePanel;
   import com.robot.core.CommandID;
   import com.robot.core.info.GetImgAddrInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.app.CutBmp;
   import com.robot.module.app.cutBmp.IDrawAction;
   import com.robot.module.app.cutBmp.UploadBmp;
   import com.robot.module.app.cutBmp.cutWithChat.drawAction.ArrowDrawAction;
   import com.robot.module.app.cutBmp.cutWithChat.drawAction.CircularDrawAction;
   import com.robot.module.app.cutBmp.cutWithChat.drawAction.RectDrawAction;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.DisplayUtil;
   
   public class LineSprite extends Sprite
   {
      
      public static const CLOSE_CUTBMP_TOOL:String = "closeCutbmpTool";
      
      public static var picArray:Array = [];
      
      private var bg:Sprite;
      
      private var timer:Timer;
      
      private var dotArray:Array = [];
      
      private var drawAction:IDrawAction;
      
      private var toolBar:CutBmpToolBar;
      
      private var color:uint = 16711884;
      
      private var blackShpae:Shape;
      
      private var bgH:Number;
      
      private var txt:TextField;
      
      private var bgW:Number;
      
      private var tf:TextFormat;
      
      private var parentPanel:CutWithChatPanel;
      
      private var isDrag:Boolean = false;
      
      public function LineSprite(parentPanel:CutWithChatPanel)
      {
         var g:DragDot = null;
         super();
         this.parentPanel = parentPanel;
         bg = new Sprite();
         bg.graphics.lineStyle(1,color);
         bg.graphics.beginFill(16777215,0.2);
         addChild(bg);
         blackShpae = new Shape();
         blackShpae.graphics.beginFill(0);
         blackShpae.graphics.drawRect(0,0,1,1);
         tf = new TextFormat();
         tf.color = 16777215;
         tf.bold = true;
         tf.font = "Arial";
         txt = new TextField();
         txt.selectable = false;
         txt.autoSize = TextFieldAutoSize.LEFT;
         addChild(blackShpae);
         addChild(txt);
         for(var i:uint = 0; i < 8; i++)
         {
            g = new DragDot();
            g.name = "g_" + i;
            dotArray.push(g);
            addChild(g);
         }
         timer = new Timer(1000 / 40);
         timer.addEventListener(TimerEvent.TIMER,timerHandler);
         toolBar = new CutBmpToolBar();
         toolBar.addEventListener(CutBmpToolBar.CHANGE_TOOL,onChangeTool);
         SocketConnection.addCmdListener(CommandID.GET_IMAGE_ADDRES,onGetImgAddr);
      }
      
      public function destroy() : void
      {
         var i:DragDot = null;
         picArray = [];
         SocketConnection.removeCmdListener(CommandID.GET_IMAGE_ADDRES,onGetImgAddr);
         for each(i in dotArray)
         {
            i.destroy();
         }
         dotArray = [];
         bg.removeEventListener(MouseEvent.MOUSE_DOWN,bgDownHandler);
         bg.removeEventListener(MouseEvent.MOUSE_UP,bgUpHandler);
         bg = null;
         DisplayUtil.removeForParent(toolBar);
         toolBar.destroy();
         toolBar = null;
         if(drawAction)
         {
            drawAction.destroy();
         }
         drawAction = null;
      }
      
      private function bgDownHandler(event:MouseEvent) : void
      {
         this.startDrag();
      }
      
      public function drawRect(s:Point, e:Point) : void
      {
         bg.graphics.clear();
         bg.graphics.lineStyle(1,color);
         bg.graphics.beginFill(16777215,0.2);
         bgW = e.x - s.x;
         bgH = e.y - s.y;
         bg.graphics.drawRect(s.x,s.y,bgW,bgH);
         txt.text = uint(Math.abs(bgW)) + "×" + uint(Math.abs(bgH));
         txt.setTextFormat(tf);
         var rect:Rectangle = bg.getRect(this);
         txt.x = rect.x + 2;
         txt.y = rect.y - txt.height - 2;
         blackShpae.width = txt.width + 4;
         blackShpae.height = txt.height + 4;
         blackShpae.x = rect.x;
         blackShpae.y = rect.y - blackShpae.height - 2;
         toolBar.x = rect.x;
         toolBar.y = rect.y + Math.abs(bgH) + 5;
         checkDot();
      }
      
      private function timerHandler(event:TimerEvent) : void
      {
         checkDot();
         event.updateAfterEvent();
      }
      
      private function closeMouse() : void
      {
         var obj:DisplayObject = null;
         var num:uint = uint(this.numChildren);
         for(var i:uint = 0; i < num; i++)
         {
            obj = this.getChildAt(i);
            if(obj is InteractiveObject && obj != toolBar)
            {
               InteractiveObject(obj).mouseEnabled = false;
            }
            if(obj is DisplayObjectContainer && obj != toolBar)
            {
               DisplayObjectContainer(obj).mouseChildren = false;
            }
         }
      }
      
      private function onGetImgAddr(event:SocketEvent) : void
      {
         var data:GetImgAddrInfo = event.data as GetImgAddrInfo;
         var bmpData:BitmapData = new BitmapData(Math.abs(bgW),Math.abs(bgH));
         var rect:Rectangle = bg.getRect(MainManager.getStage());
         var matrix:Matrix = new Matrix();
         matrix.translate(-rect.x,-rect.y);
         bmpData.draw(CutBmp.bmpLevel,matrix);
         var jpgByteArray:ByteArray = new JPGEncoder().encode(bmpData);
         jpgByteArray.position = 0;
         ImagePanel.setup(data.ip,data.port);
         UploadBmp.upload(jpgByteArray,data);
      }
      
      private function checkDot(event:Event = null) : void
      {
         var s:DragDot = null;
         var i:uint = 0;
         for each(s in dotArray)
         {
            if(!s.isPress)
            {
               if(i == 0)
               {
                  s.x = parentPanel.startPoint.x;
                  s.y = parentPanel.startPoint.y;
               }
               else if(i == 1)
               {
                  s.x = parentPanel.startPoint.x + bgW / 2;
                  s.y = parentPanel.startPoint.y;
               }
               else if(i == 2)
               {
                  s.x = parentPanel.startPoint.x + bgW;
                  s.y = parentPanel.startPoint.y;
               }
               else if(i == 3)
               {
                  s.x = parentPanel.startPoint.x + bgW;
                  s.y = parentPanel.startPoint.y + bgH / 2;
               }
               else if(i == 4)
               {
                  s.x = parentPanel.startPoint.x + bgW;
                  s.y = parentPanel.startPoint.y + bgH;
               }
               else if(i == 5)
               {
                  s.x = parentPanel.startPoint.x + bgW / 2;
                  s.y = parentPanel.startPoint.y + bgH;
               }
               else if(i == 6)
               {
                  s.x = parentPanel.startPoint.x;
                  s.y = parentPanel.startPoint.y + bgH;
               }
               else if(i == 7)
               {
                  s.x = parentPanel.startPoint.x;
                  s.y = parentPanel.startPoint.y + bgH / 2;
               }
            }
            i++;
         }
      }
      
      public function addEvent() : void
      {
         bg.addEventListener(MouseEvent.MOUSE_DOWN,bgDownHandler);
         bg.addEventListener(MouseEvent.MOUSE_UP,bgUpHandler);
         var rect:Rectangle = bg.getRect(this);
         toolBar.x = rect.x;
         toolBar.y = rect.height + 5;
         addChild(toolBar);
         checkDot();
         DotDragManager.init(parentPanel,dotArray);
      }
      
      private function onChangeTool(event:DynamicEvent) : void
      {
         var obj:DisplayObject = null;
         var mc:MovieClip = event.paramObject as MovieClip;
         if(mc == toolBar.applyBtn)
         {
            toolBar.mouseEnabled = false;
            toolBar.mouseChildren = false;
            SocketConnection.send(CommandID.GET_IMAGE_ADDRES);
         }
         else if(mc == toolBar.closeBtn)
         {
            EventManager.dispatchEvent(new Event(CLOSE_CUTBMP_TOOL));
         }
         else if(mc == toolBar.undoBtn)
         {
            if(picArray.length > 0)
            {
               obj = picArray.shift() as DisplayObject;
               DisplayUtil.removeForParent(obj);
            }
         }
         else
         {
            closeMouse();
            if(drawAction)
            {
               drawAction.destroy();
            }
            if(mc == toolBar.rectBtn)
            {
               drawAction = new RectDrawAction(bg);
            }
            else if(mc == toolBar.circularBtn)
            {
               drawAction = new CircularDrawAction(bg);
            }
            else if(mc == toolBar.arrowBtn)
            {
               drawAction = new ArrowDrawAction(bg);
            }
         }
      }
      
      private function bgUpHandler(event:MouseEvent) : void
      {
         this.stopDrag();
      }
   }
}

