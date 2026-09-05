package _374_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol52")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,60,frame61,87,frame88);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame61() : *
      {
         hit = 1;
      }
      
      internal function frame88() : *
      {
         stop();
      }
   }
}

