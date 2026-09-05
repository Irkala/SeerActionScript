package com.robot.module.app.spriteTrack
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import org.taomee.manager.ResourceManager;
   
   public class TxtMapIcon extends Sprite
   {
      
      private var _mapIcon:MovieClip;
      
      private var _url:String;
      
      private var _mapID:uint;
      
      public var mapNameTxt:TextField;
      
      public function TxtMapIcon(id:uint)
      {
         super();
         _mapIcon = new MapIconBg();
         mapNameTxt = _mapIcon["txt"];
         this.addChild(_mapIcon);
         _mapID = id;
         init(id);
      }
      
      private function onLoaded(mc:MovieClip) : void
      {
         if(mc)
         {
            _mapIcon.addChild(mc);
            if(_mapID != 0)
            {
               mapNameTxt.text = SpriteTrackXMLInfo.getMapName(_mapID);
            }
         }
      }
      
      private function init(id:uint) : void
      {
         _url = "resource/map/icon/" + id + ".swf";
         ResourceManager.getResource(_url,onLoaded,"map");
      }
   }
}

