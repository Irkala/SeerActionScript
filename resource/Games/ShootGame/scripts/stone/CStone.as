package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class CStone extends BaseStone
   {
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      private var soundBool:Boolean;
      
      public function CStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(333);
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100 && n > 0)
         {
            stoneMC.x += 10;
         }
         else if(m > 100 && n > 0)
         {
            stoneMC.x -= 10;
         }
         else if(m < 100 && n < 0)
         {
            if(stoneMC.y < 400)
            {
               stoneMC.y += Math.sqrt(stoneMC.x);
               stoneMC.x += 6;
            }
            else
            {
               stoneMC.x += 6;
            }
         }
         else if(stoneMC.y < 400)
         {
            stoneMC.y += Math.sqrt(stoneMC.x);
            stoneMC.x -= 6;
         }
         else
         {
            stoneMC.x -= 6;
         }
         if(stoneMC.x < 490)
         {
            if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x,stoneMC.y))
            {
               stoneMC.ishited = true;
               stoneMC.x = BuyGunObserver.bigThings.x - 170;
               if(stoneMC.currentFrame == 1)
               {
                  MouseMove.bloodNumber -= 5;
                  if(MouseMove.soundBool == true)
                  {
                     if(soundBool == true)
                     {
                        soundBlood = new SoundBlood();
                        soundBlood.play();
                     }
                     soundBool = false;
                  }
               }
            }
         }
         else if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x + stoneMC.width,stoneMC.y))
         {
            stoneMC.ishited = true;
            stoneMC.x = BuyGunObserver.bigThings.x + 120;
            if(stoneMC.currentFrame == 1)
            {
               MouseMove.bloodNumber -= 5;
               if(MouseMove.soundBool == true)
               {
                  if(soundBool == true)
                  {
                     soundBlood = new SoundBlood();
                     soundBlood.play();
                  }
                  soundBool = false;
               }
            }
         }
      }
      
      override protected function getMC() : MovieClip
      {
         return new EnemyStone3();
      }
      
      override protected function initProp() : void
      {
         super.initProp();
         m = int(Math.random() * 2) * 900;
         n = int(Math.random() * 2) * 450 - 50;
         stoneMC.x = m;
         stoneMC.y = n;
         ConSprite.con.addChild(stoneMC);
         stoneMC.ishited = false;
         soundBool = true;
      }
   }
}

