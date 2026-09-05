package §5_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol280")]
   public dynamic class Timeline_3 extends MovieClip
   {
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public function Timeline_3()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

