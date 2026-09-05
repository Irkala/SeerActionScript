package com.robot.module.app.taskRecord
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.module.app.taskRecord.menu.NodeData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class PanelStar
   {
      
      private var petContainer:MovieClip;
      
      private var sprite:TextField;
      
      private const SPACE:uint = 65;
      
      private var _data:NodeData;
      
      private var starnameTxt:TextField;
      
      private var starIntroTxt:TextField;
      
      private var energyContainer:MovieClip;
      
      public function PanelStar(data:NodeData)
      {
         super();
         _data = data;
      }
      
      public static function getStarIconByID(id:String, iconContainer:MovieClip) : void
      {
         var _url:String;
         iconContainer.scaleX = 1;
         iconContainer.scaleY = 1;
         _url = "resource/planet/icon/" + id + ".swf";
         ResourceManager.getResource(_url,function(mc:DisplayObject):void
         {
            var _icon:MLoadPane = null;
            if(mc)
            {
               _icon = new MLoadPane(mc);
               if(mc.width > mc.height)
               {
                  _icon.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _icon.fitType = MLoadPane.FIT_HEIGHT;
               }
               _icon.setSizeWH(70,70);
               iconContainer.addChild(_icon);
            }
         },"star");
      }
      
      private function loadPet() : void
      {
         var i:uint = 0;
         var petsArr:Array = _data.pet.split("|");
         if(petsArr.length > 0)
         {
            for(i = 0; i < petsArr.length; i++)
            {
               ResourceManager.getResource(ClientConfig.getPetSwfPath(uint(petsArr[i])),onLoadPet(i,petsArr),"pet");
            }
         }
      }
      
      private function loadItem() : void
      {
         var i:uint = 0;
         var energysArr:Array = _data.energy.split("|");
         if(energysArr.length >= 1 && energysArr[0] != "")
         {
            for(i = 0; i < energysArr.length; i++)
            {
               ResourceManager.getResource(ItemXMLInfo.getIconURL(uint(energysArr[i])),onLoadItem(i,energysArr),"item");
            }
            sprite.visible = true;
         }
         else
         {
            sprite.visible = false;
         }
      }
      
      public function initPanel() : MovieClip
      {
         var panel:MovieClip = new panel4();
         sprite = panel["ttMC"];
         petContainer = panel["petContainer"];
         energyContainer = panel["energyContainer"];
         starIntroTxt = panel["starIntro"];
         starnameTxt = panel["starname"];
         starIntroTxt.htmlText = "    " + _data.intro;
         starnameTxt.htmlText = _data.name;
         loadPet();
         loadItem();
         getStarIconByID(_data.starid,panel["starContainer"]);
         return panel;
      }
      
      private function onLoadItem(index:uint, energysArr:Array) : Function
      {
         var func:Function = function(o:DisplayObject):void
         {
            var _showMc:MovieClip = o as MovieClip;
            _showMc.gotoAndStop(1);
            var bg:MovieClip = new bgCls() as MovieClip;
            bg.x = SPACE * index;
            _showMc.x = _showMc.x - bg.width / 2 + 10;
            _showMc.y = _showMc.y - bg.height + 10;
            bg.addChild(_showMc);
            ToolTipManager.add(bg,ItemXMLInfo.getName(energysArr[index]));
            energyContainer.addChild(bg);
            DisplayUtil.align(_showMc,bg.getRect(bg),AlignType.MIDDLE_CENTER);
         };
         return func;
      }
      
      private function onLoadPet(index:uint, petsArr:Array) : Function
      {
         var func:Function = function(o:DisplayObject):void
         {
            var rect:Rectangle;
            var bmp:Bitmap;
            var bmpData:BitmapData;
            var ma:Matrix;
            var _showMc:MovieClip = null;
            _showMc = o as MovieClip;
            var bg:MovieClip = new bgCls() as MovieClip;
            bg.x = SPACE * index;
            if(_showMc)
            {
               _showMc.gotoAndStop("rightdown");
               _showMc.addEventListener(Event.ENTER_FRAME,function():void
               {
                  var mc:MovieClip = _showMc.getChildAt(0) as MovieClip;
                  if(mc)
                  {
                     mc.gotoAndStop(1);
                     _showMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  }
               });
               DisplayUtil.stopAllMovieClip(_showMc);
            }
            bmpData = new BitmapData(_showMc.width,_showMc.height,true,0);
            ma = new Matrix();
            rect = _showMc.getRect(_showMc);
            ma.translate(-rect.x,-rect.y);
            bmpData.draw(_showMc,ma);
            bmp = new Bitmap(bmpData);
            DisplayUtil.align(bmp,bg.getRect(bg),AlignType.MIDDLE_CENTER);
            bg.addChild(bmp);
            ToolTipManager.add(bg,PetXMLInfo.getName(petsArr[index]));
            petContainer.addChild(bg);
         };
         return func;
      }
   }
}

