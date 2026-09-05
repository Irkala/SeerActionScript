package instructorBook_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol154")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var nextBtn:SimpleButton;
      
      public var hand:MovieClip;
      
      public var fowardBtn:SimpleButton;
      
      public var firstPageBtn:SimpleButton;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,7,this.frame8,8,this.frame9);
      }
      
      internal function frame1() : *
      {
         stop();
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.goNext);
         this.fowardBtn.addEventListener(MouseEvent.CLICK,this.goFoward);
         this.firstPageBtn.addEventListener(MouseEvent.CLICK,this.goFirst);
         stop();
         this.nextBtn.visible = true;
         this.fowardBtn.visible = false;
      }
      
      internal function frame2() : *
      {
         this.nextBtn.visible = true;
         this.fowardBtn.visible = true;
      }
      
      public function goFirst(param1:*) : *
      {
         gotoAndStop(1);
      }
      
      internal function frame8() : *
      {
         this.nextBtn.visible = true;
         this.fowardBtn.visible = true;
      }
      
      internal function frame9() : *
      {
         this.nextBtn.visible = false;
         this.fowardBtn.visible = true;
      }
      
      public function goFoward(param1:*) : *
      {
         if(currentFrame > 1)
         {
            prevFrame();
         }
      }
      
      public function goNext(param1:*) : *
      {
         if(currentFrame < totalFrames)
         {
            nextFrame();
         }
      }
   }
}

