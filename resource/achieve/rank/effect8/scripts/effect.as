package
{
   import flash.display.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4")]
   public dynamic class effect extends MovieClip
   {
      
      public function effect()
      {
         super();
         addFrameScript(0,this.frame1,79,this.frame80);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame80() : *
      {
         stop();
      }
   }
}

