package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol226")]
   public dynamic class Timeline_101 extends MovieClip
   {
      
      public var Justin:MovieClip;
      
      public function Timeline_101()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.Justin.mouseEnabled = false;
         this.Justin.mouseChildren = false;
      }
   }
}

