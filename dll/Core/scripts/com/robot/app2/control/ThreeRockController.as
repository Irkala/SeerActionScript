package com.robot.app2.control
{
   import com.robot.app.fight.FightManager;
   import com.robot.core.animate.AnimateManager;
   import com.robot.core.manager.map.config.BaseMapProcess;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import org.taomee.manager.ToolTipManager;
   
   public class ThreeRockController
   {
      
      private static var _map:BaseMapProcess;
      
      private static var _rock1:MovieClip;
      
      private static var _rock2:MovieClip;
      
      private static var _rock3:MovieClip;
      
      private static var _rockStatus:Array;
      
      private static const ROCK_NUM:uint = 3;
      
      private static const INIT_POINTS:Array = [[[100,236],[192,242],[744,172]],[[202,350],[356,336],[686,344]],[[906,170],[850,348],[860,270]]];
      
      public function ThreeRockController()
      {
         super();
      }
      
      public static function initRocks(param1:BaseMapProcess) : void
      {
         var flag:Boolean = false;
         _map = param1;
         _rockStatus = new Array(ROCK_NUM);
         var i:uint = 0;
         while(i < ROCK_NUM)
         {
            flag = Math.random() < 0.1 ? true : false;
            _rockStatus[i] = flag;
            if(flag)
            {
               var j:uint = i + 1;
               while(j < ROCK_NUM)
               {
                  _rockStatus[j] = false;
                  j++;
               }
               break;
            }
            i++;
         }
         _rock1 = _map.conLevel["rock_1"];
         _rock2 = _map.conLevel["rock_2"];
         _rock3 = _map.conLevel["rock_3"];
         _rock1.buttonMode = true;
         _rock2.buttonMode = true;
         _rock3.buttonMode = true;
         ToolTipManager.add(_rock1,"奇怪的石头");
         ToolTipManager.add(_rock2,"奇怪的石头");
         ToolTipManager.add(_rock3,"奇怪的石头");
         _rock1.addEventListener(MouseEvent.CLICK,onRockClick);
         _rock2.addEventListener(MouseEvent.CLICK,onRockClick);
         _rock3.addEventListener(MouseEvent.CLICK,onRockClick);
         initRocksPoint();
      }
      
      private static function initRocksPoint() : void
      {
         var idx:uint = 0;
         var i:uint = 0;
         while(i < ROCK_NUM)
         {
            idx = Math.floor(Math.random() * 3);
            _map.conLevel["rock_" + (i + 1)].x = INIT_POINTS[i][idx][0];
            _map.conLevel["rock_" + (i + 1)].y = INIT_POINTS[i][idx][1];
            i++;
         }
      }
      
      private static function onRockClick(param1:MouseEvent) : void
      {
         var index:uint = 0;
         var rock:MovieClip = param1.target as MovieClip;
         ToolTipManager.remove(rock);
         rock.removeEventListener(MouseEvent.CLICK,onRockClick);
         index = uint(rock.name.split("_")[1]) - 1;
         if(Boolean(_rockStatus[index]))
         {
            AnimateManager.playMcAnimate(rock,3,"mc_3",function():void
            {
               ToolTipManager.add(rock,"该伊");
               rock.addEventListener(MouseEvent.CLICK,onFightBoss);
            });
         }
         else
         {
            AnimateManager.playMcAnimate(rock,2,"mc_2",function():void
            {
            });
         }
      }
      
      private static function onFightBoss(param1:MouseEvent) : void
      {
         FightManager.fightWithBoss("该伊",0);
      }
      
      public static function destroy() : void
      {
         if(_rock1)
         {
            _rock1.removeEventListener(MouseEvent.CLICK,onRockClick);
            _rock1.removeEventListener(MouseEvent.CLICK,onFightBoss);
            ToolTipManager.remove(_rock1);
         }
         if(_rock2)
         {
            _rock2.removeEventListener(MouseEvent.CLICK,onRockClick);
            _rock2.removeEventListener(MouseEvent.CLICK,onFightBoss);
            ToolTipManager.remove(_rock2);
         }
         if(_rock3)
         {
            _rock3.removeEventListener(MouseEvent.CLICK,onRockClick);
            _rock3.removeEventListener(MouseEvent.CLICK,onFightBoss);
            ToolTipManager.remove(_rock3);
         }
         _rock1 = null;
         _rock2 = null;
         _rock3 = null;
         _rockStatus = null;
      }
   }
}

