package com.robot.module.app.subMap
{
   import com.robot.core.*;
   import com.robot.core.config.xml.*;
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
   import org.taomee.utils.*;
   
   public class Galaxy_4 extends Sprite
   {
      
      private var intervalId:uint;
      
      private var myIcon:MovieClip;
      
      private var mapScrollRect:Rectangle;
      
      private var target:Number = 0;
      
      private var mc:MovieClip;
      
      private var isHited:Boolean = false;
      
      private var mapMC:MovieClip;
      
      public function Galaxy_4()
      {
         super();
      }
      
      public function destroy() : void
      {
         this.hide();
         SocketConnection.removeCmdListener(CommandID.MAP_HOT,this.onGetMapHot);
         this.mc.removeEventListener(Event.ENTER_FRAME,this.onMapEnter);
         this.mc = null;
         this.mapMC = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this.mc,false);
         this.isHited = false;
      }
      
      public function show() : void
      {
         this.initGalaxy();
      }
      
      private function initGalaxy() : void
      {
         var _loc1_:SimpleButton = null;
         var _loc2_:* = 0;
         var _loc3_:* = null;
         var _loc4_:uint = uint(this.mc.numChildren);
         var _loc5_:int = 0;
         this.mc.scrollRect = this.mapScrollRect;
         this.mc.addEventListener(Event.ENTER_FRAME,this.onMapEnter);
         try
         {
            while(_loc5_ < _loc4_)
            {
               _loc1_ = this.mc.getChildAt(_loc5_) as SimpleButton;
               if(_loc1_)
               {
                  _loc1_.addEventListener(MouseEvent.CLICK,this.changeMap);
                  _loc2_ = uint(_loc1_.name.split("_")[1]);
                  _loc3_ = MapConfig.getName(_loc2_) + "\r<font color=\'#ff0000\'>" + MapConfig.getDes(_loc2_) + "</font>";
                  _loc1_.addEventListener(MouseEvent.MOUSE_OVER,this.onMosOver);
                  _loc1_.addEventListener(MouseEvent.MOUSE_OUT,this.onMosOut);
               }
               _loc5_++;
            }
         }
         catch(error:Error)
         {
         }
         this.getHot();
      }
      
      private function changeMap(param1:MouseEvent) : void
      {
         var _loc2_:String = (param1.currentTarget as SimpleButton).name;
         var _loc3_:uint = uint(_loc2_.split("_")[1]);
         MapManager.changeMap(_loc3_);
      }
      
      public function setup() : void
      {
         this.mc = new galaxy_plant_4();
         this.mc.cacheAsBitmap = true;
         addChild(this.mc);
         this.mc.x = 122;
         this.mc.y = 144;
         this.mapScrollRect = new Rectangle(0,0,763,260);
         this.myIcon = new galaxy_my_icon();
         this.myIcon.mouseChildren = false;
         this.myIcon.mouseEnabled = false;
         DisplayUtil.FillColor(this.myIcon["mc"]["colorMC"],MainManager.actorInfo.color);
      }
      
      public function init(param1:Object = null) : void
      {
         this.mapMC = param1 as MovieClip;
      }
      
      private function onMapEnter(param1:Event) : void
      {
         var _loc2_:Number = 124 + 756;
         var _loc3_:Number = Number(MainManager.getStage().mouseX);
         var _loc4_:Number = (_loc3_ - 124) / (825 - 124);
         if(!(!this.mc.hitTestPoint(MainManager.getStage().mouseX,MainManager.getStage().mouseY,true) || _loc3_ < 124 || _loc3_ > 825))
         {
            if(!this.isHited && this.mc.hitTestPoint(MainManager.getStage().mouseX,MainManager.getStage().mouseY,true))
            {
               this.isHited = true;
            }
            this.target = _loc2_ * _loc4_;
         }
         if(!this.isHited)
         {
            return;
         }
         if(Math.abs(this.target - this.mapScrollRect.x) < 2)
         {
            this.mapScrollRect.x = this.target;
         }
         else
         {
            this.mapScrollRect.x += (this.target - this.mapScrollRect.x) / 12;
         }
         this.mc.scrollRect = this.mapScrollRect;
      }
      
      public function getHot() : void
      {
         SocketConnection.addCmdListener(CommandID.MAP_HOT,this.onGetMapHot);
         SocketConnection.mainSocket.send(CommandID.MAP_HOT,[]);
         this.initMyPostion();
      }
      
      private function onMosOver(param1:MouseEvent) : void
      {
         var id:uint = 0;
         id = 0;
         var evt:MouseEvent = param1;
         id = 0;
         var btn:SimpleButton = evt.currentTarget as SimpleButton;
         id = uint(btn.name.split("_")[1]);
         this.intervalId = setTimeout(function():void
         {
            MapTip.show(new MapTipInfo(id));
         },500);
      }
      
      private function onGetMapHot(param1:SocketEvent) : void
      {
         var _loc2_:SimpleButton = null;
         var _loc7_:int = int(this.mapMC.getChildIndex(this.mapMC["galaxyMC"]));
         this.mapMC.addChildAt(this.mc,_loc7_ + 1);
         SocketConnection.removeCmdListener(CommandID.MAP_HOT,this.onGetMapHot);
         var _loc8_:* = param1.data;
         var _loc9_:uint = uint(this.mc.numChildren);
         var _loc11_:uint = 0;
         while(_loc11_ < _loc9_)
         {
            _loc2_ = this.mc.getChildAt(_loc11_) as SimpleButton;
            if(_loc2_)
            {
               var _loc3_:uint = uint(_loc2_.name.split("_")[1]);
               var _loc4_:MovieClip = this.mc.getChildByName("hotMC_" + _loc3_) as MovieClip;
               if(_loc4_)
               {
                  var _loc5_:uint = Math.ceil(uint(_loc8_.infos.getValue(_loc3_)) / 10);
                  if(_loc5_ > 5)
                  {
                     _loc5_ = 5;
                  }
                  var _loc6_:uint = 0;
                  while(_loc6_ < 5)
                  {
                     if(_loc6_ < _loc5_)
                     {
                        _loc4_["mc_" + _loc6_].gotoAndStop(1);
                     }
                     else
                     {
                        _loc4_["mc_" + _loc6_].gotoAndStop(2);
                     }
                     _loc6_++;
                  }
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
            if(_loc2_ == 4)
            {
               if(_loc1_.x != 0 || _loc1_.y != 0)
               {
                  this.myIcon.x = _loc1_.x;
                  this.myIcon.y = _loc1_.y;
                  this.mc.addChild(this.myIcon);
               }
            }
            else
            {
               DisplayUtil.removeForParent(this.myIcon);
            }
         }
         else
         {
            DisplayUtil.removeForParent(this.myIcon);
         }
      }
      
      private function onMosOut(param1:MouseEvent) : void
      {
         clearTimeout(this.intervalId);
         MapTip.hide();
      }
   }
}

