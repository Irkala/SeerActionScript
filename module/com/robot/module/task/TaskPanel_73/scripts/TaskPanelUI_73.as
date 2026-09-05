package
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol48")]
   public dynamic class TaskPanelUI_73 extends MovieClip
   {
      
      public var tip_mc:MovieClip;
      
      public var tip_0:MovieClip;
      
      public var tip_1:MovieClip;
      
      public var tip_2:MovieClip;
      
      public var tip_3:MovieClip;
      
      public var txt:TextField;
      
      public var cls:*;
      
      public var close_btn:SimpleButton;
      
      public var cls1:*;
      
      public var tip_4:MovieClip;
      
      public function TaskPanelUI_73()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         cls = getDefinitionByName("org.taomee.manager.ToolTipManager");
         cls.add(tip_0,"找出装置的启动机关");
         cls.add(tip_1,"请放入右上角的LUC金属材质");
      }
      
      internal function frame3() : *
      {
         cls1 = getDefinitionByName("org.taomee.manager.ToolTipManager");
         cls1.add(tip_2,"找出装置的启动机关");
         cls1.add(tip_3,"请放入右上角的LUC金属材质");
         cls1.add(tip_4,"装备上火焰喷射器，用头部射击加大火焰热量");
      }
   }
}

