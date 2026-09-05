package _1706_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol239")]
   public dynamic class Timeline_92 extends MovieClip
   {
      
      public var showBtn:SimpleButton;
      
      public var hideBtn:SimpleButton;
      
      public function Timeline_92()
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

