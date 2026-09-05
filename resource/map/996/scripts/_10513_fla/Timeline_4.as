package _10513_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol591")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var mc5:MovieClip;
      
      public var mc6:MovieClip;
      
      public var mc7:MovieClip;
      
      public var mc8:MovieClip;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         gotoAndStop(2);
      }
   }
}

