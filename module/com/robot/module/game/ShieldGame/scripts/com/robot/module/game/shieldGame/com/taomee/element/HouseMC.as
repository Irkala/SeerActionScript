package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import flash.display.MovieClip;
   
   public class HouseMC extends MovieClipObject
   {
      
      public function HouseMC(p_main:GameContainer, x:Number, y:Number)
      {
         super(p_main);
         this._mc = this._main.swfLib.getMC("house",new house()) as MovieClip;
         this._mc.x = x;
         this._mc.y = y;
         this._main.houseLayer.addChild(this._mc);
         trace(this._main.houseLayer.x);
         trace(this._main.houseLayer.y);
         trace(this._main.houseLayer.width);
         trace(this._main.houseLayer.height);
      }
      
      public function die() : void
      {
         var i:* = undefined;
         if(!this._main.isPauseMuisc)
         {
            this._main.deSound.play(0,0);
         }
         this._main.houseLayer.removeChild(this._mc);
         for(i in this._main.houseList)
         {
            if(this._main.houseList[i] == this)
            {
               this._main.houseList[i] = this._main.houseList[this._main.houseList.length - 1];
               this._main.houseList.pop();
            }
         }
      }
      
      override public function EnterFrame() : void
      {
      }
   }
}

