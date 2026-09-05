package com.robot.core.cmd
{
   import com.robot.core.CommandID;
   import com.robot.core.event.PeopleActionEvent;
   import com.robot.core.info.pet.PetShowInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.manager.UserManager;
   import com.robot.core.manager.bean.BaseBeanController;
   import com.robot.core.net.SocketConnection;
   import org.taomee.events.SocketEvent;
   
   public class PetCmdListener extends BaseBeanController
   {
      
      public function PetCmdListener()
      {
         super();
      }
      
      override public function start() : void
      {
         SocketConnection.addCmdListener(CommandID.PET_SHOW,this.onPetShow);
         finish();
      }
      
      private function onPetShow(param1:SocketEvent) : void
      {
         var _loc2_:PetShowInfo = param1.data as PetShowInfo;
         if(_loc2_.flag == 1)
         {
            UserManager.dispatchAction(_loc2_.userID,PeopleActionEvent.PET_SHOW,_loc2_);
            if(_loc2_.userID == MainManager.actorID && PetManager.showInfo != null && PetManager.showInfo.catchTime == _loc2_.catchTime)
            {
               PetManager.showInfo.shiny = _loc2_.shiny;
            }
         }
         else
         {
            UserManager.dispatchAction(_loc2_.userID,PeopleActionEvent.PET_HIDE,_loc2_);
         }
      }
   }
}

