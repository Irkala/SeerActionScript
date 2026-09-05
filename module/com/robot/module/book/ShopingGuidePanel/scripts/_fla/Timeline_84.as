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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol244")]
   public dynamic class Timeline_84 extends MovieClip
   {
      
      public var btn:SimpleButton;
      
      public var xmlInfo:*;
      
      public var mc:MovieClip;
      
      public var price:uint;
      
      public function Timeline_84()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         var cls:* = undefined;
         var e:MouseEvent = param1;
         try
         {
            cls = getDefinitionByName("com.robot.app.buyItem.ProductAction");
            trace("buy gold product ---->",this.itemID);
            cls.buyGoldProduct(this.itemID);
         }
         catch(e:Error)
         {
         }
      }
      
      internal function frame1() : *
      {
         try
         {
            xmlInfo = getDefinitionByName("com.robot.core.config.xml.GoldProductXMLInfo");
            price = xmlInfo.getPriceByProID(this.itemID);
            if(price == 0)
            {
               mc["priceTxt"].text = "免费";
            }
            else
            {
               mc["priceTxt"].text = price.toString();
            }
         }
         catch(e:Error)
         {
         }
         btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
   }
}

