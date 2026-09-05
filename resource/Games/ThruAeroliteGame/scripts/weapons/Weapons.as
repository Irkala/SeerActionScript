package weapons
{
   import aero.Aero;
   import aero.Aircraft;
   import com.ming.managers.utils.HitTest.HitTest;
   import com.ming.managers.utils.move.Moving;
   import element.Elements;
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class Weapons extends Elements
   {
      
      protected var crtSpeed:Number = 0;
      
      public var targetsArr:Array = [];
      
      protected var bRebound:Boolean = false;
      
      public var sender:Elements;
      
      protected var hitTestable:Boolean = true;
      
      public function Weapons()
      {
         super();
         speed = 0;
         execution = 1;
      }
      
      override protected function onEntFrame(evt:Event) : void
      {
         if(isInRange())
         {
            move();
            hitTest();
         }
      }
      
      protected function rebound(elt:Elements) : void
      {
         var angle:Number = Math.atan2(elt.y - this.y,elt.x - this.x);
         Moving.moveBeelline(this,speed,angle * 180 / Math.PI);
      }
      
      protected function hitTest() : void
      {
         var elt:Elements = null;
         if(!hitTestable)
         {
            return;
         }
         for(var i:uint = 0; i < targetsArr.length; i++)
         {
            elt = targetsArr[i] as Elements;
            if(HitTest.hitTestShape(this,elt))
            {
               hitTestable = false;
               if(elt.hurtable)
               {
                  if(elt is Aircraft)
                  {
                     (elt as Aircraft).changeStatus();
                  }
                  elt.killer = this.sender as Elements;
                  if(isHurtEnemy(elt))
                  {
                     elt.hp -= this.execution;
                     this.sender = null;
                     this.killer = elt;
                     this.explodeable = true;
                     this.erasable = true;
                  }
                  else
                  {
                     bRebound = true;
                     rebound(elt);
                     if(elt is Aero)
                     {
                        (elt as Aero).creatProtector();
                     }
                  }
                  if(elt.hp <= 0)
                  {
                     GameSounds.uintExplodeSound.play();
                  }
               }
            }
         }
      }
      
      protected function isHurtEnemy(elt:Elements) : Boolean
      {
         var type:uint = 0;
         for each(type in elt.destroyTypeArr)
         {
            if(type == this.hurtEnemyType)
            {
               return true;
            }
         }
         return false;
      }
   }
}

