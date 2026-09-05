package com.robot.module.app.spriteTrack
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class IconItem extends Sprite
   {
      
      private var _txt:TextField;
      
      public var mc:MovieClip;
      
      private var _url:String;
      
      private var _icon:DisplayObject;
      
      public var type:uint;
      
      public var id:uint;
      
      private var _loadPanel:MLoadPane;
      
      public function IconItem(i:uint, t:uint)
      {
         super();
         type = t;
         id = i;
         mc = new IconItemBg();
         mc.gotoAndStop(1);
         _loadPanel = new MLoadPane();
         _loadPanel.isMask = false;
         this.addChild(_loadPanel);
         _txt = mc["txt"];
         _txt.mouseEnabled = false;
         this.addChild(mc);
         setInfo(i,t);
      }
      
      public function destroy() : void
      {
         ResourceManager.cancel(_url,onComHandler);
         _url = "";
         mc = null;
         _icon = null;
         if(_loadPanel)
         {
            _loadPanel.destroy();
            _loadPanel = null;
         }
         DisplayUtil.removeAllChild(this);
      }
      
      public function setInfo(i:uint, t:uint) : void
      {
         id = i;
         type = t;
         if(_icon)
         {
            DisplayUtil.removeForParent(_icon);
            _icon = null;
         }
         switch(t)
         {
            case 0:
               _txt.text = SpriteTrackXMLInfo.getStarName(id);
               _url = "resource/planet/icon/" + id + ".swf";
               ResourceManager.getResource(_url,onComHandler,"star");
               break;
            case 1:
               _txt.text = id + " " + SpriteTrackXMLInfo.getSpriteName(id);
               _url = "resource/pet/icon/" + id + ".swf";
               ResourceManager.getResource(_url,onComHandler,"pet");
         }
      }
      
      private function onComHandler(mc:DisplayObject) : void
      {
         if(mc)
         {
            if(_icon)
            {
               DisplayUtil.removeForParent(_icon);
               _icon = null;
            }
            _icon = mc;
            this.addChild(_icon);
            _icon.x = 20;
            _icon.y = 25;
         }
         else
         {
            _url = "";
         }
      }
   }
}

