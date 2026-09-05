package com.robot.module.app.cutBmp.cutWithChat
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.ToolTipManager;
   
   public class CutBmpToolBar extends Sprite
   {
      
      public static const CHANGE_TOOL:String = "changeTool";
      
      private var _arrowBtn:MovieClip;
      
      private var _ui:MovieClip;
      
      private var _rectBtn:MovieClip;
      
      private var _undoBtn:MovieClip;
      
      private var _closeBtn:MovieClip;
      
      private var _applyBtn:MovieClip;
      
      private var mcArray:Array = [];
      
      private var _circularBtn:MovieClip;
      
      public function CutBmpToolBar()
      {
         super();
         _ui = new ui_cutBmpTool();
         addChild(_ui);
         _rectBtn = _ui["rectBtn"];
         _circularBtn = _ui["circularBtn"];
         _arrowBtn = _ui["arrowBtn"];
         _undoBtn = _ui["undoBtn"];
         _closeBtn = _ui["closeBtn"];
         _applyBtn = _ui["applyBtn"];
         mcArray.push(_rectBtn,_circularBtn,_arrowBtn,_undoBtn,_closeBtn,_applyBtn);
         initEvent();
      }
      
      public function get closeBtn() : MovieClip
      {
         return _closeBtn;
      }
      
      private function resetOther() : void
      {
         var i:MovieClip = null;
         for each(i in mcArray)
         {
            i.gotoAndStop(1);
         }
      }
      
      public function get applyBtn() : MovieClip
      {
         return _applyBtn;
      }
      
      public function get arrowBtn() : MovieClip
      {
         return _arrowBtn;
      }
      
      public function get rectBtn() : MovieClip
      {
         return _rectBtn;
      }
      
      public function get undoBtn() : MovieClip
      {
         return _undoBtn;
      }
      
      private function initEvent() : void
      {
         var i:MovieClip = null;
         ToolTipManager.add(rectBtn,"添加矩形");
         ToolTipManager.add(circularBtn,"添加椭圆");
         ToolTipManager.add(arrowBtn,"添加箭头");
         ToolTipManager.add(undoBtn,"撤消");
         ToolTipManager.add(closeBtn,"关闭");
         ToolTipManager.add(applyBtn,"确定");
         for each(i in mcArray)
         {
            i.addEventListener(MouseEvent.CLICK,clickToolHandler);
         }
      }
      
      private function clickToolHandler(event:MouseEvent) : void
      {
         resetOther();
         var mc:MovieClip = event.currentTarget as MovieClip;
         if(mc != _undoBtn)
         {
            mc.gotoAndStop(2);
         }
         dispatchEvent(new DynamicEvent(CHANGE_TOOL,mc));
      }
      
      public function destroy() : void
      {
         var i:MovieClip = null;
         for each(i in mcArray)
         {
            ToolTipManager.remove(i);
            i.removeEventListener(MouseEvent.CLICK,clickToolHandler);
         }
         mcArray = [];
      }
      
      public function get circularBtn() : MovieClip
      {
         return _circularBtn;
      }
   }
}

