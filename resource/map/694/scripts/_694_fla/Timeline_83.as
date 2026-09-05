package _694_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol219")]
   public dynamic class Timeline_83 extends MovieClip
   {
      
      public var roadMask:MovieClip;
      
      public function Timeline_83()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         roadMask.mouseEnabled = false;
         roadMask.visible = false;
      }
   }
}

