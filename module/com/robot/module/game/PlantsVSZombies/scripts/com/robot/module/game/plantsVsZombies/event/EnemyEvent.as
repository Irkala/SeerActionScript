package com.robot.module.game.plantsVsZombies.event
{
   import com.robot.module.game.plantsVsZombies.enemy.BaseEnemy;
   import flash.events.Event;
   
   public class EnemyEvent extends Event
   {
      
      public static const ENEMY_CREATED:String = "ghostCreated";
      
      public static const ENEMY_CLEARD:String = "ghostCleared";
      
      public static const GRID_CHANGE:String = "gridChange";
      
      public static const CREATE_COMPLETE:String = "createComplete";
      
      public static const LOST:String = "lost";
      
      private var _enemy:BaseEnemy;
      
      private var _row:uint;
      
      public function EnemyEvent(type:String, row:uint = 0, enemy:BaseEnemy = null, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this._row = row;
         this._enemy = enemy;
      }
      
      public function get enemy() : BaseEnemy
      {
         return _enemy;
      }
      
      public function get row() : uint
      {
         return _row;
      }
   }
}

