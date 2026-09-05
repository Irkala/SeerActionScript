package _93_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol221")]
   public dynamic class _003_69 extends MovieClip
   {
      
      public var sikerui:MovieClip;
      
      public var haidao_2:MovieClip;
      
      public var haidao_1:MovieClip;
      
      public function _003_69()
      {
         super();
         addFrameScript(0,frame1,108,frame109);
      }
      
      internal function frame1() : *
      {
         stop();
         haidao_1.mouseChildren = false;
         haidao_2.mouseChildren = false;
         sikerui.mouseChildren = false;
      }
      
      internal function frame109() : *
      {
         stop();
      }
   }
}

