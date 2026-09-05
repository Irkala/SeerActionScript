package _692_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol192")]
   public dynamic class Timeline_56 extends MovieClip
   {
      
      public var top:MovieClip;
      
      public function Timeline_56()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         top.mouseEnabled = false;
         top.mouseChildren = false;
      }
   }
}

