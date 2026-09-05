package aero
{
   import com.ming.managers.utils.HitTest.HitTest;
   import element.Elements;
   
   public class Aero extends Elements
   {
      
      public var crtSpeed:Number = 0;
      
      public var targetsArr:Array = [];
      
      public var excursion:Number;
      
      public var friendsArr:Array = [];
      
      protected var tmpxSpeed:Number = 0;
      
      protected var tmpySpeed:Number = 0;
      
      public var accelerate:Number;
      
      public var hitTestable:Boolean = true;
      
      public function Aero()
      {
         super();
      }
      
      protected function hitTest() : void
      {
         var elt:Elements = null;
         var type:uint = 0;
         if(!hitTestable)
         {
            return;
         }
         for(var i:uint = 0; i < targetsArr.length; i++)
         {
            elt = targetsArr[i] as Elements;
            if(HitTest.hitTestShape(elt,this))
            {
               if(elt.hurtable)
               {
                  for each(type in elt.destroyTypeArr)
                  {
                     if(type == this.hurtEnemyType)
                     {
                        elt.hp -= this.execution;
                        if(elt is Aircraft)
                        {
                           (elt as Aircraft).changeStatus();
                        }
                        this.erasable = true;
                        this.explodeable = true;
                     }
                  }
               }
               if(elt.hp <= 0)
               {
                  hitTestable = false;
                  killer = this;
                  elt.erasable = true;
                  elt.explodeable = true;
               }
            }
         }
      }
      
      public function creatProtector() : void
      {
      }
      
      override protected function move() : void
      {
         this.y += stageSpeed;
      }
   }
}

