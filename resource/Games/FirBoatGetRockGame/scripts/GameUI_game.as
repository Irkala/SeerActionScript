package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol111")]
   public dynamic class GameUI_game extends MovieClip
   {
      
      public var body:MovieClip;
      
      public var close_btn:SimpleButton;
      
      public var life_mc:MovieClip;
      
      public var help_mc:MovieClip;
      
      public var time_txt:TextField;
      
      public function GameUI_game()
      {
         super();
      }
   }
}

