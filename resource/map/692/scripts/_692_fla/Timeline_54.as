package _692_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol175")]
   public dynamic class Timeline_54 extends MovieClip
   {
      
      public var stone1:MovieClip;
      
      public function Timeline_54()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stone1.mouseEnabled = false;
         stone1.visible = false;
      }
   }
}

