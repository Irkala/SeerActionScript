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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol253")]
   public dynamic class Timeline_90 extends MovieClip
   {
      
      public var priceTxt:TextField;
      
      public var p:uint;
      
      public var mc:MovieClip;
      
      public var btn:SimpleButton;
      
      public var cls1:Object;
      
      public function Timeline_90()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Object = getDefinitionByName("com.robot.app.buyItem.ItemAction");
         if(_loc2_)
         {
            _loc2_.showBuyPanel(400055);
         }
      }
      
      internal function frame1() : *
      {
         try
         {
            cls1 = getDefinitionByName("com.robot.core.config.xml.ItemXMLInfo");
            p = cls1.getPrice(400055);
            priceTxt.text = p.toString();
            btn.addEventListener(MouseEvent.CLICK,onClickHandler);
         }
         catch(e:Error)
         {
         }
      }
   }
}

