package _1011_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol185")]
   public dynamic class Timeline_3 extends MovieClip
   {
      
      public var effect:MovieClip;
      
      public var btn_1:SimpleButton;
      
      public var btn_2:SimpleButton;
      
      public var btn_3:SimpleButton;
      
      public function Timeline_3()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.effect.mouseEnabled = this.effect.mouseChildren = false;
      }
   }
}

