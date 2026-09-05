package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol19")]
   public dynamic class skill extends MovieClip
   {
      
      public var 技能动作2:MovieClip;
      
      public var hit:*;
      
      public var isEnd:*;
      
      public function skill()
      {
         super();
         addFrameScript(0,frame1,21,frame22);
      }
      
      internal function frame1() : *
      {
         hit = 1;
      }
      
      internal function frame22() : *
      {
         stop();
         isEnd = 1;
      }
   }
}

