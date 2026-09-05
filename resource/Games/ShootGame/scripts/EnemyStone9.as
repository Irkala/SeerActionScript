package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol373")]
   public dynamic class EnemyStone9 extends MovieClip
   {
      
      public var mc:MovieClip;
      
      public function EnemyStone9()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         stop();
         mc.addEventListener(Event.ENTER_FRAME,ff);
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function ff(param1:*) : *
      {
         if(mc)
         {
            mc.rotation += 5;
         }
      }
   }
}

