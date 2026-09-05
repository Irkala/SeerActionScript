package com.robot.module.app.machineDog
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.energyExchange.ExchangeItemInfo;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class OrgBgPanel extends Sprite
   {
      
      private var _engMc:Sprite;
      
      private var _id:uint;
      
      private var _info:ExchangeItemInfo;
      
      public function OrgBgPanel(info:ExchangeItemInfo = null)
      {
         super();
         show(info);
      }
      
      private function onComHandler1(mc:DisplayObject) : void
      {
         if(_engMc)
         {
            DisplayUtil.removeForParent(_engMc);
            _engMc = null;
         }
         _engMc = mc as Sprite;
         if(_engMc)
         {
            _engMc.scaleX = 1.3;
            _engMc.scaleY = 1.3;
            addChild(_engMc);
            _engMc.x = (70 - _engMc.width) / 2;
            _engMc.y = (70 - _engMc.height) / 2;
         }
      }
      
      public function removeFormId() : void
      {
         ResourceManager.getResource(ItemXMLInfo.getIconURL(_id),onComHandler1);
      }
      
      public function show(info:ExchangeItemInfo = null) : void
      {
         if(info)
         {
            _info = info;
            ResourceManager.getResource(ItemXMLInfo.getIconURL(_info.itemId),onComHandler);
         }
         else
         {
            if(_info)
            {
               ResourceManager.cancel(ItemXMLInfo.getIconURL(_info.itemId),onComHandler);
               _info = null;
            }
            if(_engMc)
            {
               DisplayUtil.removeForParent(_engMc);
               _engMc = null;
            }
         }
      }
      
      private function onComHandler(mc:DisplayObject) : void
      {
         if(_engMc)
         {
            DisplayUtil.removeForParent(_engMc);
            _engMc = null;
         }
         _engMc = mc as Sprite;
         if(_engMc)
         {
            addChild(_engMc);
         }
      }
      
      public function showFormId(id:uint) : void
      {
         _id = id;
         var sp:Sprite = new Sprite();
         sp.graphics.lineStyle(1,0,1);
         sp.graphics.beginFill(0,1);
         sp.graphics.drawRect(0,0,70,70);
         sp.graphics.endFill();
         sp.alpha = 0;
         addChild(sp);
         ResourceManager.getResource(ItemXMLInfo.getIconURL(id),onComHandler1);
      }
   }
}

