package _818_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol461")]
   public dynamic class _08_128 extends MovieClip
   {
      
      public var ruiersi:MovieClip;
      
      public var saende:MovieClip;
      
      public var gaiya:MovieClip;
      
      public var bulaike:MovieClip;
      
      public var kaxiusi:MovieClip;
      
      public var leiyi:MovieClip;
      
      public function _08_128()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         saende.mouseChildren = false;
         ruiersi.mouseChildren = false;
         bulaike.mouseChildren = false;
         kaxiusi.mouseChildren = false;
         gaiya.mouseChildren = false;
         leiyi.mouseChildren = false;
      }
   }
}

