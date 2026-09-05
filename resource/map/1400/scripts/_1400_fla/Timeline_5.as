package _1400_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol54")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var ani:MovieClip;
      
      public var btn_1:SimpleButton;
      
      public function Timeline_5()
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

