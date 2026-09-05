package _690_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol430")]
   public dynamic class Timeline_160 extends MovieClip
   {
      
      public var roadMask:MovieClip;
      
      public function Timeline_160()
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

