package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.IconAlert;
   import com.robot.core.uic.UIPageBar;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.xinpian.ChipXMLInfo;
   import com.robot.module.app.xinpian.XinpianInfo;
   import com.robot.module.app.xinpian.XinpianListItem;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class XinPianDocPanel extends Sprite implements IModule
   {
      
      private static const MAX:int = 3;
      
      private var tempSpr:Sprite;
      
      private var _proBar:UIPageBar;
      
      private var _data:Array = [];
      
      private var _closeBtn:SimpleButton;
      
      private var _conSprite:Sprite;
      
      private var _mainUI:Sprite;
      
      public function XinPianDocPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _proBar.removeEventListener(MouseEvent.CLICK,onProClick);
         SocketConnection.removeCmdListener(CommandID.NONO_GET_CHIP,onGetChip);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _proBar.addEventListener(MouseEvent.CLICK,onProClick);
         SocketConnection.addCmdListener(CommandID.NONO_GET_CHIP,onGetChip);
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         var flyChipPanel:MovieClip = null;
         var item:XinpianListItem = e.currentTarget as XinpianListItem;
         if(item.info.id == 700017)
         {
            flyChipPanel = new FlyChipIntroPanel();
            LevelManager.appLevel.addChild(flyChipPanel);
            DisplayUtil.align(flyChipPanel,null,AlignType.MIDDLE_CENTER);
            flyChipPanel["closeBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
            {
               flyChipPanel["closeBtn"].removeEventListener(MouseEvent.CLICK,arguments.callee);
               DisplayUtil.removeForParent(flyChipPanel);
               flyChipPanel = null;
            });
            return;
         }
         tempSpr = e.target as Sprite;
         if(!item.info.isHas)
         {
            SocketConnection.send(CommandID.NONO_GET_CHIP,item.info.index + 1);
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         var item:XinpianListItem = null;
         hide();
         for(var i:int = 0; i < MAX; i++)
         {
            item = _conSprite.getChildAt(i) as XinpianListItem;
            item.removeEventListener(MouseEvent.CLICK,onItemClick);
            item.destroy();
            item = null;
         }
         _conSprite = null;
         _mainUI = null;
         _proBar.destroy();
         _proBar = null;
      }
      
      private function onProClick(e:DynamicEvent) : void
      {
         var item:XinpianListItem = null;
         var index:uint = e.paramObject as uint;
         var len:int = Math.min(_data.length - index * MAX,MAX);
         for(var i:int = 0; i < MAX; i++)
         {
            item = _conSprite.getChildAt(i) as XinpianListItem;
            item.clear();
            if(i < len)
            {
               item.info = _data[i + index * MAX];
            }
         }
      }
      
      private function onGetChip(e:SocketEvent) : void
      {
         var item:XinpianListItem = null;
         var info:XinpianInfo = null;
         var data:ByteArray = e.data as ByteArray;
         data.readUnsignedInt();
         data.readUnsignedInt();
         data.readUnsignedInt();
         var len:int = int(data.readUnsignedInt());
         var arr:Array = [];
         for(var i:int = 0; i < len; i++)
         {
            arr.push({
               "id":data.readUnsignedInt(),
               "count":data.readUnsignedInt()
            });
         }
         var id:uint = uint(arr[0].id);
         IconAlert.show("一个" + TextFormatUtil.getRedTxt(ChipXMLInfo.getName(id)) + "已放入你的超能NoNo仓库",id);
         for(var x:int = 0; x < MAX; x++)
         {
            item = _conSprite.getChildAt(x) as XinpianListItem;
            info = item.info;
            if(info)
            {
               if(info.id == id)
               {
                  MainManager.actorInfo.nonoChipList[info.index] = true;
                  info.isHas = true;
                  info.isNew = false;
                  item.setHas(true);
                  item.setNew(false);
                  tempSpr.filters = [];
               }
            }
         }
      }
      
      public function setup() : void
      {
         var item:XinpianListItem = null;
         _mainUI = new UI_XinpianLQ_Panel();
         _closeBtn = _mainUI["closeBtn"];
         _proBar = new UIPageBar(_mainUI["preBtn"],_mainUI["nextBtn"],_mainUI["pageTxt"],MAX);
         _data = ChipXMLInfo.getInfos();
         _data.sortOn("isNew",Array.DESCENDING);
         _proBar.totalLength = _data.length;
         _conSprite = new Sprite();
         _conSprite.x = 80;
         _conSprite.y = 100;
         _mainUI.addChild(_conSprite);
         for(var i:int = 0; i < MAX; i++)
         {
            item = new XinpianListItem();
            item.buttonMode = true;
            item.x = 150 * i;
            item.info = _data[i];
            _conSprite.addChild(item);
            item.addEventListener(MouseEvent.CLICK,onItemClick);
         }
      }
   }
}

