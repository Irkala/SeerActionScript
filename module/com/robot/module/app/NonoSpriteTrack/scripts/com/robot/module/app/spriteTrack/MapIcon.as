package com.robot.module.app.spriteTrack
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   
   public class MapIcon extends Sprite
   {
      
      private var _sprPointArr:Array = [[15,15],[70,15],[56,44],[15,60],[70,60]];
      
      private var _mapSprIds:Array;
      
      private var _mapIcon:MovieClip;
      
      private var _url:String;
      
      private var _mapID:uint;
      
      private var _spriteIcon:MovieClip;
      
      private var _spriteID:uint;
      
      public function MapIcon(id:uint)
      {
         super();
         _mapID = id;
         init(id);
      }
      
      private function onLoaded(mc:MovieClip) : void
      {
         if(mc)
         {
            this.addChild(mc);
            loadSprite();
         }
      }
      
      private function init(id:uint) : void
      {
         _url = "resource/map/icon/" + id + ".swf";
         ResourceManager.getResource(_url,onLoaded,"map");
      }
      
      private function loadSprite() : void
      {
         var id:uint = 0;
         var sprite:SpriteIcon = null;
         _mapSprIds = SpriteTrackXMLInfo.getMapSpriteList(_mapID);
         var i:uint = 0;
         for each(id in _mapSprIds)
         {
            sprite = new SpriteIcon(id);
            this.addChild(sprite);
            sprite.x = _sprPointArr[i][0];
            sprite.y = _sprPointArr[i][1];
            i++;
         }
      }
   }
}

