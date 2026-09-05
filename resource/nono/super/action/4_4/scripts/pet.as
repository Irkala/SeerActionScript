package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol162")]
   public dynamic class pet extends MovieClip
   {
      
      public var color_1:MovieClip;
      
      public var color_2:MovieClip;
      
      public function pet()
      {
         super();
         addFrameScript(299,this.frame300);
      }
      
      internal function frame300() : *
      {
         stop();
      }
   }
}

