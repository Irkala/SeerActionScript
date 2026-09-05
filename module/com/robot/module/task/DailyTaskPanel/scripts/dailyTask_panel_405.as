package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol74")]
   public dynamic class dailyTask_panel_405 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var str:String;
      
      public function dailyTask_panel_405()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.str = "    快带上你的比比鼠来<font color=\'#ff0000\'>动力室</font>吧，点击“发电装置”就能启动电能转换模式，掌控好电能球的旋转频率，才能将比比鼠的发电能力达到最高。";
         this.txt.htmlText = this.str;
      }
   }
}

