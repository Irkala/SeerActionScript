package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import flash.display.MovieClip;
   
   public class MovieClipObject
   {
      
      protected var _main:GameContainer;
      
      public var _mc:MovieClip;
      
      public function MovieClipObject(p_main:GameContainer)
      {
         super();
         this._main = p_main;
      }
      
      public function EnterFrame() : void
      {
      }
   }
}

