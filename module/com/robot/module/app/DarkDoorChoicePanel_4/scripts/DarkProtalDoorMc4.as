package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol71")]
   public dynamic class DarkProtalDoorMc4 extends MovieClip
   {
      
      public var cancelBtn:SimpleButton;
      
      public var mm:MovieClip;
      
      public var door0:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var door1:MovieClip;
      
      public var door2:MovieClip;
      
      public var sureBtn:SimpleButton;
      
      public function DarkProtalDoorMc4()
      {
         super();
         addFrameScript(46,frame47,74,frame75);
      }
      
      internal function frame47() : *
      {
         mm.mouseEnabled = false;
         mm.mouseChildren = false;
      }
      
      internal function frame75() : *
      {
         stop();
      }
   }
}

