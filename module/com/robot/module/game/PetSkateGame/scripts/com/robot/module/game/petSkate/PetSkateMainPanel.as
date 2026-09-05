package com.robot.module.game.petSkate
{
   import com.robot.module.game.petSkate.observer.BgObserver;
   import com.robot.module.game.petSkate.observer.EnergyController;
   import com.robot.module.game.petSkate.observer.GridObserver;
   import com.robot.module.game.petSkate.observer.LevelObserver;
   import com.robot.module.game.petSkate.observer.PlayerObserver;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.ds.HashMap;
   import org.taomee.utils.DisplayUtil;
   
   public class PetSkateMainPanel extends Sprite
   {
      
      public static const GAME_CLOSE:String = "gameClose";
      
      private static var map:HashMap = new HashMap();
      
      private var gridObs:GridObserver;
      
      private var bgObs:BgObserver;
      
      private var playerObs:PlayerObserver;
      
      private var startBtn:SimpleButton;
      
      private var subject:BaseGameSubject;
      
      private var quitBtn:SimpleButton;
      
      private var startMC:MovieClip;
      
      private var levelObs:LevelObserver;
      
      public function PetSkateMainPanel()
      {
         super();
         startMC = new petSkate_start_mc();
         startBtn = startMC["startBtn"];
         quitBtn = startMC["quitBtn"];
         startBtn.addEventListener(MouseEvent.CLICK,startHandler);
         quitBtn.addEventListener(MouseEvent.CLICK,quitHandler);
      }
      
      public static function getObserver(key:String) : IGameObserver
      {
         return map.getValue(key);
      }
      
      private function startHandler(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(startMC);
         levelObs = new LevelObserver(subject);
         map.add("LevelObserver",levelObs);
         playerObs = new PlayerObserver(subject);
         map.add("PlayerObserver",playerObs);
         gridObs = new GridObserver(subject);
         map.add("GridObserver",gridObs);
         subject.gameStart();
      }
      
      private function quitHandler(event:MouseEvent) : void
      {
         dispatchEvent(new Event(GAME_CLOSE));
      }
      
      public function hide() : void
      {
         subject.destroy();
         map.clear();
         bgObs = null;
         gridObs = null;
         playerObs = null;
         levelObs = null;
         EnergyController.reset();
         DisplayUtil.removeForParent(startMC);
      }
      
      public function destroy() : void
      {
         hide();
         map = null;
      }
      
      public function show() : void
      {
         subject = new BaseGameSubject(this);
         bgObs = new BgObserver(subject);
         map.add("BgObserver",bgObs);
         addChild(startMC);
      }
   }
}

