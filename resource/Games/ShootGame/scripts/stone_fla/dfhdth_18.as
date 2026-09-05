package stone_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol409")]
   public dynamic class dfhdth_18 extends MovieClip
   {
      
      public function dfhdth_18()
      {
         super();
         addFrameScript(42,frame43);
      }
      
      internal function frame43() : *
      {
         stop();
         try
         {
            this.parent.parent.removeChild(this.parent);
         }
         catch(e:*)
         {
         }
      }
   }
}

