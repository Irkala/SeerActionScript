package §5_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol596")]
   public dynamic class Timeline_187 extends MovieClip
   {
      
      public var newMonsterMC:MovieClip;
      
      public var npcHit:MovieClip;
      
      public function Timeline_187()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         newMonsterMC.mouseChildren = false;
         newMonsterMC.mouseEnabled = false;
      }
   }
}

