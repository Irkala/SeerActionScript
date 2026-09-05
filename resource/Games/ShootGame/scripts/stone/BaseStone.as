package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.utils.setTimeout;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class BaseStone
   {
      
      public static var soundCh:SoundChannel;
      
      public static var soundChD:SoundChannel;
      
      private var isHit:Boolean = false;
      
      protected var damage:Number;
      
      private var soundBomb:Sound;
      
      protected var stoneMC:MovieClip;
      
      protected var life:uint;
      
      private var soundStone:Sound;
      
      public function BaseStone()
      {
         super();
         stoneMC = getMC();
         stoneMC.scaleX = stoneMC.scaleY = 0.6;
         stoneMC.mouseChildren = false;
         stoneMC.addEventListener(Event.ENTER_FRAME,stoneKill);
         initProp();
         initMove();
         stoneMC.ishited = false;
         stoneMC.addEventListener(Event.ENTER_FRAME,check);
      }
      
      protected function initMove() : void
      {
      }
      
      private function stoneKill(e:Event) : void
      {
         var mc:MovieClip = null;
         for(var i:uint = 0; i < ConSprite.con2.numChildren; i++)
         {
            if(stoneMC.hitTestPoint(ConSprite.con2.getChildAt(i).x + 15,ConSprite.con2.getChildAt(i).y + 15) && !stoneMC.ishited)
            {
               stoneMC.ishited = true;
               stoneMC.gotoAndStop(2);
               mc = ConSprite.con2.getChildAt(i) as MovieClip;
               mc.gotoAndStop(2);
               if(MouseMove.soundBool == true)
               {
                  soundBomb = new SoundBomb();
                  soundBomb.play();
               }
            }
            if(ConSprite.con.numChildren == 0)
            {
               ConSprite.con2.removeChildAt(0);
            }
         }
         if(GunManager.isDown)
         {
            if(stoneMC.hitTestObject(GunManager.icon) && !isHit && GunManager.gun.isOK)
            {
               isHit = true;
               stoneMC.gotoAndStop(2);
               BuyGunObserver.money += 1;
               setTimeout(closeThis,2000);
               if(MouseMove.soundBool == true)
               {
                  soundStone = new SoundStone2();
                  soundStone.play();
               }
            }
         }
      }
      
      protected function down(event:Event) : void
      {
      }
      
      private function closeThis() : void
      {
         clear();
      }
      
      private function check(event:Event) : void
      {
         for(var i:uint = 0; i < ConSprite.con.numChildren; i++)
         {
            if(ConSprite.con.getChildAt(i).x < -200 || ConSprite.con.getChildAt(i).x > 1000)
            {
               ConSprite.con.removeChildAt(i);
               clear();
            }
         }
      }
      
      private function disappear(e:Event) : void
      {
         stoneMC.gotoAndStop(2);
      }
      
      public function clear() : void
      {
         if(stoneMC)
         {
            stoneMC.removeEventListener(Event.ENTER_FRAME,down);
            stoneMC.removeEventListener(Event.ENTER_FRAME,check);
            stoneMC.removeEventListener(Event.ENTER_FRAME,stoneKill);
            if(stoneMC.parent)
            {
               stoneMC.parent.removeChild(stoneMC);
            }
         }
         stoneMC = null;
      }
      
      protected function getMC() : MovieClip
      {
         return null;
      }
      
      protected function initProp() : void
      {
         stoneMC.addEventListener(Event.ENTER_FRAME,down);
      }
   }
}

