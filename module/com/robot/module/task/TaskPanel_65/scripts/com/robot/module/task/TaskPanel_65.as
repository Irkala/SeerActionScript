package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_65 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_65()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function setVisible(arr:Array) : void
      {
         var i:uint = 0;
         var nameStr:String = null;
         var name:String = null;
         var mc:MovieClip = null;
         for(var j:uint = 0; j < 16; j++)
         {
            nameStr = "icon_" + j;
            if(_mainUI[nameStr])
            {
               _mainUI[nameStr].visible = false;
            }
         }
         for each(i in arr)
         {
            name = "icon_" + i;
            mc = _mainUI[name];
            if(mc)
            {
               mc.visible = true;
            }
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(65,taskStatus);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         checkTask();
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_65_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_8"],"我在船长室等你呢");
         ToolTipManager.add(_mainUI["icon_12"],"水体样本");
         ToolTipManager.add(_mainUI["icon_13"],"大气样本");
         ToolTipManager.add(_mainUI["icon_14"],"土壤样本");
         ToolTipManager.add(_mainUI["icon_15"],"我在船长室等你呢");
      }
      
      private function taskStatus(arr:Array) : void
      {
         var name:String = null;
         var mc:MovieClip = null;
         var compIcon:MovieClip = null;
         _introTxt.htmlText = "    事不宜迟,请即刻前往露希欧行星收集原矿石吧!<font color=\'#ff0000\'>(以下每个地方收集一次就可以了)</font>";
         if(Boolean(arr[0]) && Boolean(arr[1]) && Boolean(arr[2]))
         {
            _introTxt.htmlText = "    你已经收集到3种原矿石，并记录了它们的基本资料，接下来把它们送去<font color=\'#ff0000\'>工程师苏克</font>处鉴定吧！" + "<font color=\'#ff0000\'>（苏克正在露希欧泥潭等你哦）</font>";
         }
         if(!arr[3])
         {
            setVisible([0,1,2]);
         }
         else
         {
            _introTxt.htmlText = "    “物质解析仪”就在动力室左下角，快带上原矿石去解析提炼吧！";
            setVisible([4,5,6]);
         }
         if(Boolean(arr[4]) && Boolean(arr[5]) && Boolean(arr[6]))
         {
            _introTxt.htmlText = "    矿石已经解析，并记录了它们的详细资料，接下来把它们送去<font color=\'#ff0000\'>工程师苏克</font>那吧！" + "<font color=\'#ff0000\'>（苏克正在露希欧泥潭等你哦）</font>";
         }
         if(arr[7])
         {
            _introTxt.htmlText = "    快去船长室，把发现稀有矿藏的好消息和记录的矿石资料传达给<font color=\'#ff0000\'>船长罗杰</font>吧！";
            setVisible([8]);
         }
         if(arr[8])
         {
            _introTxt.htmlText = "    快去露希欧行星采集土壤,水体样本，连同船长托付的大气样本一起送往<font color=\'#ff0000\'>工程师苏克</font>那吧！";
            setVisible([9,10]);
         }
         if(Boolean(arr[9]) && Boolean(arr[10]))
         {
            _introTxt.htmlText = "    样本已经集齐，快送去<font color=\'#ff0000\'>工程师苏克</font>处进行测定吧！" + "<font color=\'#ff0000\'>（苏克正在露希欧泥潭等你哦）</font>";
         }
         if(arr[11])
         {
            _introTxt.htmlText = "    苏克已经准备好了各种仪器，现在就来配合他进行检测吧。<font color=\'#ff0000\'>（与苏克对话进行各项测定）</font>";
            setVisible([12,13,14]);
         }
         if(arr[14])
         {
            _introTxt.htmlText = "    恭喜你成功测定了露希欧星的环境状况，现在就把记录的资料带去给船长吧。<font color=\'#ff0000\'>（船长罗杰正在船长室等你哦）</font>";
            setVisible([15]);
         }
         for(var i:uint = 0; i < arr.length; i++)
         {
            name = "icon_" + i;
            mc = _mainUI[name];
            if(mc)
            {
               if(arr[i])
               {
                  compIcon = new CompleteIcon();
                  mc.addChild(compIcon);
               }
            }
         }
      }
   }
}

