package §12_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol76")]
   public dynamic class digong2_16 extends MovieClip
   {
      
      public function digong2_16()
      {
         super();
         addFrameScript(0,frame1,10,frame11,14,frame15,30,frame31);
      }
      
      internal function frame15() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         this.mouseChildren = true;
         this.mouseEnabled = true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
   }
}

