package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.plantsVsZombies.enemy.*;
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.ob.levelEnemyControl.*;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.getDefinitionByName;
   import org.taomee.ds.HashMap;
   
   public class EnemyManager extends GameObserver implements IGameObserver
   {
      
      private static var instance:EventDispatcher;
      
      public static var map:HashMap = new HashMap();
      
      private var con:IEnemyController;
      
      private var conArray:Array = [CON_1,CON_2,CON_3,CON_4,CON_5,CON_6,CON_7,CON_8,CON_9,CON_10];
      
      public function EnemyManager(s:GameSubject)
      {
         super(s);
      }
      
      public static function dispatchEvent(event:Event) : void
      {
         getInstance().dispatchEvent(event);
      }
      
      public static function remove(num:uint, enemy:BaseEnemy) : void
      {
         var array:Array = map.getValue(num);
         var index:int = array.indexOf(enemy);
         if(index != -1)
         {
            array.splice(index,1);
         }
         dispatchEvent(new EnemyEvent(EnemyEvent.ENEMY_CLEARD,num,enemy));
      }
      
      public static function willTrigger(type:String) : Boolean
      {
         return getInstance().willTrigger(type);
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         getInstance().removeEventListener(type,listener,useCapture);
      }
      
      private static function getInstance() : EventDispatcher
      {
         if(instance == null)
         {
            instance = new EventDispatcher();
         }
         return instance;
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         getInstance().addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function getList(num:uint) : Array
      {
         if(!map)
         {
            return null;
         }
         return map.getValue(num);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return getInstance().hasEventListener(type);
      }
      
      private function onLost(event:EnemyEvent) : void
      {
         trace("输了");
         PlantsResultManager.lost();
      }
      
      override public function gameOver() : void
      {
         var i:Array = null;
         var arr2:Array = null;
         var j:BaseEnemy = null;
         var arr:Array = map.getValues().slice();
         for each(i in arr)
         {
            arr2 = i.slice();
            for each(j in arr2)
            {
               j.destroy();
            }
         }
         map.clear();
         con.stop();
         con.removeEventListener(EnemyEvent.CREATE_COMPLETE,onCreateComp);
      }
      
      private function onCreated(event:EnemyEvent) : void
      {
         subject.container.addChild(event.enemy.sprite);
      }
      
      private function onCreateComp(event:EnemyEvent) : void
      {
         EnemyManager.addEventListener(EnemyEvent.ENEMY_CLEARD,onCleared);
      }
      
      override public function setup() : void
      {
         map = new HashMap();
         con = new CON_1();
         con.addEventListener(EnemyEvent.CREATE_COMPLETE,onCreateComp);
         con.setup();
      }
      
      private function onCleared(event:EnemyEvent) : void
      {
         var i:Array = null;
         var b:Boolean = true;
         var arr:Array = map.getValues().slice();
         for each(i in arr)
         {
            if(i.length > 0)
            {
               b = false;
               break;
            }
         }
         if(b)
         {
            trace("过关");
            PlantsResultManager.win();
         }
      }
      
      override public function gameStart() : void
      {
         con.start();
         EnemyManager.addEventListener(EnemyEvent.ENEMY_CREATED,onCreated);
         EnemyManager.addEventListener(EnemyEvent.LOST,onLost);
      }
      
      override public function nextLevel() : void
      {
         var i:Array = null;
         var arr2:Array = null;
         var j:BaseEnemy = null;
         var arr:Array = map.getValues().slice();
         for each(i in arr)
         {
            arr2 = i.slice();
            for each(j in arr2)
            {
               j.destroy();
            }
         }
         map.clear();
         con.destroy();
         con.removeEventListener(EnemyEvent.CREATE_COMPLETE,onCreateComp);
         if(PlantsLevelManager.level > conArray.length - 1)
         {
            con = new conArray[conArray.length - 1]();
         }
         else
         {
            con = new conArray[PlantsLevelManager.level]();
         }
         con.addEventListener(EnemyEvent.CREATE_COMPLETE,onCreateComp);
         con.setup();
         con.start();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         EnemyManager.removeEventListener(EnemyEvent.ENEMY_CLEARD,onCleared);
         EnemyManager.removeEventListener(EnemyEvent.ENEMY_CREATED,onCreated);
         EnemyManager.removeEventListener(EnemyEvent.LOST,onLost);
         con.destroy();
         con = null;
         map = null;
      }
   }
}

