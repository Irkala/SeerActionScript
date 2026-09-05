package com.robot.module.app.cutBmp.cutWithChat
{
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import org.taomee.utils.DisplayUtil;
   
   public class DotDragManager
   {
      
      private static var panel:CutWithChatPanel;
      
      private static var currentDot:DragDot;
      
      private static var mouseMC:MovieClip;
      
      private static var isDown:Boolean = false;
      
      private static var array:Array = [];
      
      public function DotDragManager()
      {
         super();
      }
      
      private static function downHandler(event:MouseEvent) : void
      {
         panel.addEventListener(Event.ENTER_FRAME,enterFrameHandler);
         currentDot = event.currentTarget as DragDot;
         var num:uint = uint(currentDot.name.substr(2,1));
         if(num == 1 || num == 5)
         {
            currentDot.dragRect = new Rectangle(currentDot.x,-1000,0,2000);
         }
         else if(num == 3 || num == 7)
         {
            currentDot.dragRect = new Rectangle(-1000,currentDot.y,2000,0);
         }
         currentDot.isPress = true;
         if(currentDot.dragRect)
         {
            currentDot.startDrag(false,currentDot.dragRect);
         }
         else
         {
            currentDot.startDrag();
         }
      }
      
      private static function stageUp(event:MouseEvent) : void
      {
         if(currentDot)
         {
            currentDot.isPress = false;
            currentDot.stopDrag();
            DisplayUtil.removeForParent(mouseMC);
            Mouse.show();
         }
      }
      
      private static function enterFrameHandler(event:Event) : void
      {
         var p:Point = null;
         var num:uint = uint(currentDot.name.substr(2,1));
         switch(num)
         {
            case 0:
               panel.startPoint = new Point(currentDot.x,currentDot.y);
               panel.showRect();
               break;
            case 1:
               p = panel.startPoint;
               panel.startPoint = new Point(p.x,currentDot.y);
               panel.showRect();
               break;
            case 2:
               p = panel.startPoint;
               panel.startPoint = new Point(p.x,currentDot.y);
               p = panel.endPoint;
               panel.endPoint = new Point(currentDot.x,p.y);
               break;
            case 3:
               p = panel.endPoint;
               panel.endPoint = new Point(currentDot.x,p.y);
               break;
            case 4:
               panel.endPoint = new Point(currentDot.x,currentDot.y);
               break;
            case 5:
               p = panel.endPoint;
               panel.endPoint = new Point(p.x,currentDot.y);
               break;
            case 6:
               p = panel.startPoint;
               panel.startPoint = new Point(currentDot.x,p.y);
               p = panel.endPoint;
               panel.endPoint = new Point(p.x,currentDot.y);
               break;
            case 7:
               p = panel.startPoint;
               panel.startPoint = new Point(currentDot.x,p.y);
               panel.showRect();
         }
      }
      
      public static function init(s:CutWithChatPanel, dotArray:Array) : void
      {
         var i:DragDot = null;
         if(!mouseMC)
         {
            mouseMC = new ui_cutMapMouseMC();
         }
         mouseMC.mouseEnabled = false;
         mouseMC.mouseChildren = false;
         array = dotArray;
         panel = s;
         var count:uint = 0;
         for each(i in array)
         {
            if(count == 0 || count == 4)
            {
               i.dotRotation = 0;
            }
            else if(count == 2 || count == 6)
            {
               i.dotRotation = 90;
            }
            else if(count == 1 || count == 5)
            {
               i.dotRotation = 45;
            }
            else if(count == 3 || count == 7)
            {
               i.dotRotation = -45;
            }
            i.addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
            i.addEventListener(MouseEvent.MOUSE_UP,upHandler);
            i.addEventListener(MouseEvent.ROLL_OVER,overHandler);
            i.addEventListener(MouseEvent.ROLL_OUT,outHandler);
            count++;
         }
         MainManager.getStage().addEventListener(MouseEvent.MOUSE_UP,stageUp);
      }
      
      public static function destroy() : void
      {
         var i:DragDot = null;
         DisplayUtil.removeForParent(mouseMC);
         mouseMC = null;
         for each(i in array)
         {
            i.removeEventListener(MouseEvent.MOUSE_DOWN,downHandler);
            i.removeEventListener(MouseEvent.MOUSE_UP,upHandler);
            i.removeEventListener(MouseEvent.ROLL_OVER,overHandler);
            i.removeEventListener(MouseEvent.ROLL_OUT,outHandler);
         }
         array = [];
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_UP,stageUp);
         panel.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         panel = null;
         currentDot = null;
      }
      
      private static function outHandler(event:MouseEvent) : void
      {
         if(!currentDot.isPress)
         {
            DisplayUtil.removeForParent(mouseMC);
            Mouse.show();
         }
      }
      
      private static function overHandler(event:MouseEvent) : void
      {
         currentDot = event.currentTarget as DragDot;
         mouseMC.rotation = currentDot.dotRotation;
         currentDot.addChild(mouseMC);
         Mouse.hide();
      }
      
      private static function upHandler(event:MouseEvent) : void
      {
         currentDot.isPress = false;
         panel.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         currentDot = event.currentTarget as DragDot;
         currentDot.stopDrag();
         DisplayUtil.removeForParent(mouseMC);
      }
   }
}

