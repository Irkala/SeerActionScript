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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4894")]
   public dynamic class PetInfo_UI extends MovieClip
   {
      
      public var improveAbilityBtn:SimpleButton;
      
      public var characterMC:MovieClip;
      
      public var specialTitle:MovieClip;
      
      public var skillAwakeBtn:SimpleButton;
      
      public var special:TextField;
      
      public var level:TextField;
      
      public var id:TextField;
      
      public var feature:MovieClip;
      
      public var tip:MovieClip;
      
      public var exp:TextField;
      
      public var dvMC:MovieClip;
      
      public var cls:*;
      
      public function PetInfo_UI()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         try
         {
            this.cls = getDefinitionByName("org.taomee.manager.ToolTipManager");
            this.cls.add(this["tip"],"可以去实验室的技能唤醒仪处替换技能哦！");
         }
         catch(e:Error)
         {
         }
      }
   }
}

