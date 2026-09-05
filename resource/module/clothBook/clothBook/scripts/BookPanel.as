package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol464")]
   public dynamic class BookPanel extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public var buyPanel:MovieClip;
      
      public function BookPanel()
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

