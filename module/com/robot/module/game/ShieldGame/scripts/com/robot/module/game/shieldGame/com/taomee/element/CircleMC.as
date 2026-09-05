package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   
   public class CircleMC extends MovieClipObject
   {
      
      public var life:uint = 8;
      
      public function CircleMC(p_main:GameContainer, x:Number, y:Number)
      {
         trace(x + "\t**\t" + y);
         super(p_main);
         this._mc = this._main.swfLib.getMC("circle",new circle());
         this._mc.x = x;
         this._mc.y = y;
         this._main.circleLayer.addChild(this._mc);
      }
      
      override public function EnterFrame() : void
      {
      }
      
      public function die(destroy:Boolean = false) : uint
      {
         var j:* = undefined;
         var i:* = undefined;
         if(destroy)
         {
            if(!this._main.isPauseMuisc)
            {
               this._main.deSound.play(0,0);
            }
            this._main.circleLayer.removeChild(this._mc);
            for(j in this._main.circleList)
            {
               if(this._main.circleList[j] == this)
               {
                  this._main.circleList[j] = this._main.circleList[this._main.circleList.length - 1];
                  this._main.circleList.pop();
               }
            }
            return life;
         }
         --life;
         if(life <= 0)
         {
            if(!this._main.isPauseMuisc)
            {
               this._main.deSound.play(0,0);
            }
            this._main.circleLayer.removeChild(this._mc);
            for(i in this._main.circleList)
            {
               if(this._main.circleList[i] == this)
               {
                  this._main.circleList[i] = this._main.circleList[this._main.circleList.length - 1];
                  this._main.circleList.pop();
               }
            }
         }
         else
         {
            this._mc.scaleX -= 0.08;
            this._mc.scaleY -= 0.08;
            if(!this._main.isPauseMuisc)
            {
               this._main.ceSound.play(0,0);
            }
         }
         return life;
      }
   }
}

