package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol210")]
   public dynamic class plants_win_panel extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public function plants_win_panel()
      {
         super();
         addFrameScript(9,this.frame10);
      }
      
      internal function frame10() : *
      {
         stop();
      }
   }
}

