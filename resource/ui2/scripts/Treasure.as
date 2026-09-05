package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1618")]
   public dynamic class Treasure extends MovieClip
   {
      
      public var txt:TextField;
      
      public function Treasure()
      {
         super();
         addFrameScript(1,this.frame2);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

