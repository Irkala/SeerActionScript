package §102_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol373")]
   public dynamic class Timeline_101 extends MovieClip
   {
      
      public var Justin:MovieClip;
      
      public function Timeline_101()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         Justin.mouseEnabled = false;
         Justin.mouseChildren = false;
      }
   }
}

