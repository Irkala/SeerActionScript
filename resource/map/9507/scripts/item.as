package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol93")]
   public dynamic class item extends MovieClip
   {
      
      public function item()
      {
         super();
         addFrameScript(1,this.frame2);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

