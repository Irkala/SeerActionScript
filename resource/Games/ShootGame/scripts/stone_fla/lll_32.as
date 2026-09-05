package stone_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol397")]
   public dynamic class lll_32 extends MovieClip
   {
      
      public function lll_32()
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

