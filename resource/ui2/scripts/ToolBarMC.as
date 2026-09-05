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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol6038")]
   public dynamic class ToolBarMC extends MovieClip
   {
      
      public var inputBtn:SimpleButton;
      
      public var quickWordBtn:SimpleButton;
      
      public var chatMc:MovieClip;
      
      public var petBtn:MovieClip;
      
      public var cultureBtn:SimpleButton;
      
      public var mailMc:MovieClip;
      
      public var shopBtn:MovieClip;
      
      public var bagBtn:MovieClip;
      
      public var iconMc:MovieClip;
      
      public var userMc:MovieClip;
      
      public var questionMc:SimpleButton;
      
      public var helper:MovieClip;
      
      public var nono_helper:MovieClip;
      
      public var homeBtn:SimpleButton;
      
      public var maplock:MovieClip;
      
      public var showChatBtn:MovieClip;
      
      public var emotionBtn:SimpleButton;
      
      public var soundMc:MovieClip;
      
      public var newseermc:MovieClip;
      
      public var inputTxt:TextField;
      
      public var mapBtn:MovieClip;
      
      public var friendBtn:SimpleButton;
      
      public var BatteryMC:MovieClip;
      
      public var starMapBtn:SimpleButton;
      
      public var startDate:Date;
      
      public var endDate:Date;
      
      public function ToolBarMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function showCountdown(param1:*, param2:*) : *
      {
         var _loc3_:Date = new Date();
         if(_loc3_.time >= param1.time && _loc3_.time < param2.time)
         {
            this["zhekouMc"].visible = true;
         }
         else
         {
            this["zhekouMc"].visible = false;
         }
      }
      
      internal function frame1() : *
      {
         this.startDate = new Date(2019,3,16);
         this.endDate = new Date(2019,3,26);
      }
   }
}

