package _fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol513")]
   public dynamic class Timeline_3 extends MovieClip
   {
      
      public var nr_mc:MovieClip;
      
      public var btn2:SimpleButton;
      
      public var btn3:SimpleButton;
      
      public function Timeline_3()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4);
      }
      
      internal function frame1() : *
      {
         stop();
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHandler3);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHandler2);
         this.btn2.visible = false;
      }
      
      internal function frame2() : *
      {
         this.btn2.visible = true;
         this.btn3.visible = true;
      }
      
      internal function frame3() : *
      {
         this.btn2.visible = true;
         this.btn3.visible = true;
      }
      
      internal function frame4() : *
      {
         this.btn3.visible = false;
         this.btn2.visible = true;
      }
      
      public function clickHandler2(param1:MouseEvent) : void
      {
         prevFrame();
      }
      
      public function clickHandler3(param1:MouseEvent) : void
      {
         nextFrame();
      }
   }
}

