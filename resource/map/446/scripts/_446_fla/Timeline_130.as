package _446_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol325")]
   public dynamic class Timeline_130 extends MovieClip
   {
      
      public var gamePanel:MovieClip;
      
      public function Timeline_130()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         gamePanel.visible = false;
      }
   }
}

