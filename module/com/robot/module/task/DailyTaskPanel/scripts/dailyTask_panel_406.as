package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol111")]
   public dynamic class dailyTask_panel_406 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var str:String;
      
      public function dailyTask_panel_406()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.str = "    幽浮那小家伙，很想和我们一起玩捉迷藏。这不，幽浮还想来考验考验我们赛尔的眼力呢。快去<font color=\'#ff0000\'>云霄星高空层</font>点击梦幻云层看看吧！";
         this.txt.htmlText = this.str;
      }
   }
}

