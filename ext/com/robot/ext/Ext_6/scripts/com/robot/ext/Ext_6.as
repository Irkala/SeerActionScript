package com.robot.ext
{
   import com.robot.core.config.xml.MapXMLInfo;
   import com.robot.core.event.MapEvent;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_6 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      public function Ext_6()
      {
         super();
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         onMapDown(null);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(!_sprite.transform.pixelBounds.intersection(MainManager.actorModel.hitRect).isEmpty())
         {
            changeMap();
            return;
         }
         MapManager.addEventListener(MapEvent.MAP_MOUSE_DOWN,onMapDown);
         MainManager.actorModel.addEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
         MainManager.actorModel.walkAction(new Point(e.stageX,e.stageY));
      }
      
      private function changeMap() : void
      {
         var id:uint = 0;
         var len:int = 0;
         var gotoID:uint = 0;
         var filterArray:Array = [316];
         var data:Array = MapXMLInfo.getIDList();
         var hdata:Array = [];
         var currID:uint = uint(MainManager.actorInfo.mapID);
         for each(id in data)
         {
            if(id < 200 && id != currID && filterArray.indexOf(id) == -1)
            {
               hdata.push(id);
            }
         }
         len = int(hdata.length);
         gotoID = uint(hdata[int(Math.random() * len)]);
         if(gotoID == len)
         {
            gotoID = len - 1;
         }
         MapManager.changeMap(gotoID);
      }
      
      private function onWalkEnter(e:RobotEvent) : void
      {
         if(!_sprite.transform.pixelBounds.intersection(MainManager.actorModel.hitRect).isEmpty())
         {
            onMapDown(null);
            MainManager.actorModel.stop();
            changeMap();
            return;
         }
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onMapDown(e:MapEvent) : void
      {
         MapManager.removeEventListener(MapEvent.MAP_MOUSE_DOWN,onMapDown);
         MainManager.actorModel.removeEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
      }
   }
}

