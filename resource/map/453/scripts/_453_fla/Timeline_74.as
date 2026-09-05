package _453_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol250")]
   public dynamic class Timeline_74 extends MovieClip
   {
      
      public var gamePanel:MovieClip;
      
      public var backBig:MovieClip;
      
      public function Timeline_74()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         backBig.mouseEnabled = backBig.mouseChildren = false;
      }
   }
}

