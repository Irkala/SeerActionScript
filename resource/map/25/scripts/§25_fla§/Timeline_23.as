package §25_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol94")]
   public dynamic class Timeline_23 extends MovieClip
   {
      
      public var mcFalling:MovieClip;
      
      public function Timeline_23()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         mcFalling.mouseChildren = false;
         mcFalling.mouseEnabled = false;
      }
   }
}

