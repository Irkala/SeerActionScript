package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class IStone extends BaseStone
   {
      
      private var vy:Number = 6;
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      public function IStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(11991);
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100)
         {
            stoneMC.x += 15;
         }
         else if(m > 100)
         {
            stoneMC.x -= 15;
         }
         if(stoneMC.x < 360)
         {
            if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x,stoneMC.y) && !stoneMC.ishited)
            {
               stoneMC.ishited = true;
               if(stoneMC.currentFrame == 1)
               {
                  MouseMove.bloodNumber -= 50;
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
               MouseMove.bloodNumber -= 50;
               stoneMC.gotoAndStop(2);
               if(MouseMove.soundBool == true)
               {
                  soundBlood = new SoundBlood();
                  soundBlood.play();
               }
            }
         }
      }
      
      override protected function getMC() : MovieClip
      {
         return new EnemyStone9();
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

