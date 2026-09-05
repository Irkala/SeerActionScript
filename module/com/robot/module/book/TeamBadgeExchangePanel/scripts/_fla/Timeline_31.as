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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol99")]
   public dynamic class Timeline_31 extends MovieClip
   {
      
      public var txt:TextField;
      
      public var btn:SimpleButton;
      
      public function Timeline_31()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = getDefinitionByName("com.robot.app.buyItem.HeadquartersAction");
         if(_loc2_)
         {
            _loc2_.exchangePet(this.exId,this.needCount);
            this.parent.dispatchEvent(new Event(Event.CLOSE));
         }
      }
      
      internal function frame1() : *
      {
         try
         {
            this.txt.text = this.needCount.toString() + " X";
            this.btn.addEventListener(MouseEvent.CLICK,onClickHandler);
         }
         catch(e:Error)
         {
         }
      }
   }
}

