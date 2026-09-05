package com.robot.module.app.subMap
{
   import com.robot.core.*;
   import com.robot.core.config.xml.*;
   import com.robot.core.info.*;
   import com.robot.core.manager.*;
   import com.robot.core.manager.map.config.*;
   import com.robot.core.net.*;
   import com.robot.core.ui.mapTip.*;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.*;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.*;
   import org.taomee.utils.*;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Galaxy_2 extends Sprite implements IModule
   {
      
      private var intervalId:uint;
      
      private var myIcon:MovieClip;
      
      private var mapScrollRect:Rectangle;
      
      private var target:Number = 0;
      
      private var mc:MovieClip;
      
      private var isHited:Boolean = false;
      
      private var mapMC:MovieClip;
      
      public function Galaxy_2()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         SocketConnection.removeCmdListener(CommandID.MAP_HOT,onGetMapHot);
         mc = null;
         mapMC = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mc,false);
         isHited = false;
      }
      
      public function show() : void
      {
         initGalaxy();
      }
      
      private function initGalaxy() : void
      {
         var _loc1_:SimpleButton = null;
         var _loc2_:uint = 0;
         var _loc3_:* = null;
         var _loc4_:uint = uint(mc.numChildren);
         var _loc5_:int = 0;
         try
         {
            while(_loc5_ < _loc4_)
            {
               _loc1_ = mc.getChildAt(_loc5_) as SimpleButton;
               if(_loc1_)
               {
                  _loc1_.addEventListener(MouseEvent.CLICK,changeMap);
                  _loc2_ = uint(_loc1_.name.split("_")[1]);
                  _loc3_ = MapConfig.getName(_loc2_) + "\r<font color=\'#ff0000\'>" + MapConfig.getDes(_loc2_) + "</font>";
                  _loc1_.addEventListener(MouseEvent.MOUSE_OVER,onMosOver);
                  _loc1_.addEventListener(MouseEvent.MOUSE_OUT,onMosOut);
               }
               _loc5_++;
            }
         }
         catch(error:Error)
         {
         }
         getHot();
      }
      
      private function changeMap(param1:MouseEvent) : void
      {
         var _loc2_:String = (param1.currentTarget as SimpleButton).name;
         var _loc3_:uint = uint(_loc2_.split("_")[1]);
         MapManager.changeMap(_loc3_);
      }
      
      public function setup() : void
      {
         mc = new galaxy_plant_2();
         mc.cacheAsBitmap = true;
         addChild(mc);
         mc.x = 122;
         mc.y = 144;
         myIcon = new galaxy_my_icon();
         myIcon.mouseChildren = false;
         myIcon.mouseEnabled = false;
         DisplayUtil.FillColor(myIcon["mc"]["colorMC"],MainManager.actorInfo.color);
      }
      
      public function init(param1:Object = null) : void
      {
         mapMC = param1 as MovieClip;
      }
      
      public function getHot() : void
      {
         SocketConnection.addCmdListener(CommandID.MAP_HOT,onGetMapHot);
         SocketConnection.mainSocket.send(CommandID.MAP_HOT,[]);
         initMyPostion();
      }
      
      private function onMosOver(param1:MouseEvent) : void
      {
         var id:uint = 0;
         var evt:MouseEvent = param1;
         id = 0;
         var btn:SimpleButton = evt.currentTarget as SimpleButton;
         id = uint(btn.name.split("_")[1]);
         intervalId = setTimeout(function():void
         {
            MapTip.show(new MapTipInfo(id));
         },500);
      }
      
      private function onGetMapHot(param1:SocketEvent) : void
      {
         var _loc2_:SimpleButton = null;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:MovieClip = null;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:int = int(mapMC.getChildIndex(mapMC["galaxyMC"]));
         mapMC.addChildAt(mc,_loc8_ + 1);
         SocketConnection.removeCmdListener(CommandID.MAP_HOT,onGetMapHot);
         var _loc9_:MapHotInfo = param1.data as MapHotInfo;
         var _loc10_:uint = uint(mc.numChildren);
         var _loc11_:uint = 0;
         while(_loc11_ < _loc10_)
         {
            _loc2_ = mc.getChildAt(_loc11_) as SimpleButton;
            if(_loc2_)
            {
               _loc3_ = uint(_loc2_.name.split("_")[1]);
               _loc5_ = mc.getChildByName("hotMC_" + _loc3_) as MovieClip;
               _loc6_ = Math.ceil(uint(_loc9_.infos.getValue(_loc3_)) / 10);
               if(_loc6_ > 5)
               {
                  _loc6_ = 5;
               }
               _loc7_ = 0;
               while(_loc7_ < 5)
               {
                  if(_loc7_ < _loc6_)
                  {
                     _loc5_["mc_" + _loc7_].gotoAndStop(1);
                  }
                  else
                  {
                     _loc5_["mc_" + _loc7_].gotoAndStop(2);
                  }
                  _loc7_++;
               }
            }
            _loc11_++;
         }
      }
      
      private function initMyPostion() : void
      {
         var _loc1_:Point = SuperMapXMLInfo.getWorldMapPos(MapConfig.getSuperMapID(MainManager.actorInfo.mapID));
         var _loc2_:uint = uint(SuperMapXMLInfo.getCurrentGalaxy(MapConfig.getSuperMapID(MainManager.actorInfo.mapID)));
         if(_loc1_)
         {
            if(_loc2_ == 2)
            {
               if(_loc1_.x != 0 || _loc1_.y != 0)
               {
                  myIcon.x = _loc1_.x;
                  myIcon.y = _loc1_.y;
                  mc.addChild(myIcon);
               }
            }
            else
            {
               DisplayUtil.removeForParent(myIcon);
            }
         }
         else
         {
            DisplayUtil.removeForParent(myIcon);
         }
      }
      
      private function onMosOut(param1:MouseEvent) : void
      {
         clearTimeout(intervalId);
         MapTip.hide();
      }
   }
}

