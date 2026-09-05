package
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol80")]
   public dynamic class AchieveBar_UI extends MovieClip
   {
      
      public var ruleOri:TextField;
      
      public var bloodBtn:MovieClip;
      
      public var ruleID:TextField;
      
      public var next:SimpleButton;
      
      public var prev:SimpleButton;
      
      public var blood:MovieClip;
      
      public var desTxt:TextField;
      
      public var titleTxt:TextField;
      
      public var branchID:TextField;
      
      public var con0:MovieClip;
      
      public var con1:MovieClip;
      
      public var nameTxt:TextField;
      
      public var value:TextField;
      
      public function AchieveBar_UI()
      {
         addFrameScript(0,this.frame1);
         super();
      }
      
      public function onClick(param1:Event) : void
      {
         this["blood"].visible = true;
      }
      
      internal function frame1() : *
      {
         this["bloodBtn"].buttonMode = true;
         this["bloodBtn"].addEventListener(MouseEvent.CLICK,this.onClick);
      }
   }
}

