package _fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol80")]
   public dynamic class hjkyuyukyuk_8 extends MovieClip
   {
      
      public var commit_btn:SimpleButton;
      
      public var darkdoor_1:MovieClip;
      
      public var mm1:MovieClip;
      
      public var mm2:MovieClip;
      
      public var close_btn:SimpleButton;
      
      public var cancel_btn:SimpleButton;
      
      public var darkdoor_2:MovieClip;
      
      public function hjkyuyukyuk_8()
      {
         super();
         addFrameScript(15,this.frame16,34,this.frame35);
      }
      
      internal function frame16() : *
      {
         this.mm1.mouseEnabled = false;
         this.mm1.mouseChildren = false;
         this.mm2.mouseEnabled = false;
         this.mm2.mouseChildren = false;
      }
      
      internal function frame35() : *
      {
         stop();
         stop();
         stop();
      }
   }
}

