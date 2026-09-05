package §101_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol203")]
   public dynamic class Timeline_67 extends MovieClip
   {
      
      public var deskMC:MovieClip;
      
      public function Timeline_67()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         deskMC.mouseEnabled = false;
         deskMC.mouseChildren = false;
      }
   }
}

