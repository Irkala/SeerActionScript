package _690_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol441")]
   public dynamic class Timeline_162 extends MovieClip
   {
      
      public var top:MovieClip;
      
      public function Timeline_162()
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

