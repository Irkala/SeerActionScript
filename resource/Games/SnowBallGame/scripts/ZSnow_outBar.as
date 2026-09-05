package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class ZSnow_outBar extends MovieClip
   {
      
      public var quit_btn:SimpleButton;
      
      public var no_btn:SimpleButton;
      
      public function ZSnow_outBar()
      {
         super();
         addFrameScript(13,this.frame14);
      }
      
      internal function frame14() : *
      {
         stop();
      }
   }
}

