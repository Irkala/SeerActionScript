package _693_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol740")]
   public dynamic class xingxing_254 extends MovieClip
   {
      
      public function xingxing_254()
      {
         super();
         addFrameScript(59,frame60);
      }
      
      internal function frame60() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}

