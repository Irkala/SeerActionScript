package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol276")]
   public dynamic class Timeline_197 extends MovieClip
   {
      
      public var snowBalls:MovieClip;
      
      public function Timeline_197()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.snowBalls.mouseChildren = false;
      }
   }
}

