package _506_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol452")]
   public dynamic class xg157_198 extends MovieClip
   {
      
      public function xg157_198()
      {
         super();
         addFrameScript(0,this.frame1,40,this.frame41);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         this.parent.dispatchEvent(new Event("success"));
         gotoAndStop(1);
      }
   }
}

