package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol89")]
   public dynamic class LadderFightPanel extends MovieClip
   {
      
      public var goOnBtn:SimpleButton;
      
      public var sideBar:UI_ListPanel;
      
      public var viewRecord:SimpleButton;
      
      public var myLevel:MovieClip;
      
      public var recordMC:MovieClip;
      
      public var txtBestLevel:TextField;
      
      public var startFightBtn:SimpleButton;
      
      public var closeBtn:SimpleButton;
      
      public function LadderFightPanel()
      {
         super();
      }
   }
}

