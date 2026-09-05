package com.robot.module.app
{
   import com.robot.app.tasksRecord.TasksRecordConfig;
   import com.robot.core.display.tree.Btn;
   import com.robot.core.display.tree.ItemClickEvent;
   import com.robot.core.display.tree.TreeMenu;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.uic.UIScrollBar;
   import com.robot.module.app.taskRecord.PanelStar;
   import com.robot.module.app.taskRecord.PanelTask;
   import com.robot.module.app.taskRecord.ParseXMLToTree;
   import com.robot.module.app.taskRecord.menu.NodeData;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TasksRecordPanel extends Sprite implements IModule
   {
      
      private var _isShowScrollBar:Boolean;
      
      private var _upBtn:SimpleButton;
      
      private var _scrollBar:UIScrollBar;
      
      private var _dragMc:Sprite;
      
      private var _barMc:MovieClip;
      
      private var _mainPanel:TaskRecordPanelNew;
      
      private var _mainPanelContent:MovieClip;
      
      private var currentIndex:uint = 0;
      
      private var _downBtn:SimpleButton;
      
      private var _defualtLength:uint = 6;
      
      private var _scrollMc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _currentBarY:Number = 0;
      
      private var _treeMenu:TreeMenu;
      
      public function TasksRecordPanel()
      {
         super();
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var index:uint = uint(_scrollBar.index);
         if(currentIndex > index)
         {
            _treeMenu.y += (currentIndex - index) * Math.round(_treeMenu.height / _treeMenu.getItemCount());
            currentIndex = index;
         }
         else
         {
            if(index == 0)
            {
               _treeMenu.y = 70;
               currentIndex = 0;
               return;
            }
            _treeMenu.y -= (index - currentIndex) * Math.round(_treeMenu.height / _treeMenu.getItemCount());
            currentIndex = index;
         }
         trace(index);
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function addEvent() : void
      {
         _dragMc.addEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _treeMenu.addEventListener(ItemClickEvent.ITEMCLICK,onItemClickHandler);
         _treeMenu.addEventListener(Event.CHANGE,onTreeMenuChangeHandler);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removevent() : void
      {
         _dragMc.removeEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _treeMenu.removeEventListener(ItemClickEvent.ITEMCLICK,onItemClickHandler);
         _treeMenu.removeEventListener(Event.CHANGE,onTreeMenuChangeHandler);
      }
      
      private function cofigScrolBar() : void
      {
         if(_isShowScrollBar)
         {
            _scrollMc.visible = true;
            _barMc.visible = true;
            _scrollBar = new UIScrollBar(_barMc,_scrollMc["barBg"],_defualtLength,_upBtn,_downBtn);
            _scrollBar.wheelObject = this;
            _scrollBar.totalLength = _treeMenu.getItemCount();
            _scrollBar.wheelObject = _treeMenu;
            _scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
            _scrollBar.index = Math.round(_treeMenu.getClickBtnY() / Math.round(_treeMenu.height / _treeMenu.getItemCount())) - _defualtLength;
            if(_treeMenu.getClickBtnY() > (_treeMenu.getItemCount() - 6) * Math.round(_treeMenu.height / _treeMenu.getItemCount()))
            {
               _scrollBar.index = _treeMenu.getItemCount() - _defualtLength - 1;
            }
            if(_scrollBar.index <= 0)
            {
               _treeMenu.y = 70;
               currentIndex = 0;
            }
            trace("***\t" + _treeMenu.getClickBtnY() + "\ttree height\t" + _treeMenu.height + "\tscroll height\t" + _scrollBar.scrollHeight + "\t***\t" + _scrollBar.index);
            trace("over...._treeMenu.getItemCount()\t" + _treeMenu.getItemCount() + "\t" + _treeMenu.height / _treeMenu.getItemCount());
         }
         else
         {
            _scrollMc.visible = false;
            if(_scrollBar)
            {
               _scrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
               _scrollBar.destroy();
               _scrollBar = null;
            }
         }
      }
      
      private function onUp1Handler(e:MouseEvent) : void
      {
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUp1Handler);
         _mainPanel.stopDrag();
      }
      
      public function destroy() : void
      {
         hide();
         _mainPanel = null;
         _dragMc = null;
         _scrollMc = null;
         _upBtn = null;
         _downBtn = null;
         _barMc = null;
         _closeBtn = null;
         _mainPanelContent = null;
      }
      
      public function hide() : void
      {
         _isShowScrollBar = false;
         _treeMenu.finishTree();
         removevent();
         DisplayUtil.removeAllChild(_mainPanelContent);
         DisplayUtil.removeForParent(_mainPanel);
      }
      
      private function switchInfoPanel(btn:Btn) : void
      {
         var data:NodeData = null;
         var panel:MovieClip = null;
         var task:PanelTask = null;
         var star:PanelStar = null;
         data = btn.data as NodeData;
         DisplayUtil.removeAllChild(_mainPanelContent);
         switch(uint(data.itemtype))
         {
            case 1:
               panel = new Panel1();
               (panel["introtxt"] as TextField).htmlText = "    " + data.intro;
               break;
            case 2:
               panel = new panel2();
               (panel["introtxt"] as TextField).htmlText = "    " + data.intro;
               break;
            case 3:
               if(data.name == "赛尔号飞船")
               {
                  panel = new Panel_shipe();
                  (panel["introtxt"] as TextField).htmlText = "    " + data.intro;
               }
               else
               {
                  star = new PanelStar(data);
                  panel = star.initPanel();
               }
               break;
            case 4:
            case 5:
               task = new PanelTask(data,this);
               panel = task.initPanel();
         }
         _mainPanelContent.addChild(panel);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainPanel);
         DisplayUtil.align(_mainPanel,null,AlignType.MIDDLE_CENTER);
         createTree();
         cofigScrolBar();
         addEvent();
      }
      
      private function onItemClickHandler(e:ItemClickEvent) : void
      {
         switchInfoPanel(e.item);
      }
      
      private function onDownHandler(e:MouseEvent) : void
      {
         _mainPanel.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUp1Handler);
      }
      
      private function createTree() : void
      {
         var parseXML:ParseXMLToTree = new ParseXMLToTree(TasksRecordConfig.getXML());
         _treeMenu = new TreeMenu(parseXML.tree);
         _treeMenu.x = 36;
         _treeMenu.y = 70;
         _mainPanel.addChild(_treeMenu);
         var mask:Shape = new Shape();
         mask.graphics.beginFill(0);
         mask.graphics.drawRect(36,70,200,315);
         mask.graphics.endFill();
         _mainPanel.addChild(mask);
         _treeMenu.mask = mask;
      }
      
      public function setup() : void
      {
         _mainPanel = new TaskRecordPanelNew();
         _dragMc = _mainPanel["dragMC"];
         _dragMc.buttonMode = true;
         _scrollMc = _mainPanel["scrollMc"];
         _upBtn = _scrollMc["upBtn"];
         _downBtn = _scrollMc["downBtn"];
         _barMc = _scrollMc["barBall"];
         _closeBtn = _mainPanel["closeBtn"];
         _mainPanelContent = _mainPanel["content"];
      }
      
      private function onTreeMenuChangeHandler(e:Event) : void
      {
         if(_treeMenu.height > 320)
         {
            _isShowScrollBar = true;
         }
         else
         {
            _isShowScrollBar = false;
            if(_treeMenu)
            {
               _treeMenu.x = 36;
               _treeMenu.y = 70;
            }
         }
         cofigScrolBar();
      }
   }
}

