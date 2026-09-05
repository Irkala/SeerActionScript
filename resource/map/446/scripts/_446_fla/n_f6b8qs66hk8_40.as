package _446_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol201")]
   public dynamic class n_f6b8qs66hk8_40 extends MovieClip
   {
      
      public var mc2:MovieClip;
      
      public var pointMC:MovieClip;
      
      public var mc3:MovieClip;
      
      public var bridleHit:MovieClip;
      
      public var mc4:MovieClip;
      
      public var birdHit:MovieClip;
      
      public var mc5:MovieClip;
      
      public var mc6:MovieClip;
      
      public function n_f6b8qs66hk8_40()
      {
         super();
         addFrameScript(0,frame1,3,frame4,4,frame5,5,frame6);
      }
      
      internal function frame1() : *
      {
         pointMC.visible = false;
         birdHit.visible = false;
         stop();
      }
      
      internal function frame4() : *
      {
         pointMC.visible = false;
         bridleHit.visible = false;
      }
      
      internal function frame5() : *
      {
         birdHit.visible = true;
      }
      
      internal function frame6() : *
      {
         birdHit.visible = false;
      }
   }
}

