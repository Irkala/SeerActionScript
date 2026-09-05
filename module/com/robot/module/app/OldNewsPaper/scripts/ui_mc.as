package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol15")]
   public dynamic class ui_mc extends MovieClip
   {
      
      public var num_txt:TextField;
      
      public function ui_mc()
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

