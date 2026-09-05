package _fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol101")]
   public dynamic class §2333333333333333333ewwwwwwwwwwww34_20§ extends MovieClip
   {
      
      public function §2333333333333333333ewwwwwwwwwwww34_20§()
      {
         super();
         addFrameScript(24,this.frame25,44,this.frame45,59,this.frame60,168,this.frame169,198,this.frame199,199,this.frame200,278,this.frame279);
      }
      
      internal function frame25() : *
      {
         gotoAndPlay("normal");
      }
      
      internal function frame199() : *
      {
         gotoAndPlay("charging");
      }
      
      internal function frame200() : *
      {
         stop();
      }
      
      internal function frame60() : *
      {
         gotoAndPlay("normal");
      }
      
      internal function frame169() : *
      {
         this.dispatchEvent(new Event(Event.OPEN));
      }
      
      internal function frame45() : *
      {
         this.dispatchEvent(new Event(Event.CLOSE));
         stop();
      }
      
      internal function frame279() : *
      {
         stop();
         gotoAndPlay("open");
      }
   }
}

