package _703_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol273")]
   public dynamic class Timeline_10 extends MovieClip
   {
      
      public var wall_0:MovieClip;
      
      public var stone_0:MovieClip;
      
      public var wall_1:MovieClip;
      
      public var stone_1:MovieClip;
      
      public var ore_0:MovieClip;
      
      public var stone_2:MovieClip;
      
      public var ore_1:MovieClip;
      
      public var stone_3:MovieClip;
      
      public var shape:MovieClip;
      
      public var wall_hit_1:MovieClip;
      
      public var wall_hit_0:MovieClip;
      
      public var bossHit:MovieClip;
      
      public var boss:MovieClip;
      
      public var word:MovieClip;
      
      public var ore_hit_0:MovieClip;
      
      public var ore_hit_1:MovieClip;
      
      public function Timeline_10()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         shape.mouseEnabled = false;
         shape.mouseChildren = false;
      }
   }
}

