package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import com.robot.module.game.shieldGame.com.taomee.event.GameStateEvent;
   import flash.display.MovieClip;
   
   public class TimerMC extends MovieClipObject
   {
      
      private var intime:uint = 120;
      
      private var timer:MovieClip;
      
      private var timerCount:uint = 0;
      
      public function TimerMC(p_main:GameContainer, x:Number, y:Number)
      {
         super(p_main);
         this._mc = this._main.swfLib.getMC("timecontrol",new timecontrol());
         this._mc.x = x;
         this._mc.y = y;
         this._main.houseLayer.addChild(this._mc);
         timer = this._mc.timer;
      }
      
      override public function EnterFrame() : void
      {
         ++timerCount;
         if(timerCount % 24 == 0)
         {
            --intime;
            timer.time_txt.text = String(intime);
            if(intime <= 0)
            {
               this._main.houseLayer.removeChild(this._mc);
            }
         }
         if(intime <= 0)
         {
            this._main.gameover();
            this._main.dispatchEvent(new GameStateEvent("GAMEFINISH",this._main.gameState(),this._main.gameState() * 10));
         }
      }
   }
}

