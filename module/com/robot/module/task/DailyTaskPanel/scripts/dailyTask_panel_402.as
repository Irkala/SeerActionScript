package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol77")]
   public dynamic class dailyTask_panel_402 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var str:String;
      
      public function dailyTask_panel_402()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.str = "    小火猴的武学梦想远大,但是它总是心浮气躁的无法克服。快去<font color=\'#ff0000\'>火山星地面层</font>看看吧，点击那里的“练功石”吧，让我们一起帮助小火猴进行练习。" + "<font color=\'#ff0000\'>(炎火猴也可以做这个任务哦!)</font>";
         this.txt.htmlText = this.str;
      }
   }
}

