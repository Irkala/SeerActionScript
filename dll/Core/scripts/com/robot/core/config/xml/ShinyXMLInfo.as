package com.robot.core.config.xml
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import org.taomee.ds.HashMap;
   
   public class ShinyXMLInfo
   {
      
      private static var _dataMap:HashMap;
      
      private static const XML_PATH:String = "resource/xml/291.xml";
      
      private static const PRESETS:Array = [["0.8","0.1","0.1","0","50","0.1","0.8","0.1","0","50","0.1","0.1","0.8","0","50","0","0","0","1","0","16761125","1","20","20","1.6"],["0.25","0.99","-0.24","0","0","-0.24","1.31","-0.07","0","0","0.44","-0.57","1.14","0","0","0","0","0","1","0","65535","1","20","20","1.6"],["0","0","1","0","0","0","1","0","0","0","1","0","0","0","0","0","0","0","1","0","255","1","10","10","1.6"],["0.1","1.3","-0.4","0","0","0.8","1","-0.14","-0.65","0","0.9","-0.77","1.4","-0.5","0","0","0","0","1","0","65280","1","10","10","1.6"],["0.9","0.1","0","0","0","0","0","1","0","0","0","0.2","0.8","0","0","0","0","0","1","0","16711935","1","10","10","1.6"]];
      
      public function ShinyXMLInfo()
      {
         super();
      }
      
      public static function setup(param1:Function = null) : void
      {
         var callback:Function = param1;
         _dataMap = new HashMap();
         var urlloader:URLLoader = new URLLoader();
         var onComplete:Function = function(param1:Event):void
         {
            var xml:XML;
            var list:XMLList;
            var item:XML;
            urlloader.removeEventListener(Event.COMPLETE,onComplete);
            urlloader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
            try
            {
               xml = new XML(param1.target.data);
               list = xml.elements("filter");
               item = null;
               for each(item in list)
               {
                  _dataMap.add(item.@petId.toString(),item);
               }
            }
            catch(e:Error)
            {
            }
            if(callback != null)
            {
               callback();
            }
         };
         var onError:Function = function(param1:IOErrorEvent):void
         {
            urlloader.removeEventListener(Event.COMPLETE,onComplete);
            urlloader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
            if(callback != null)
            {
               callback();
            }
         };
         urlloader.addEventListener(Event.COMPLETE,onComplete);
         urlloader.addEventListener(IOErrorEvent.IO_ERROR,onError);
         try
         {
            urlloader.load(new URLRequest(XML_PATH + "?" + Math.random()));
         }
         catch(e:Error)
         {
            if(callback != null)
            {
               callback();
            }
         }
      }
      
      public static function getShinyArray(param1:uint, param2:uint = 0) : Array
      {
         var xml:XML;
         var args:String;
         var strArray:Array;
         var i:int;
         var idx:int;
         var preset:Array;
         var petId:uint = param1;
         var shinyID:uint = param2;
         var result:Array = [0.8,0.1,0.1,0,50,0.1,0.8,0.1,0,50,0.1,0.1,0.8,0,50,0,0,0,1,0];
         if(_dataMap != null)
         {
            xml = _dataMap.getValue(petId.toString() + "-" + shinyID.toString());
            if(!Boolean(xml))
            {
               xml = _dataMap.getValue(petId.toString());
            }
            if(!Boolean(xml))
            {
               xml = _dataMap.getValue((petId % 20 + 100).toString() + "-" + shinyID.toString());
            }
            if(Boolean(xml))
            {
               try
               {
                  args = String(xml.@args);
                  strArray = args.split(",");
                  i = 0;
                  while(i < strArray.length)
                  {
                     strArray[i] = String(strArray[i]).replace(/^\s+|\s+$/g,"");
                     i++;
                  }
                  return strArray;
               }
               catch(e:Error)
               {
               }
            }
         }
         idx = (petId + shinyID) % PRESETS.length;
         preset = PRESETS[idx];
         return preset.slice(0,20);
      }
      
      public static function getGlowArray(param1:uint, param2:uint = 0) : Array
      {
         var xml:XML;
         var glow:String;
         var strArray:Array;
         var i:int;
         var idx:int;
         var preset:Array;
         var petId:uint = param1;
         var shinyID:uint = param2;
         var result:Array = [16761125,1,20,20,1.6];
         if(_dataMap != null)
         {
            xml = _dataMap.getValue(petId.toString() + "-" + shinyID.toString());
            if(!Boolean(xml))
            {
               xml = _dataMap.getValue(petId.toString());
            }
            if(!Boolean(xml))
            {
               xml = _dataMap.getValue((petId % 20 + 100).toString() + "-" + shinyID.toString());
            }
            if(Boolean(xml))
            {
               try
               {
                  glow = String(xml.@glow);
                  strArray = glow.split(",");
                  i = 0;
                  while(i < strArray.length)
                  {
                     strArray[i] = String(strArray[i]).replace(/^\s+|\s+$/g,"");
                     i++;
                  }
                  return strArray;
               }
               catch(e:Error)
               {
               }
            }
         }
         idx = (petId + shinyID) % PRESETS.length;
         preset = PRESETS[idx];
         return preset.slice(20,25);
      }
   }
}

