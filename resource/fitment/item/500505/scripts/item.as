package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16")]
   public dynamic class item extends MovieClip
   {
      
      public var i:int;
      
      public var btn_0:MovieClip;
      
      public var btn_1:MovieClip;
      
      public var btn_2:MovieClip;
      
      public var btn_3:MovieClip;
      
      public var btn:MovieClip;
      
      public function item()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         i = 0;
         while(i < 4)
         {
            btn = getChildByName("btn_" + i.toString()) as MovieClip;
            btn.addEventListener(MouseEvent.MOUSE_OVER,onOver);
            btn.addEventListener(MouseEvent.MOUSE_OUT,onOut);
            btn.gotoAndStop(1);
            ++i;
         }
      }
      
      public function onOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.play();
      }
      
      public function onOut(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         _loc2_.gotoAndStop(1);
      }
   }
}

