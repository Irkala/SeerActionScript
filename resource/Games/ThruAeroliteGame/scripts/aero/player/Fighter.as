package aero.player
{
   import aero.Aircraft;
   import com.ming.managers.utils.keyBoard.KeySets;
   import com.ming.managers.utils.keyBoard.PopKeys;
   import explodes.Explode;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.utils.setTimeout;
   import sounds.GameSounds;
   import weapons.WeaponType;
   import weapons.bullets.BlueBullet;
   import weapons.bullets.Bullet;
   import weapons.bullets.RedBullet;
   
   public class Fighter extends Aircraft
   {
      
      private var _bDown:Boolean = false;
      
      private var _vspeed:Number;
      
      private var _hspeed:Number;
      
      private var _inc:uint;
      
      public function Fighter()
      {
         super();
         bulletType = WeaponType.BlueBullet;
         rocketType = WeaponType.RedBullet;
         explodeType = Explode.Burst_EXPLODE;
         this.fireable = true;
         speed = 0;
         this.hp = 3;
         this.destroyTypeArr = [0,1];
         this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
      }
      
      private function onAddToStage(evt:Event) : void
      {
         if(this.stage)
         {
            this.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
            this.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         }
      }
      
      private function onKeyDown(evt:KeyboardEvent) : void
      {
         fire();
      }
      
      override protected function onEntFrame(evt:Event) : void
      {
         move();
      }
      
      override public function changeStatus() : void
      {
         if(mc)
         {
            mc.gotoAndStop(2);
            setTimeout(function():void
            {
               mc.gotoAndStop(1);
            },1000);
         }
      }
      
      override protected function move() : void
      {
         if(!PopKeys.isDown(KeySets.LEFT) && !PopKeys.isDown(KeySets.RIGHT))
         {
         }
         if(PopKeys.isDown(KeySets.LEFT))
         {
            this.x -= 8;
         }
         if(PopKeys.isDown(KeySets.RIGHT))
         {
            this.x += 8;
         }
         if(PopKeys.isDown(KeySets.UP))
         {
            this.y -= 8;
         }
         if(PopKeys.isDown(KeySets.DOWN))
         {
            this.y += 8;
         }
         if(this.x < moverange[0] + this.width / 2)
         {
            this.x = moverange[0] + this.width / 2;
         }
         if(this.x > moverange[1] - this.width / 2)
         {
            this.x = moverange[1] - this.width / 2;
         }
         if(this.y < moverange[2])
         {
            this.y = moverange[2];
         }
         if(this.y > moverange[3] - this.height)
         {
            this.y = moverange[3] - this.height;
         }
      }
      
      private function shootRed() : void
      {
         var rbt:Bullet = new RedBullet();
         rbt.targetsArr = this.targetsArr;
         rbt.sender = this;
         this.bulletLayer.addChild(rbt);
         rbt.x = this.x;
         rbt.y = this.y;
         GameSounds.shootSound.play();
      }
      
      override public function fire() : void
      {
         if(!this.fireable)
         {
            return;
         }
         if(_bDown)
         {
            return;
         }
         if(PopKeys.isDown(KeySets.FIRE_BLUE))
         {
            shootBlue();
         }
         else if(PopKeys.isDown(KeySets.FIRE_RED))
         {
            shootRed();
         }
         _bDown = true;
      }
      
      private function shootBlue() : void
      {
         var bbt:Bullet = new BlueBullet();
         bbt.targetsArr = this.targetsArr;
         bbt.sender = this;
         this.bulletLayer.addChild(bbt);
         bbt.x = this.x;
         bbt.y = this.y;
         GameSounds.shootSound.play();
      }
      
      override public function getMC() : MovieClip
      {
         mc = new FighterMC();
         mc.gotoAndStop(1);
         return mc;
      }
      
      private function onKeyUp(evt:KeyboardEvent) : void
      {
         _bDown = false;
      }
   }
}

