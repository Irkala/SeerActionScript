package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class AStone extends BaseStone
   {
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      public function AStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(11111);
      }
      
      override protected function initProp() : void
      {
         super.initProp();
         m = int(Math.random() * 2) * 900;
         n = int(Math.random() * 2) * 450 - 40;
         stoneMC.x = m;
         stoneMC.y = n;
         ConSprite.con.addChild(stoneMC);
         stoneMC.ishited = false;
      }
      
      override protected function getMC() : MovieClip
      {
         return new EnemyStone1();
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100 && n > 0)
         {
            stoneMC.x += 8;
         }
         else if(m > 100 && n > 0)
         {
            stoneMC.x -= 8;
         }
         else if(m < 100 && n < 0)
         {
            if(stoneMC.y < 410)
            {
               stoneMC.y += 10;
               stoneMC.x += 4;
            }
            else
            {
               stoneMC.x += 8;
            }
         }
         else if(stoneMC.y < 410)
         {
            stoneMC.y += 10;
            stoneMC.x -= 4;
         }
         else
         {
            stoneMC.x -= 8;
         }
         if(stoneMC.x < 360)
         {
            if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x,stoneMC.y) && !stoneMC.ishited)
            {
               stoneMC.ishited = true;
               if(stoneMC.currentFrame == 1)
               {
                  MouseMove.bloodNumber -= 20;
                  stoneMC.gotoAndStop(2);
                  if(MouseMove.soundBool == true)
                  {
                     soundBlood = new SoundBlood();
                     soundBlood.play();
                  }
               }
            }
         }
         else if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x + stoneMC.width,stoneMC.y) && !stoneMC.ishited)
         {
            stoneMC.ishited = true;
            if(stoneMC.currentFrame == 1)
            {
               MouseMove.bloodNumber -= 20;
               stoneMC.gotoAndStop(2);
               if(MouseMove.soundBool == true)
               {
                  soundBlood = new SoundBlood();
                  soundBlood.play();
               }
            }
         }
      }
   }
}

