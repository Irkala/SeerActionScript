package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_68 extends Sprite implements IModule
   {
      
      private var _sp:Sprite;
      
      private var _panel:TaskPanel68_MC;
      
      private var _dragMc:Sprite;
      
      private var _iconMc:Sprite;
      
      private var _tipsA:Array = ["快去资料室看看可能会有什么蛛丝马迹！","咦？这个不是我们的档案光盘嘛！","快看！屏幕上是什么？","他正在瞭望舱等候海盗们的接应","快去瞭望舱追击这个家伙！","我正在船长室"];
      
      private var _desA:Array = [TextFormatUtil.getRedTxt("资料室") + "内部设施遭到了严重破坏，快去现场调查一下，可能会有一些蛛丝马迹！",TextFormatUtil.getRedTxt("资料室") + "内部设施遭到了严重破坏，快去现场调查一下，可能会有一些蛛丝马迹！",TextFormatUtil.getRedTxt("资料室") + "内部设施遭到了严重破坏，快去现场调查一下，可能会有一些蛛丝马迹！","快去" + TextFormatUtil.getRedTxt("瞭望舱") + "追击那个可恶的宇宙海盗，精灵学者安危、重要的精灵档案！这一切可都要靠你了！","一切的一切原来只是个谎言！迪恩手上有我们赛尔号的重要信息！我们一定不能让他走！向迪恩开战吧！","迪恩惊人的攻击力，黑暗螳螂的出现……这一切事情来的太突然了！先去船长室禀报船长吧！"];
      
      private var _len:uint;
      
      private var _statusA:Array;
      
      private var _closeBtn:SimpleButton;
      
      private var _classA:Array = [Task68Pro_0,Task68Pro_1,Task68Pro_2,Task68Pro_3,Task68Pro_4,Task68Pro_5];
      
      private var _scaN:Number = 1;
      
      public function TaskPanel_68()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _panel = null;
         _dragMc = null;
         _iconMc = null;
         _sp = null;
         _closeBtn = null;
         _classA = null;
         _tipsA = null;
         _statusA = null;
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      public function setup() : void
      {
         _panel = new TaskPanel68_MC();
         _dragMc = _panel["dragMc"];
         _closeBtn = _panel["closeBtn"];
         _iconMc = _panel["iconMc"];
      }
      
      private function onCloseBtnHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
         TasksManager.getProStatusList(68,onGetComHandler);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onUpHandler(e:MouseEvent) : void
      {
         _panel.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function onGetComHandler(a:Array) : void
      {
         _statusA = new Array();
         for(var i1:int = 0; i1 < a.length; i1++)
         {
            if(a[i1] == true)
            {
               _statusA.push(true);
            }
         }
         _statusA.push(false);
         var des:String = _desA[_statusA.length - 1];
         _panel["txt"].htmlText = "    " + des;
         if(_statusA.length >= 4)
         {
            _len = 1;
         }
         else
         {
            _len = _statusA.length;
         }
         switch(_len)
         {
            case 1:
               _scaN = 1;
               break;
            case 2:
               _scaN = 0.75;
               break;
            case 3:
               _scaN = 0.65;
               break;
            case 4:
               _scaN = 0.55;
               break;
            case 5:
               _scaN = 0.45;
               break;
            case 6:
               _scaN = 0.4;
         }
         addIcon();
      }
      
      private function onDownHandler(e:MouseEvent) : void
      {
         _panel.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function removeEvent() : void
      {
         var startIndex:int = 0;
         _dragMc.removeEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnHandler);
         if(_statusA.length >= 4)
         {
            startIndex = _statusA.length - 1;
         }
         for(var i1:int = startIndex; i1 < _statusA.length; i1++)
         {
            if(i1 == _statusA.length - 1)
            {
               ToolTipManager.remove(_sp.getChildAt(i1 - startIndex) as Sprite);
            }
         }
      }
      
      private function addEvent() : void
      {
         _dragMc.addEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnHandler);
      }
      
      private function addIcon() : void
      {
         var startIndex:int = 0;
         var icon1:Sprite = null;
         if(_sp)
         {
            if(_sp.numChildren > 0)
            {
               DisplayUtil.removeAllChild(_sp);
            }
         }
         _sp = new Sprite();
         if(_statusA.length >= 4)
         {
            startIndex = _statusA.length - 1;
         }
         for(var i1:int = startIndex; i1 < _statusA.length; i1++)
         {
            icon1 = new _classA[i1]() as Sprite;
            icon1.scaleX = _scaN;
            icon1.scaleY = _scaN;
            if(i1 == _statusA.length - 1)
            {
               ToolTipManager.add(icon1,_tipsA[i1]);
            }
            if(icon1["mc"])
            {
               if(startIndex <= 2)
               {
                  icon1["mc"].visible = _statusA[i1 - startIndex];
               }
            }
            _sp.addChild(icon1);
            icon1.x = (150 * _scaN + 5) * (i1 - startIndex);
         }
         _iconMc.addChild(_sp);
         _sp.x = (_iconMc.width - _sp.width) / 2;
         _sp.y = (_iconMc.height - _sp.height) / 2;
      }
   }
}

