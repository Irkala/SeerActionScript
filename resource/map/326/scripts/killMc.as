package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public dynamic class killMc extends MovieClip
   {
      
      public function killMc()
      {
         super();
         addFrameScript(2,this.frame3);
      }
      
      internal function frame3() : *
      {
         stop();
         this.parent.removeChild(this);
      }
   }
}

