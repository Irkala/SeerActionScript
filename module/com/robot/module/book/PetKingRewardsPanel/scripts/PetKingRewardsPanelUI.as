package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol256")]
   public dynamic class PetKingRewardsPanelUI extends MovieClip
   {
      
      public var exchangeBtn:SimpleButton;
      
      public var closeBtn:SimpleButton;
      
      public var prevBtn:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public var mc:MovieClip;
      
      public function PetKingRewardsPanelUI()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         stop();
      }
   }
}

