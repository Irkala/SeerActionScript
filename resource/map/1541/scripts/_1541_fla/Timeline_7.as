package _1541_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol59")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var flower_anim:MovieClip;
      
      public var flower_btn:SimpleButton;
      
      public function Timeline_7()
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

