package com.robot.module.app.xinpian
{
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import org.taomee.ds.HashMap;
   
   public class ChipXMLInfo
   {
      
      private static var xmlClass:Class = ChipXMLInfo_xmlClass;
      
      private static var _dataMap:HashMap = new HashMap();
      
      setup();
      
      public function ChipXMLInfo()
      {
         super();
      }
      
      public static function getIsNew(id:uint) : Boolean
      {
         var info:XinpianInfo = _dataMap.getValue(id);
         if(info)
         {
            return info.isNew;
         }
         return false;
      }
      
      public static function getName(id:uint) : String
      {
         var info:XinpianInfo = _dataMap.getValue(id);
         if(info)
         {
            return info.name;
         }
         return "";
      }
      
      private static function setup() : void
      {
         var item:XML = null;
         var _id:uint = 0;
         var info:XinpianInfo = null;
         var ling:Boolean = false;
         var shiyong:Boolean = false;
         var i:int = 0;
         var xl:XMLList = XML(new xmlClass()).elements("n");
         for each(item in xl)
         {
            _id = uint(item.@id);
            info = new XinpianInfo();
            info.id = uint(item.@id);
            info.name = String(item.@name);
            if(item.hasOwnProperty("@isNew"))
            {
               info.isNew = Boolean(uint(item.@isNew));
            }
            ling = Boolean(MainManager.actorInfo.nonoChipList[i]);
            if(NonoManager.info)
            {
               shiyong = Boolean(NonoManager.info.func[info.id - 700001]);
            }
            if(ling || shiyong)
            {
               info.isHas = true;
            }
            else
            {
               info.isHas = false;
            }
            info.index = i;
            _dataMap.add(info.id,info);
            i++;
         }
      }
      
      public static function getInfos() : Array
      {
         return _dataMap.getValues();
      }
   }
}

