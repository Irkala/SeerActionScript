package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol116")]
   public dynamic class GameOverPanel extends MovieClip
   {
      
      public var overConfirmBtn:SimpleButton;
      
      public var tryAgainBtn:SimpleButton;
      
      public function GameOverPanel()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.tryAgainBtn.visible = false;
      }
   }
}

