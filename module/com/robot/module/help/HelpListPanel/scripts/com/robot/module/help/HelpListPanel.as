package com.robot.module.help
{
   import com.robot.app.help.HelpManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class HelpListPanel extends Sprite implements IModule
   {
      
      private var back_btn:SimpleButton;
      
      private var barMc:MovieClip;
      
      private var mainUI:MovieClip;
      
      private var close_btn:SimpleButton;
      
      private var upY:int;
      
      private var com_txt:TextField;
      
      private var up_mc:SimpleButton;
      
      private var bar_mc:MovieClip;
      
      private var mask_mc:MovieClip;
      
      private var down_mc:SimpleButton;
      
      private var btnWid:int;
      
      private var btn_mc:MovieClip;
      
      private var nbmy:Number;
      
      private var btnArr:Array;
      
      private var isDown:Boolean;
      
      private var rectang:Rectangle;
      
      private var he:int;
      
      public function HelpListPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         mainUI = null;
         close_btn = null;
         btn_mc = null;
         com_txt = null;
         btnArr = null;
         barMc = null;
         bar_mc = null;
         up_mc = null;
         down_mc = null;
         HelpManager.nullPanel();
      }
      
      private function clickUpHandler(e:MouseEvent) : void
      {
         if(bar_mc.y - 10 > upY)
         {
            bar_mc.y -= 10;
         }
         else
         {
            bar_mc.y = upY;
         }
         moveIt();
      }
      
      private function mouseUpHandler(e:MouseEvent) : void
      {
         if(isDown)
         {
            bar_mc.stopDrag();
            isDown = false;
         }
      }
      
      public function setup() : void
      {
         mainUI = new HelpUI_Panel();
         close_btn = mainUI["close_btn"];
         com_txt = mainUI["com_txt"];
         btn_mc = mainUI["btn_mc"];
         back_btn = mainUI["back_btn"];
         mask_mc = mainUI["mask_mc"];
         barMc = mainUI["barMc"];
         up_mc = barMc["up_mc"];
         down_mc = barMc["down_mc"];
         bar_mc = barMc["bar_mc"];
         btn_mc.mask = mask_mc;
         nbmy = btn_mc.y;
         close_btn.addEventListener(MouseEvent.CLICK,clickHandler);
         back_btn.addEventListener(MouseEvent.CLICK,clickBackHandler);
      }
      
      private function stopDragHandler(e:MouseEvent) : void
      {
         isDown = false;
         bar_mc.stopDrag();
      }
      
      public function init(data:Object = null) : void
      {
         var len:uint = 0;
         var temp:MovieClip = null;
         var tempM:MovieClip = null;
         var str:String = data.str;
         var arr:Array = data.arr;
         btnArr = arr;
         var isBack:Boolean = Boolean(data.isBack);
         com_txt.htmlText = "    " + str;
         if(isBack)
         {
            len = arr.length - 1;
            back_btn.visible = true;
         }
         else
         {
            back_btn.visible = false;
            len = arr.length;
         }
         var widint:int = 120;
         for(var i:int = 0; i < len; i++)
         {
            temp = new HelpUI_Panel_btn();
            temp["btn_txt"].autoSize = TextFieldAutoSize.LEFT;
            temp["btn_txt"].htmlText = arr[i][0];
            temp["btn_txt"].mouseEnabled = false;
            if(temp["btn_txt"].width > widint)
            {
               widint = int(temp["btn_txt"].width);
            }
            temp.addEventListener(MouseEvent.CLICK,btnHandler);
            temp.name = "btn" + i;
            temp.y = i * (temp.height + 10);
            btn_mc.addChild(temp);
         }
         for(var j:int = 0; j < btn_mc.numChildren; j++)
         {
            tempM = btn_mc.getChildAt(j) as MovieClip;
            tempM["btn"].width = widint + 10;
            tempM.x = (mask_mc.width - tempM.width) / 2 - 10;
            tempM["btn_txt"].x = int((tempM["btn"].width - tempM["btn_txt"].width) / 2) + 2;
         }
         if(len > 5)
         {
            canMoveBtn();
         }
         else
         {
            barMc.visible = false;
         }
      }
      
      private function clickDownHandler(e:MouseEvent) : void
      {
         if(bar_mc.y + 10 < upY + he)
         {
            bar_mc.y += 10;
         }
         else
         {
            bar_mc.y = upY + he;
         }
         moveIt();
      }
      
      private function mouseMoveHander(e:MouseEvent) : void
      {
         if(isDown)
         {
            moveIt();
         }
      }
      
      private function clickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function reSetMes(id:uint) : void
      {
         var type:uint = uint(HelpManager.getType(id));
         var obj:Object = HelpManager.getObj(id);
         if(type == 0)
         {
            removeBtn();
            init(obj);
         }
         else
         {
            HelpManager.show(id);
            destroy();
         }
      }
      
      private function startDragHandler(e:MouseEvent) : void
      {
         isDown = true;
         bar_mc.startDrag(false,rectang);
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      private function removeBtn() : void
      {
         var temp:MovieClip = null;
         while(btn_mc.numChildren > 0)
         {
            temp = btn_mc.getChildAt(0) as MovieClip;
            temp.removeEventListener(MouseEvent.CLICK,btnHandler);
            btn_mc.removeChild(temp);
            temp = null;
         }
         btn_mc.y = nbmy;
         bar_mc.removeEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
         bar_mc.removeEventListener(MouseEvent.MOUSE_UP,stopDragHandler);
         bar_mc.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHander);
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
         up_mc.removeEventListener(MouseEvent.CLICK,clickUpHandler);
         down_mc.removeEventListener(MouseEvent.CLICK,clickDownHandler);
      }
      
      private function clickBackHandler(e:MouseEvent) : void
      {
         var id:uint = uint(btnArr[btnArr.length - 1][1]);
         reSetMes(id);
      }
      
      private function btnHandler(e:MouseEvent) : void
      {
         var str:String = e.currentTarget.name;
         var btnInt:uint = uint(str.slice(3,str.length));
         var id:uint = uint(btnArr[btnInt][1]);
         reSetMes(id);
      }
      
      public function hide() : void
      {
         if(btn_mc)
         {
            removeBtn();
         }
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function canMoveBtn() : void
      {
         btnWid = int(btn_mc.height - mask_mc.height + 20);
         barMc.visible = true;
         bar_mc.buttonMode = true;
         upY = int(up_mc.height);
         he = int(down_mc.y - upY - bar_mc.height) + 2;
         var mx:int = int(up_mc.x);
         rectang = new Rectangle(0,upY,0,he);
         bar_mc.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
         bar_mc.addEventListener(MouseEvent.MOUSE_UP,stopDragHandler);
         bar_mc.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHander);
         MainManager.getStage().addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
         up_mc.addEventListener(MouseEvent.CLICK,clickUpHandler);
         down_mc.addEventListener(MouseEvent.CLICK,clickDownHandler);
      }
      
      private function moveIt() : void
      {
         btn_mc.y = -int(bar_mc.y - upY) / he * btnWid + nbmy;
      }
   }
}

