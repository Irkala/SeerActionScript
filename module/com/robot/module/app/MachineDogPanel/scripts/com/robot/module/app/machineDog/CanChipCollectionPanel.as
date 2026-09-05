package com.robot.module.app.machineDog
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.ds.HashMap;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.Utils;
   
   public class CanChipCollectionPanel extends Sprite
   {
      
      private var _allIdA:Array = [700003,700002,700001];
      
      private const _length:uint = 8;
      
      private var _curBtnA:Array;
      
      private var _allChipId:Array = [700001,700002,700003,700004,700005,700011,700015,700016,700017,700018];
      
      private var _totalLength:uint = 60;
      
      private var _closeFun:Function;
      
      private var _allClassA:Array = [MC700001,MC700002,MC700003,MC700004,MC700005,MC700011,MC700015,MC700016,MC700017,MC700018];
      
      private const _radiusNum:Number = 180;
      
      private var _allMap:HashMap;
      
      private var _tipA:Array = ["精灵恢复","分子转化仪","经验分配器","精灵模拟训练","跟随模式","精灵仓库","精灵追踪","技能排序","开启飞行模式","元神赋形"];
      
      private var _tipMap:HashMap;
      
      public var _curPage:uint;
      
      private var _allPointA:Array;
      
      public var _totalPage:uint;
      
      public function CanChipCollectionPanel(a:Array, closeFun:Function)
      {
         super();
         _closeFun = closeFun;
         _tipMap = new HashMap();
         for(var i1:int = 0; i1 < _allChipId.length; i1++)
         {
            _tipMap.add(_allChipId[i1],_tipA[i1]);
         }
         computePoint();
         if(NonoManager.info)
         {
            makeHashMap(NonoManager.info.func);
         }
         else
         {
            makeHashMap(a);
         }
         _allIdA = _allIdA.reverse();
         addChip();
      }
      
      public function destroy() : void
      {
         removeOldChip();
         DisplayUtil.removeForParent(this);
         _allPointA = null;
         _allIdA = null;
         _allClassA = null;
         _allChipId = null;
         _allMap.clear();
         _allMap = null;
         _curBtnA = null;
      }
      
      public function rightMove() : void
      {
         if(_curPage < _totalPage)
         {
            ++_curPage;
            addChip();
         }
      }
      
      private function addChip() : void
      {
         var cls:Class = null;
         var btn:SimpleButton = null;
         removeOldChip();
         _curBtnA = new Array();
         var a:Array = _allIdA.slice((_curPage - 1) * _length,_curPage * _length);
         for(var i1:int = 0; i1 < _length; i1++)
         {
            if(a[i1] != undefined)
            {
               cls = _allMap.getValue(a[i1]) as Class;
               btn = new cls();
               btn.name = "btn" + a[i1];
               btn.x = _allPointA[i1].x;
               btn.y = _allPointA[i1].y;
               this.addChild(btn);
               ToolTipManager.add(btn,_tipMap.getValue(a[i1]));
               btn.addEventListener(MouseEvent.CLICK,onClickHandler);
               _curBtnA.push(btn);
            }
         }
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         var name:String = (e.currentTarget as SimpleButton).name;
         var index:uint = uint(name.slice(3,name.length));
         if(index == 700005)
         {
            if(NonoManager.info.state[1])
            {
               Alarm.show("你的NoNo现在已经处于跟随状态！");
               return;
            }
         }
         var cls:Class = Utils.getClass("com.robot.app.nono.featureApp.App_" + index.toString());
         if(cls)
         {
            new cls(index);
         }
         _closeFun();
      }
      
      private function makeHashMap(a:Array) : void
      {
         _allMap = new HashMap();
         _allMap.add(_allChipId[0],_allClassA[0]);
         _allMap.add(_allChipId[1],_allClassA[1]);
         _allMap.add(_allChipId[2],_allClassA[2]);
         for(var i1:int = 3; i1 < _allClassA.length; i1++)
         {
            if(a[_allChipId[i1] - 700001])
            {
               if(MainManager.actorInfo.superNono)
               {
                  _allIdA.push(_allChipId[i1]);
                  _allMap.add(_allChipId[i1],_allClassA[i1]);
               }
               else if(!ItemXMLInfo.getVipOnly(_allChipId[i1]))
               {
                  if(NonoManager.info.ai >= ItemXMLInfo.getAiLevel(_allChipId[i1]))
                  {
                     _allIdA.push(_allChipId[i1]);
                     _allMap.add(_allChipId[i1],_allClassA[i1]);
                  }
               }
            }
         }
         _curPage = 1;
         if(_allIdA.length <= _length)
         {
            _totalPage = 1;
         }
         else if(_allIdA.length % _length == 0)
         {
            _totalPage = _allIdA.length / _length;
         }
         else
         {
            _totalPage = int(_allIdA.length / _length) + 1;
         }
      }
      
      private function computePoint() : void
      {
         var degree:Number = NaN;
         var nX:Number = NaN;
         var nY:Number = NaN;
         var point:Point = null;
         _allPointA = new Array();
         for(var i1:int = 0; i1 < _length; i1++)
         {
            degree = i1 * 360 / _length;
            nY = Math.sin(degree * Math.PI / 180) * _radiusNum;
            nY = Number(nY.toFixed(1));
            nX = Math.cos(degree * Math.PI / 180) * _radiusNum;
            nX = Number(nX.toFixed(1));
            point = new Point(nX,nY);
            _allPointA.push(point);
         }
      }
      
      private function removeOldChip() : void
      {
         var i1:int = 0;
         if(_curBtnA)
         {
            if(_curBtnA.length > 0)
            {
               for(i1 = 0; i1 < _curBtnA.length; i1++)
               {
                  ToolTipManager.remove(_curBtnA[i1]);
                  _curBtnA[i1].removeEventListener(MouseEvent.CLICK,onClickHandler);
                  DisplayUtil.removeForParent(_curBtnA[i1]);
                  _curBtnA[i1] = null;
               }
            }
         }
      }
      
      public function leftMove() : void
      {
         if(_curPage > 1)
         {
            --_curPage;
            addChip();
         }
      }
   }
}

