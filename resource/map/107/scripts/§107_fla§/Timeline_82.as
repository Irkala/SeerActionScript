package §107_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol328")]
   public dynamic class Timeline_82 extends MovieClip
   {
      
      public var containerMC:MovieClip;
      
      public var door_109:MovieClip;
      
      public var nonoClick_mc:MovieClip;
      
      public function Timeline_82()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         door_109.mouseChildren = false;
         door_109.mouseEnabled = false;
      }
   }
}

