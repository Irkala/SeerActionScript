package com.robot.module.app.spriteTrack
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   
   public class SpriteIcon extends Sprite
   {
      
      public static const SHOW_DETAIL_SPRITE:String = "show_detail_pet";
      
      private var id:uint;
      
      public function SpriteIcon(i:uint)
      {
         super();
         loadIcon(i);
         id = i;
      }
      
      private function onLoaded(mc:MovieClip) : void
      {
         if(mc)
         {
            this.addChild(mc);
            mc.buttonMode = true;
            mc.addEventListener(MouseEvent.CLICK,onClickSprite);
         }
      }
      
      private function onClickSprite(evt:MouseEvent) : void
      {
         EventManager.dispatchEvent(new DynamicEvent(SpriteIcon.SHOW_DETAIL_SPRITE,id));
      }
      
      private function loadIcon(i:uint) : void
      {
         var url:String = "resource/pet/icon/" + i + ".swf";
         ResourceManager.getResource(url,onLoaded,"pet");
      }
   }
}

