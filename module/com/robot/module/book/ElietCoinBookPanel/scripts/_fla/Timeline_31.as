package _fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol81")]
   public dynamic class Timeline_31 extends MovieClip
   {
      
      public var xmlInfo:*;
      
      public var btn:SimpleButton;
      
      public function Timeline_31()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = getDefinitionByName("com.robot.app.buyItem.ProductAction");
         trace("buy gold product ---->",this.itemID);
         _loc2_.buyMoneyProduct(this.itemID);
      }
      
      internal function frame1() : *
      {
         xmlInfo = getDefinitionByName("com.robot.core.config.xml.MoneyProductXMLInfo");
         btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
   }
}

