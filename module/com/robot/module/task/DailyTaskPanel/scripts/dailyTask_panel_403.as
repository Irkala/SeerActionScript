package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol80")]
   public dynamic class dailyTask_panel_403 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var str:String;
      
      public function dailyTask_panel_403()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.str = "    克洛斯花生病了,只有来自沼泽的布布种子才能完成克洛斯花的救助工作。快去<font color=\'#ff0000\'>克洛斯星沼泽</font>看看吧!" + "<font color=\'#ff0000\'>(黄金布布也可以做这个任务哦!)</font>";
         this.txt.htmlText = this.str;
      }
   }
}

