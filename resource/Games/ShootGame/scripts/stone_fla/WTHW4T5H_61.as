package stone_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol336")]
   public dynamic class WTHW4T5H_61 extends MovieClip
   {
      
      public function WTHW4T5H_61()
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

