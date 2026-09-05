package stone_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol439")]
   public dynamic class aaaaaa_4 extends MovieClip
   {
      
      public function aaaaaa_4()
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

