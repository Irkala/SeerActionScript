package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class FStone extends BaseStone
   {
      
      private var vy:Number = -15;
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      private var vy2:Number = -15;
      
      public function FStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(666);
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100)
         {
            stoneMC.x += 8;
            vy += 1;
            if(vy >= 16)
            {
               vy = -15;
            }
            stoneMC.y += vy;
         }
         else if(m > 100)
         {
            stoneMC.x -= 8;
            vy2 += 1;
            if(vy2 >= 16)
            {
               vy2 = -15;
            }
            stoneMC.y += vy2;
         }
         if(stoneMC.x < 360)
         {
            if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x,stoneMC.y) && !stoneMC.ishited)
            {
               if(stoneMC.currentFrame == 1)
               {
                  MouseMove.bloodNumber -= 30;
                  if(MouseMove.soundBool == true)
                  {
                     soundBlood = new SoundBlood();
                     soundBlood.play();
                  }
               }
               stoneMC.ishited = true;
               stoneMC.gotoAndStop(2);
            }
         }
         else if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x + stoneMC.width,stoneMC.y) && !stoneMC.ishited)
         {
            if(stoneMC.currentFrame == 1)
            {
               MouseMove.bloodNumber -= 30;
               if(MouseMove.soundBool == true)
               {
                  soundBlood = new SoundBlood();
                  soundBlood.play();
               }
            }
            stoneMC.ishited = true;
            stoneMC.gotoAndStop(2);
         }
      }
      
      override protected function getMC() : MovieClip
      {
         return new EnemyStone6();
      }
      
      override protected function initProp() : void
      {
         super.initProp();
         m = int(Math.random() * 2) * 900;
         stoneMC.x = m;
         stoneMC.y = 400;
         ConSprite.con.addChild(stoneMC);
         stoneMC.ishited = false;
      }
   }
}

