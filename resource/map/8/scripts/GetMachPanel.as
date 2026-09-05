package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol45")]
   public dynamic class GetMachPanel extends MovieClip
   {
      
      public var wateGameBtn:MovieClip;
      
      public var fire_btn:MovieClip;
      
      public var close_btn:SimpleButton;
      
      public var ship_btn:MovieClip;
      
      public function GetMachPanel()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         ship_btn.buttonMode = true;
         fire_btn.buttonMode = true;
         wateGameBtn.buttonMode = true;
         ship_btn.addEventListener(MouseEvent.MOUSE_OVER,overHandler);
         ship_btn.addEventListener(MouseEvent.MOUSE_OUT,outHandler);
         fire_btn.addEventListener(MouseEvent.MOUSE_OVER,overHandler);
         fire_btn.addEventListener(MouseEvent.MOUSE_OUT,outHandler);
         wateGameBtn.addEventListener(MouseEvent.MOUSE_OVER,overHandler);
         wateGameBtn.addEventListener(MouseEvent.MOUSE_OUT,outHandler);
      }
      
      public function overHandler(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.gotoAndStop(2);
      }
      
      public function outHandler(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.gotoAndStop(1);
      }
   }
}

