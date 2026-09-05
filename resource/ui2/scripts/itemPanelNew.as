package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol5439")]
   public dynamic class itemPanelNew extends MovieClip
   {
      
      public var count:MovieClip;
      
      public var mc:MovieClip;
      
      public function itemPanelNew()
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

