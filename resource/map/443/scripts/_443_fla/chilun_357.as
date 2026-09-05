package _443_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1198")]
   public dynamic class chilun_357 extends MovieClip
   {
      
      public function chilun_357()
      {
         super();
         addFrameScript(40,frame41);
      }
      
      internal function frame41() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

