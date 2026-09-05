package com.robot.module.app.machineDog
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.effect.ColorFilter;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class ChipInfoBgPanel extends Sprite
   {
      
      private var _id:uint;
      
      private var _isHave:Boolean;
      
      private var _engMc:MovieClip;
      
      private var sp:Sprite;
      
      private var _vip:uint;
      
      public function ChipInfoBgPanel(vip:uint)
      {
         super();
         _vip = vip;
         sp = new Sprite();
         sp.graphics.lineStyle(1,0,1);
         sp.graphics.beginFill(0,1);
         sp.graphics.drawRect(0,0,27.3,27.3);
         sp.graphics.endFill();
         sp.alpha = 0;
         addChild(sp);
      }
      
      public function removeIcon() : void
      {
         if(_engMc)
         {
            ToolTipManager.remove(_engMc);
            _engMc.filters = [];
            DisplayUtil.removeForParent(_engMc);
            _engMc = null;
         }
      }
      
      private function onComHandler(mc:DisplayObject) : void
      {
         if(_engMc)
         {
            _engMc.filters = [];
            DisplayUtil.removeForParent(_engMc);
            _engMc = null;
         }
         _engMc = mc as MovieClip;
         _engMc.width = 25;
         _engMc.height = 25;
         if(_engMc)
         {
            addChild(_engMc);
            if(_vip == 1)
            {
               if(ItemXMLInfo.getItemVipName(_id) != "")
               {
                  ToolTipManager.add(_engMc,ItemXMLInfo.getItemVipName(_id));
               }
               else
               {
                  ToolTipManager.add(_engMc,ItemXMLInfo.getName(_id));
               }
            }
            else
            {
               ToolTipManager.add(_engMc,ItemXMLInfo.getName(_id));
            }
            if(_isHave == false)
            {
               _engMc.filters = [ColorFilter.setGrayscale()];
            }
         }
      }
      
      public function destroy() : void
      {
         removeIcon();
         sp.graphics.clear();
         DisplayUtil.removeForParent(sp);
         sp = null;
      }
      
      public function addIcon(id:uint, isHave:Boolean = true) : void
      {
         _id = id;
         _isHave = isHave;
         var url:String = "resource/nono/icon/" + id + ".swf";
         ResourceManager.getResource(url,onComHandler);
      }
   }
}

