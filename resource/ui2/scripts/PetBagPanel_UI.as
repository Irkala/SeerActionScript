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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4169")]
   public dynamic class PetBagPanel_UI extends MovieClip
   {
      
      public var type:MovieClip;
      
      public var gender:MovieClip;
      
      public var content0:MovieClip;
      
      public var change:SimpleButton;
      
      public var content1:MovieClip;
      
      public var effect:MovieClip;
      
      public var evolutionMC:MovieClip;
      
      public var cmBtn:SimpleButton;
      
      public var pictureBookBtn:SimpleButton;
      
      public var effect1:MovieClip;
      
      public var moon:MovieClip;
      
      public var nameText:TextField;
      
      public var petStorageBtn:SimpleButton;
      
      public var tab0:MovieClip;
      
      public var followBtn:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var tab1:MovieClip;
      
      public var petCon:MovieClip;
      
      public var book:SimpleButton;
      
      public var tab2:MovieClip;
      
      public var defaultBtn:SimpleButton;
      
      public var dragBtn:MovieClip;
      
      public var tab3:MovieClip;
      
      public var storageBtn:SimpleButton;
      
      public var skillStoneBtn:SimpleButton;
      
      public var cureBtn:SimpleButton;
      
      public var cls:*;
      
      public function PetBagPanel_UI()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         try
         {
            this.cls = getDefinitionByName("org.taomee.manager.ToolTipManager");
            this.cls.add(this["change"],"切换到经典背包");
         }
         catch(e:Error)
         {
         }
      }
   }
}

