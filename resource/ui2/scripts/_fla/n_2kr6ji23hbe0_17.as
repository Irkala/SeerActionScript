package _fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3111")]
   public dynamic class n_2kr6ji23hbe0_17 extends MovieClip
   {
      
      public var txt_0:TextField;
      
      public var txt_1:TextField;
      
      public var txt_2:TextField;
      
      public var task_0:MovieClip;
      
      public var task_1:MovieClip;
      
      public var task_2:MovieClip;
      
      public var title:MovieClip;
      
      public var arrow:MovieClip;
      
      public function n_2kr6ji23hbe0_17()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
      }
      
      internal function frame1() : *
      {
         this.task_0.mouseChildren = false;
         this.task_0.buttonMode = true;
         this.task_0.visible = true;
         this.task_1.visible = false;
         this.task_2.visible = false;
      }
      
      internal function frame2() : *
      {
         this.task_0.mouseChildren = false;
         this.task_0.buttonMode = true;
         this.task_1.mouseChildren = false;
         this.task_1.buttonMode = true;
         this.task_0.visible = true;
         this.task_1.visible = true;
         this.task_2.visible = false;
      }
      
      internal function frame3() : *
      {
         this.task_0.mouseChildren = false;
         this.task_0.buttonMode = true;
         this.task_1.mouseChildren = false;
         this.task_1.buttonMode = true;
         this.task_2.mouseChildren = false;
         this.task_2.buttonMode = true;
         this.task_0.visible = true;
         this.task_1.visible = true;
         this.task_2.visible = true;
      }
   }
}

