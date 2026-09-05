package _453_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol249")]
   public dynamic class Timeline_81 extends MovieClip
   {
      
      public var downBTN:MovieClip;
      
      public var leftBTN:MovieClip;
      
      public var rightBTN:MovieClip;
      
      public var mainMC:MovieClip;
      
      public var upBTN:MovieClip;
      
      public var closeBTN:SimpleButton;
      
      public function Timeline_81()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         this.visible = false;
         stop();
      }
   }
}

