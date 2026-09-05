package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class PauseUI extends MovieClipObject
   {
      
      private var reStartBtn:SimpleButton;
      
      public function PauseUI(p_main:GameContainer, xx:Number, yy:Number)
      {
         super(p_main);
         this._mc = this._main.swfLib.getMC("toolbar",new pauseview());
         this._mc.x = xx;
         this._mc.y = yy;
         this._main.pauseLayer.addChild(this._mc);
         reStartBtn = this._mc.restartbtn;
         reStartBtn.addEventListener(MouseEvent.MOUSE_UP,reStartHandler);
      }
      
      private function reStartHandler(e:MouseEvent) : void
      {
         this._main.reStartGame();
         die();
      }
      
      public function die() : void
      {
         reStartBtn.removeEventListener(MouseEvent.CLICK,reStartHandler);
         this._main.pauseUI = null;
         this._main.pauseLayer.removeChild(this._mc);
      }
   }
}

