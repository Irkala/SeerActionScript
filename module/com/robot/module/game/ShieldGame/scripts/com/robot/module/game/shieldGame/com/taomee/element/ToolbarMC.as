package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import com.robot.module.game.shieldGame.com.taomee.event.GameStateEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   
   public class ToolbarMC extends MovieClipObject
   {
      
      private var soundMC:MovieClip;
      
      private var scoreMC:MovieClip;
      
      private var pauseMC:MovieClip;
      
      private var closeMC:SimpleButton;
      
      private var color_red:ColorTransform = new ColorTransform(2,-2,-2,1,255,-255,-255,0);
      
      private var color_blue:ColorTransform = new ColorTransform(2,-2,-2,1,-255,-255,255,0);
      
      private var color_yellow:ColorTransform = new ColorTransform(2,-2,-2,1,255,255,-255,0);
      
      public function ToolbarMC(p_main:GameContainer, x:Number, y:Number)
      {
         super(p_main);
         this._mc = this._main.swfLib.getMC("toolbar",new toolbar());
         this._mc.x = x;
         this._mc.y = y;
         this._main.houseLayer.addChild(this._mc);
         scoreMC = this._mc.scoremc;
         soundMC = this._mc.soundbtn;
         soundMC.addEventListener(MouseEvent.CLICK,onSoundClickHandler);
         pauseMC = this._mc.pausebtn;
         pauseMC.addEventListener(MouseEvent.CLICK,onPauseClickHandler);
         closeMC = this._mc.closebtn;
         closeMC.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
      
      override public function EnterFrame() : void
      {
         if(this._main.power < 1000)
         {
            this._main.power += 2;
         }
         this._mc.gage.scaleX = this._main.power / 1000;
         if(this._main.power < 120)
         {
            this._mc.gage.transform.colorTransform = color_red;
         }
         else if(this._main.power < 600)
         {
            this._mc.gage.transform.colorTransform = color_yellow;
         }
         else
         {
            this._mc.gage.transform.colorTransform = color_blue;
         }
         var my_score:uint = this._main.my_score;
         for(var i:uint = 1; i <= 6; i++)
         {
            if(i <= int(String(my_score).length))
            {
               scoreMC["w" + i].gotoAndStop(int(String(my_score).substr(i * -1,1)) + 1);
            }
         }
      }
      
      public function setPauseBtnState() : void
      {
         pauseMC.gotoAndStop(1);
      }
      
      private function onSoundClickHandler(event:MouseEvent) : void
      {
         trace("soundclick");
         if(this._main.isPauseMuisc)
         {
            soundMC.gotoAndStop(1);
            this._main.playMusic();
         }
         else
         {
            soundMC.gotoAndStop(2);
            this._main.pauseMusic();
         }
      }
      
      private function onPauseClickHandler(event:MouseEvent) : void
      {
         if(this._main.isPause)
         {
            pauseMC.gotoAndStop(1);
            this._main.reStartGame();
            if(this._main.pauseUI)
            {
               this._main.pauseUI.die();
            }
         }
         else
         {
            pauseMC.gotoAndStop(2);
            this._main.pauseGame();
            if(!this._main.pauseUI)
            {
               this._main.createPauseUI();
            }
         }
         trace("pauseclick");
      }
      
      private function onCloseClickHandler(event:MouseEvent) : void
      {
         trace("closeclick");
         this._main.gameover();
         this._main.dispatchEvent(new GameStateEvent("GAMECLOSE",0,0));
      }
   }
}

