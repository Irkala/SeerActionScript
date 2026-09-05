package com.robot.module.app.spriteTrack
{
   import org.taomee.ds.HashMap;
   
   public class SpriteTrackXMLInfo
   {
      
      private static var _spriteDataMap:HashMap;
      
      private static var _starDataMap:HashMap;
      
      private static var _mapDataMap:HashMap;
      
      private static var xmlClass:Class = SpriteTrackXMLInfo_xmlClass;
      
      private static var xml:XML = XML(new xmlClass());
      
      setup();
      
      public function SpriteTrackXMLInfo()
      {
         super();
      }
      
      public static function getSpriteMapList(id:uint) : Array
      {
         var mapList:Array = null;
         var list:Array = null;
         if(getSpriteXML(id).parent().name().toString() == "star")
         {
            return getStarMapList(getSpriteStarID(id));
         }
         return [getSpriteXML(id).parent().@id];
      }
      
      public static function get spriteList() : Array
      {
         return _spriteDataMap.getValues();
      }
      
      public static function getSpriteStarID(id:uint) : uint
      {
         if(getSpriteXML(id).parent().name().toString() == "star")
         {
            return getSpriteXML(id).parent().@id;
         }
         return getSpriteXML(id).parent().parent().@id;
      }
      
      public static function getMapSprite(id:uint) : XMLList
      {
         return getMapXML(id).sprite;
      }
      
      public static function getSpriteMapName(id:uint) : String
      {
         return getSpriteXML(id).parent().@name;
      }
      
      public static function getSpriteStatus(id:uint) : uint
      {
         return getSpriteXML(id).@status;
      }
      
      public static function get starList() : Array
      {
         return _starDataMap.getValues();
      }
      
      public static function getMapName(id:uint) : String
      {
         return getMapXML(id).@name;
      }
      
      public static function getMapSpriteList(id:uint) : Array
      {
         var xml:XML = null;
         var spriteList:XMLList = getMapSprite(id);
         var arr:Array = new Array();
         for(var i:uint = 0; i < spriteList.length(); i++)
         {
            xml = spriteList[i];
            arr.push(xml.@id);
         }
         return arr;
      }
      
      public static function get mapList() : Array
      {
         return _mapDataMap.getValues();
      }
      
      public static function getSpriteIdS() : Array
      {
         return _spriteDataMap.getKeys();
      }
      
      public static function getSpriteStarName(id:uint) : String
      {
         if(getSpriteXML(id).parent().name().toString() == "star")
         {
            return getSpriteXML(id).parent().@name;
         }
         return getSpriteXML(id).parent().parent().@name;
      }
      
      public static function getMapXML(id:uint) : XML
      {
         return _mapDataMap.getValue(id);
      }
      
      public static function getSpriteXML(id:uint) : XML
      {
         return _spriteDataMap.getValue(id);
      }
      
      public static function getSpriteName(id:uint) : String
      {
         return getSpriteXML(id).@name;
      }
      
      public static function getIconName(id:uint) : String
      {
         return "spriteIcon_" + id;
      }
      
      public static function getStarSpriteList(id:uint) : Array
      {
         var spriteXML:XML = null;
         var spriteList:XMLList = getStarXML(id).sprite;
         var arr:Array = new Array();
         for(var i:uint = 0; i < spriteList.length(); i++)
         {
            spriteXML = spriteList[i];
            arr.push(spriteXML.@id);
         }
         return arr;
      }
      
      public static function getStarXML(id:uint) : XML
      {
         return _starDataMap.getValue(id);
      }
      
      public static function getStarIcon(id:uint) : String
      {
         return "starIcon_" + id;
      }
      
      public static function getSpriteIntro(id:uint) : String
      {
         return getSpriteXML(id).@intro;
      }
      
      public static function getStarMapList(id:uint) : Array
      {
         var mapXML:XML = null;
         var mapList:XMLList = getStarXML(id).map;
         var arr:Array = new Array();
         for(var i:uint = 0; i < mapList.length(); i++)
         {
            mapXML = mapList[i];
            arr.push(uint(mapXML.@id));
         }
         return arr;
      }
      
      public static function getStarName(id:uint) : String
      {
         return getStarXML(id).@name;
      }
      
      public static function getStarIdS() : Array
      {
         return _starDataMap.getKeys();
      }
      
      public static function getSpriteMapID(id:uint) : uint
      {
         if(getSpriteXML(id).parent().name().toString() == "star")
         {
            return getSpriteXML(id).parent().@mapID;
         }
         return getSpriteXML(id).parent().@id;
      }
      
      private static function setup() : void
      {
         var sx:XML = null;
         var mapxl:XMLList = null;
         var mx:XML = null;
         var spritexl:XMLList = null;
         var spx:XML = null;
         _starDataMap = new HashMap();
         var starxl:XMLList = xml.descendants("star");
         for each(sx in starxl)
         {
            _starDataMap.add(sx.@id.toString(),sx);
         }
         _mapDataMap = new HashMap();
         mapxl = xml.descendants("map");
         for each(mx in mapxl)
         {
            _mapDataMap.add(mx.@id.toString(),mx);
         }
         _spriteDataMap = new HashMap();
         spritexl = xml.descendants("sprite");
         for each(spx in spritexl)
         {
            _spriteDataMap.add(spx.@id.toString(),spx);
         }
      }
      
      public static function getMapIcon(id:uint) : String
      {
         return "mapIcon_" + id;
      }
   }
}

