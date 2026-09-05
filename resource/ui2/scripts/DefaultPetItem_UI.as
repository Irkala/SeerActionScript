package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol5931")]
   public dynamic class DefaultPetItem_UI extends MovieClip
   {
      
      public var lvTitle:MovieClip;
      
      public var con:MovieClip;
      
      public var maskMC:MovieClip;
      
      public var nameText:TextField;
      
      public var level:MovieClip;
      
      public var bloodText:TextField;
      
      public function DefaultPetItem_UI()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

