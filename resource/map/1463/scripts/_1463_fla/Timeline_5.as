package _1463_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var ani:MovieClip;
      
      public var btn_1:SimpleButton;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(1,frame2);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

