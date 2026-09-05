package §12_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol71")]
   public dynamic class digong1_15 extends MovieClip
   {
      
      public function digong1_15()
      {
         super();
         addFrameScript(0,frame1,14,frame15,29,frame30);
      }
      
      internal function frame15() : *
      {
         stop();
         this.mouseChildren = true;
         this.mouseEnabled = true;
      }
      
      internal function frame30() : *
      {
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      internal function frame1() : *
      {
         stop();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
   }
}

