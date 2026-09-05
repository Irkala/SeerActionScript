package clothBook_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol53")]
   public dynamic class Timeline_18 extends MovieClip
   {
      
      public var btn:SimpleButton;
      
      public var mc:MovieClip;
      
      public var cls2:*;
      
      public function Timeline_18()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = getDefinitionByName("com.robot.app.buyItem.ItemAction");
         trace(this.itemID);
         _loc2_.buyItem(this.itemID);
      }
      
      internal function frame1() : *
      {
         cls2 = getDefinitionByName("com.robot.core.config.xml.ItemXMLInfo");
         this.price = cls2.getPrice(this.itemID);
         if(this.price == 0)
         {
            mc["priceTxt"].text = "免费";
         }
         else
         {
            mc["priceTxt"].text = this.price;
         }
         btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
   }
}

