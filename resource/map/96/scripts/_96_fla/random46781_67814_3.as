package _96_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol18")]
   public dynamic class random46781_67814_3 extends MovieClip
   {
      
      public var npc:MovieClip;
      
      public var door:MovieClip;
      
      public var hit:MovieClip;
      
      public var wall:MovieClip;
      
      public function random46781_67814_3()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.wall.mouseEnabled = false;
         this.wall.mouseChildren = false;
      }
   }
}

