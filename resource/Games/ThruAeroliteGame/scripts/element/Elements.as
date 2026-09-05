package element
{
   import explodes.Explode;
   import interfaces.ILife;
   
   public class Elements extends BasicElement implements ILife
   {
      
      public var max_hp:Number = 500;
      
      public var killer:Elements;
      
      protected var hurtEnemyType:uint;
      
      public var execution:Number = 0;
      
      protected var _score:Number = 0;
      
      public var vstate:int;
      
      protected var _hp:Number;
      
      public var hurtable:Boolean;
      
      public var destroyTypeArr:Array;
      
      public var hstate:int;
      
      public function Elements()
      {
         super();
         _hp = max_hp;
         moveable = true;
         hurtable = true;
         explodeType = Explode.Unit_EXPLODE;
      }
      
      public function get hp() : Number
      {
         return _hp;
      }
      
      public function set hp(value:Number) : void
      {
         _hp = value;
         life();
      }
      
      public function set score(value:Number) : void
      {
         _score = value;
      }
      
      public function get score() : Number
      {
         return _score;
      }
      
      public function life() : void
      {
         if(_hp <= 0)
         {
            explodeable = true;
            erasable = true;
         }
         if(_hp > max_hp)
         {
            _hp = max_hp;
         }
      }
   }
}

