package com.ming.managers.utils.move
{
   import flash.display.InteractiveObject;
   
   public class Moving
   {
      
      public function Moving()
      {
         super();
      }
      
      public static function moveCircle(it:InteractiveObject, speed:Number, radius:Number, angle:Number, centerX:Number, centerY:Number) : int
      {
         it.x = radius * Math.sin(angle * Math.PI / 180) + centerX;
         it.y = radius * Math.cos(angle * Math.PI / 180) + centerY;
         var an:Number = Math.abs(angle % 360);
         if(an < 60 || an > 300)
         {
            return 1;
         }
         if(an > 120 && an < 240)
         {
            return -1;
         }
         return 0;
      }
      
      public static function moveSlanting(it:InteractiveObject, vspeed:Number, hspeed:Number, startSlanting:Number) : void
      {
         it.y += vspeed;
         if(it.y > startSlanting)
         {
            it.x += hspeed;
         }
      }
      
      public static function moveDirectly(it:InteractiveObject, vspeed:Number) : void
      {
         it.y += vspeed;
      }
      
      public static function track(target:InteractiveObject, it:InteractiveObject, speed:Number, omega:Number = 0, dir:int = 1) : void
      {
         var dx:Number = NaN;
         var dy:Number = NaN;
         var angle:Number = NaN;
         var crtangle:Number = NaN;
         if(!target)
         {
            Moving.moveDirectly(it,dir * speed / 2);
            it.rotation = dir > 0 ? 180 : 0;
         }
         else
         {
            dx = it.x - target.x;
            dy = it.y - target.y;
            angle = (270 + Math.atan2(dy,dx) * 180 / Math.PI) % 360;
            crtangle = (angle - it.rotation + 360) % 360;
            dir = crtangle <= 180 ? 1 : -1;
            if(omega != 0)
            {
               it.rotation = crtangle < 180 && crtangle > omega || crtangle > 180 && 360 - crtangle > omega ? it.rotation + omega * dir : angle;
            }
            else
            {
               it.rotation = angle;
            }
            it.x += speed * Math.sin(it.rotation * Math.PI / 180);
            it.y -= speed * Math.cos(it.rotation * Math.PI / 180);
         }
      }
      
      public static function pointTo(it:InteractiveObject, targetIt:InteractiveObject, omega:Number = 0) : void
      {
         var dx:Number = it.x - targetIt.x;
         var dy:Number = it.y - targetIt.y;
         var angle:Number = (270 + Math.atan2(dy,dx) * 180 / Math.PI) % 360;
         var crtangle:Number = (angle - it.rotation + 360) % 360;
         var dir:int = crtangle <= 180 ? 1 : -1;
         if(omega != 0)
         {
            it.rotation = crtangle < 180 && crtangle > omega || crtangle > 180 && 360 - crtangle > omega ? it.rotation + omega * dir : angle;
         }
         else
         {
            it.rotation = angle;
         }
      }
      
      public static function moveBeelline(it:InteractiveObject, speed:Number, angle:Number) : void
      {
         if(angle != 0)
         {
            it.rotation = -angle;
            it.x += speed * Math.sin(angle / 180 * Math.PI);
            it.y += speed * Math.cos(angle / 180 * Math.PI);
         }
         else
         {
            it.y += speed;
         }
      }
   }
}

