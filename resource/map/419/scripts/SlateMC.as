package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol17")]
   public dynamic class SlateMC extends MovieClip
   {
      
      public var closeBtn:SimpleButton;
      
      public function SlateMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

