package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol91")]
   public dynamic class iceMC extends MovieClip
   {
      
      public var mc1:MovieClip;
      
      public var mc2:MovieClip;
      
      public function iceMC()
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

