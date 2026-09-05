package stone_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol348")]
   public dynamic class dfhdtherterth_25 extends MovieClip
   {
      
      public function dfhdtherterth_25()
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

