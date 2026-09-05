package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol5781")]
   public dynamic class ui_MapNamePanel extends MovieClip
   {
      
      public var mv1:MovieClip;
      
      public var mv:MovieClip;
      
      public var conMc:MovieClip;
      
      public var exp:MovieClip;
      
      public var nameTxt:TextField;
      
      public var arrow:MovieClip;
      
      public function ui_MapNamePanel()
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

