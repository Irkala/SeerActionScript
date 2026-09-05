package _403_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol94")]
   public dynamic class boss_in_22 extends MovieClip
   {
      
      public var boss_static:MovieClip;
      
      public var clickBtn:SimpleButton;
      
      public var circle:MovieClip;
      
      public function boss_in_22()
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

