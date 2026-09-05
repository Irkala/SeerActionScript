package _1301_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1040")]
   public dynamic class Timeline_100 extends MovieClip
   {
      
      public var fishingBtn:SimpleButton;
      
      public var petMc:MovieClip;
      
      public var mc:MovieClip;
      
      public function Timeline_100()
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

