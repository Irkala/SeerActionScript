package _10055_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol424")]
   public dynamic class Timeline_77 extends MovieClip
   {
      
      public var icon_1:MovieClip;
      
      public var icon_2:MovieClip;
      
      public var exit:SimpleButton;
      
      public var bg:MovieClip;
      
      public var light:MovieClip;
      
      public var result_2:MovieClip;
      
      public var result_1:MovieClip;
      
      public var bag:SimpleButton;
      
      public function Timeline_77()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         light.mouseEnabled = false;
         light.mouseChildren = false;
      }
   }
}

