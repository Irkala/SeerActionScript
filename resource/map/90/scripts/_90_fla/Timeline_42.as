package _90_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol98")]
   public dynamic class Timeline_42 extends MovieClip
   {
      
      public var btnNotice:SimpleButton;
      
      public function Timeline_42()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

