package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol94")]
   public dynamic class dailyTask_panel_404 extends MovieClip
   {
      
      public var mc_0:MovieClip;
      
      public var mc_1:MovieClip;
      
      public var txt:TextField;
      
      public var str:String;
      
      public var pro_0:MovieClip;
      
      public var pro_1:MovieClip;
      
      public function dailyTask_panel_404()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.str = "    不明来历的核废料罐泄漏污染了<font color=\'#ff0000\'>海洋星海底</font>。点击“接受”领取工具后就行动起来,让我们一起保护我们的家园!" + "<font color=\'#ff0000\'>(伊优达也可以做这个任务哦!)</font>";
         this.txt.htmlText = this.str;
      }
   }
}

