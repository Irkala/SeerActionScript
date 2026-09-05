package com.robot.app.spacesurvey
{
   public class SurveyResultXMLInfo
   {
      
      private static var xmllist:XMLList;
      
      private static var xmlClass:Class = SurveyResultXMLInfo_xmlClass;
      
      private static var xml:XML = XML(new xmlClass());
      
      public function SurveyResultXMLInfo()
      {
         super();
      }
      
      public static function getIntrolInfo(name:String) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@name == name)[0];
         return xml.@introl;
      }
      
      public static function getEnergysByID(id:uint) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@id == id)[0];
         return xml.@energy;
      }
      
      public static function parseInfo() : void
      {
         if(xmllist == null)
         {
            xmllist = xml.descendants("star");
         }
      }
      
      public static function getSpaceID(name:String) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@name == name)[0];
         return xml.@id;
      }
      
      public static function getPetsByName(name:String) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@name == name)[0];
         return xml.@pet;
      }
      
      public static function getIconName(name:String) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@name == name)[0];
         return xml.@icon;
      }
      
      public static function getSpaceName(id:uint) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@id == id)[0];
         return xml.@Name;
      }
      
      public static function getPetsByID(id:uint) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@id == id)[0];
         return xml.@pet;
      }
      
      public static function getEnergysByName(name:String) : String
      {
         var xml:XML = null;
         SurveyResultXMLInfo.parseInfo();
         xml = xmllist.(@name == name)[0];
         return xml.@energy;
      }
   }
}

