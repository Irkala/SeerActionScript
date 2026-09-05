package com.robot.app.fight
{
   import com.robot.core.net.SocketConnection;
   
   public class FightManager
   {
      
      public function FightManager()
      {
         super();
      }
      
      public static function fightWithBoss(name:String, region:uint = 0, ... rest) : void
      {
         SocketConnection.send(2411,region);
      }
   }
}

