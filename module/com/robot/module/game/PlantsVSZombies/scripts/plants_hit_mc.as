package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol323")]
   public dynamic class plants_hit_mc extends MovieClip
   {
      
      public function plants_hit_mc()
      {
         super();
         addFrameScript(3,this.frame4);
      }
      
      internal function frame4() : *
      {
         stop();
      }
   }
}

