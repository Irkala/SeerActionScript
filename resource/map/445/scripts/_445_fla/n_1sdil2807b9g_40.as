package _445_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol327")]
   public dynamic class n_1sdil2807b9g_40 extends MovieClip
   {
      
      public var mc2:MovieClip;
      
      public var mc3:MovieClip;
      
      public var mc4:MovieClip;
      
      public var mc5:MovieClip;
      
      public var mc6:MovieClip;
      
      public var mc8:MovieClip;
      
      public var mc9:MovieClip;
      
      public var bloodMc:MovieClip;
      
      public function n_1sdil2807b9g_40()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5);
      }
      
      internal function frame1() : *
      {
         stop();
         this.bloodMc.visible = false;
      }
      
      internal function frame5() : *
      {
         this.bloodMc.visible = true;
      }
   }
}

