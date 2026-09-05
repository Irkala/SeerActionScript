package _694_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol206")]
   public dynamic class Timeline_78 extends MovieClip
   {
      
      public function Timeline_78()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.parent.visible = false;
      }
   }
}

