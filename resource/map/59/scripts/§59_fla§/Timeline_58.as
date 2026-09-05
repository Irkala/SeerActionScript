package §59_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol155")]
   public dynamic class Timeline_58 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public function Timeline_58()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         mc1.visible = false;
         mc1.gotoAndStop(1);
      }
   }
}

