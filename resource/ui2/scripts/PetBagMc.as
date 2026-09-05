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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1707")]
   public dynamic class PetBagMc extends MovieClip
   {
      
      public var itemBtn:SimpleButton;
      
      public var infoMc:MovieClip;
      
      public var change:SimpleButton;
      
      public var cmBtn:SimpleButton;
      
      public var pictureBookBtn:SimpleButton;
      
      public var petStorageBtn:SimpleButton;
      
      public var followBtn:MovieClip;
      
      public var itemMC:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var defaultBtn:SimpleButton;
      
      public var dragBtn:MovieClip;
      
      public var skillStoneBtn:SimpleButton;
      
      public var storageBtn:SimpleButton;
      
      public var cureBtn:SimpleButton;
      
      public var cls:*;
      
      public function PetBagMc()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         try
         {
            cls = getDefinitionByName("org.taomee.manager.ToolTipManager");
            cls.add(this["change"],"切换到新版背包");
         }
         catch(e:Error)
         {
         }
      }
   }
}

