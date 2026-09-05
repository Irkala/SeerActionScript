package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol114")]
   public dynamic class dailyTask_panel_407 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var str:String;
      
      public function dailyTask_panel_407()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.str = "    对于利牙鱼来说牙齿可是很重要的，所以要注意每天的口腔护理工作。快带着你的利牙鱼来<font color=\'#ff0000\'>海洋星球深水区</font>帮它做个口腔护理吧。";
         this.txt.htmlText = this.str;
      }
   }
}

