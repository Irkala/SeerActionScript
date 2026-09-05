package _697_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol421")]
   public dynamic class Timeline_28 extends MovieClip
   {
      
      public var task846mc:MovieClip;
      
      public var ad:SimpleButton;
      
      public var door:MovieClip;
      
      public var guide1:MovieClip;
      
      public var guide2:MovieClip;
      
      public var guide3:MovieClip;
      
      public var flower1:MovieClip;
      
      public var flower2:MovieClip;
      
      public var board:SimpleButton;
      
      public var flower3:MovieClip;
      
      public var task846mc2:MovieClip;
      
      public var hit:MovieClip;
      
      public function Timeline_28()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         task846mc.buttonMode = flower1.buttonMode = flower2.buttonMode = flower3.buttonMode = true;
         guide1.visible = guide2.visible = guide3.visible = false;
         flower1.mouseChildren = flower2.mouseChildren = flower3.mouseChildren = false;
      }
   }
}

