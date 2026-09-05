package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol146")]
   public dynamic class GroupTeamBook_Mc extends MovieClip
   {
      
      public var leftBtn:SimpleButton;
      
      public var rightBtn:SimpleButton;
      
      public var goMapBtn:SimpleButton;
      
      public var closeBtn:SimpleButton;
      
      public function GroupTeamBook_Mc()
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

