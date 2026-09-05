package _407_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol318")]
   public dynamic class Timeline_91 extends MovieClip
   {
      
      public var bloodMc:MovieClip;
      
      public function Timeline_91()
      {
         super();
         addFrameScript(0,frame1,2,frame3);
      }
      
      internal function frame1() : *
      {
         stop();
         bloodMc.visible = false;
      }
      
      internal function frame3() : *
      {
         bloodMc.visible = false;
      }
   }
}

