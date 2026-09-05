package com.robot.module.app.taskRecord.menu
{
   import com.robot.core.utils.TextFormatUtil;
   
   public class NodeData implements INodeData
   {
      
      private var _outPut:String;
      
      private var _starid:String;
      
      private var _newOnline:String;
      
      private var _mapId:String;
      
      private var _npc:String;
      
      private var _offline:String;
      
      private var _energy:String;
      
      private var _nodeData:Array;
      
      private var _itemtype:String;
      
      private var _startDes:String;
      
      private var _isvip:String;
      
      private var _id:String;
      
      private var _onlineData:String;
      
      private var _parentId:String;
      
      private var _tip:String;
      
      private var _icon:String;
      
      private var _pet:String;
      
      private var _name:String;
      
      private var _intro:String;
      
      private var _stopDes:String;
      
      private var _starlevel:String;
      
      private var _spanlevel:String;
      
      public function NodeData()
      {
         super();
      }
      
      public function set icon(value:String) : void
      {
         _icon = value;
      }
      
      public function set spanlevel(value:String) : void
      {
         _spanlevel = value;
      }
      
      public function get nodeDataArray() : Array
      {
         return _nodeData;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get energy() : String
      {
         return _energy;
      }
      
      public function set energy(value:String) : void
      {
         _energy = value;
      }
      
      public function get isVip() : String
      {
         return _isvip;
      }
      
      public function set name(value:String) : void
      {
         _name = value;
      }
      
      public function get mapId() : String
      {
         return _mapId;
      }
      
      public function set itemtype(value:String) : void
      {
         _itemtype = value;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function set startDes(value:String) : void
      {
         _startDes = value;
      }
      
      public function set isVip(value:String) : void
      {
         _isvip = value;
      }
      
      public function get tip() : String
      {
         return _tip;
      }
      
      public function set newOnline(value:String) : void
      {
         _newOnline = value;
      }
      
      public function get pet() : String
      {
         return _pet;
      }
      
      public function get newOnline() : String
      {
         return _newOnline;
      }
      
      public function set id(value:String) : void
      {
         _id = value;
      }
      
      public function set mapId(value:String) : void
      {
         _mapId = value;
      }
      
      public function set pet(value:String) : void
      {
         _pet = value;
      }
      
      public function get onlineData() : String
      {
         return _onlineData;
      }
      
      public function set onlineData(value:String) : void
      {
         _onlineData = value;
      }
      
      public function set npc(value:String) : void
      {
         _npc = value;
      }
      
      public function set tip(value:String) : void
      {
         _tip = value;
      }
      
      public function set offline(value:String) : void
      {
         _offline = value;
      }
      
      public function get outPutArr() : Array
      {
         var ar:Array = null;
         var des:String = null;
         var i2:int = 0;
         var str:String = null;
         var a:Array = null;
         var i1:int = 0;
         if(_outPut.indexOf("|") == -1)
         {
            if(_outPut.indexOf("#") == -1)
            {
               return [_outPut];
            }
            ar = _outPut.split("#");
            ar[ar.length - 1] = TextFormatUtil.getRedTxt(ar[ar.length - 1]);
            des = "";
            for(i2 = 0; i2 < ar.length; i2++)
            {
               des += ar[i2];
            }
            return [des];
         }
         var arr:Array = _outPut.split("|");
         for(var i:uint = 0; i < arr.length; i++)
         {
            str = arr[i];
            if(str.indexOf("#") != -1)
            {
               a = str.split("#");
               a[a.length - 1] = TextFormatUtil.getRedTxt(a[a.length - 1]);
               str = "";
               for(i1 = 0; i1 < a.length; i1++)
               {
                  str += a[i1];
               }
               arr[i] = str;
            }
         }
         return arr;
      }
      
      public function set outPut(value:String) : void
      {
         _outPut = value;
      }
      
      public function set parentId(value:String) : void
      {
         _parentId = value;
      }
      
      public function get itemtype() : String
      {
         return _itemtype;
      }
      
      public function get startDes() : String
      {
         if(_startDes.indexOf("#") == -1)
         {
            return _startDes;
         }
         var a:Array = _startDes.split("#");
         a[a.length - 1] = TextFormatUtil.getRedTxt(a[a.length - 1]);
         var des:String = "";
         for(var i1:int = 0; i1 < a.length; i1++)
         {
            des += a[i1];
         }
         return des;
      }
      
      public function get stopDes() : String
      {
         if(_stopDes.indexOf("#") == -1)
         {
            return _stopDes;
         }
         var a:Array = _stopDes.split("#");
         a[a.length - 1] = TextFormatUtil.getRedTxt(a[a.length - 1]);
         var des:String = "";
         for(var i1:int = 0; i1 < a.length; i1++)
         {
            des += a[i1];
         }
         return des;
      }
      
      public function set nodeDataArray(value:Array) : void
      {
         _nodeData = value;
      }
      
      public function get npc() : String
      {
         return _npc;
      }
      
      public function get offline() : String
      {
         return _offline;
      }
      
      public function set starlevel(value:String) : void
      {
         _starlevel = value;
      }
      
      public function get parentId() : String
      {
         return _parentId;
      }
      
      public function set intro(value:String) : void
      {
         _intro = value;
      }
      
      public function set starid(value:String) : void
      {
         _starid = value;
      }
      
      public function get intro() : String
      {
         return _intro;
      }
      
      public function set stopDes(value:String) : void
      {
         _stopDes = value;
      }
      
      public function get outPut() : String
      {
         return _outPut;
      }
      
      public function get starlevel() : String
      {
         return _starlevel;
      }
      
      public function get icon() : String
      {
         return _icon;
      }
      
      public function get spanlevel() : String
      {
         return _spanlevel;
      }
      
      public function get starid() : String
      {
         return _starid;
      }
   }
}

