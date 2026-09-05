package _70_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol29")]
   public dynamic class Timeline_18 extends MovieClip
   {
      
      public function Timeline_18()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClick(param1:MouseEvent) : *
      {
         (this.parent as MovieClip).play();
      }
      
      internal function frame1() : *
      {
         this.addEventListener(MouseEvent.CLICK,onClick);
         this.buttonMode = true;
      }
   }
}

