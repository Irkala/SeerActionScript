package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol360")]
   public dynamic class ui_PetUpdateSkillPanel extends MovieClip
   {
      
      public var name_txt:TextField;
      
      public var okBtn:SimpleButton;
      
      public var skillMC:MovieClip;
      
      public function ui_PetUpdateSkillPanel()
      {
         super();
      }
   }
}

