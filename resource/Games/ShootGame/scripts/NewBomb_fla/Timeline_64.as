package NewBomb_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol304")]
   public dynamic class Timeline_64 extends MovieClip
   {
      
      public function Timeline_64()
      {
         super();
         addFrameScript(30,frame31);
      }
      
      internal function frame31() : *
      {
         stop();
         try
         {
            this.parent.parent.removeChild(this.parent);
         }
         catch(e:Error)
         {
            trace(e.message);
         }
      }
   }
}

