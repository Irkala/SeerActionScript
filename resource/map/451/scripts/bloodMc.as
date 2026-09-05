package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol9")]
   public dynamic class bloodMc extends MovieClip
   {
      
      public var perTxt:TextField;
      
      public var perMc:MovieClip;
      
      public function bloodMc()
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

