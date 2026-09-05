package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class BStone extends BaseStone
   {
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      private var soundBool:Boolean;
      
      public function BStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(2222);
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100)
         {
            stoneMC.x += 10;
            if(stoneMC.hitTestObject(BuyGunObserver.bigThings))
            {
               if(stoneMC.currentFrame == 1)
               {
                  --MouseMove.bloodNumber;
                  if(MouseMove.soundBool == true)
                  {
                     if(soundBool == true)
                     {
                        soundBlood = new SoundBlood();
                        soundBlood.play();
                     }
                  }
                  soundBool = false;
               }
               stoneMC.y += 10 * Math.sin(stoneMC.x);
            }
         }
         else if(m > 100)
         {
            stoneMC.x -= 10;
            if(stoneMC.hitTestObject(BuyGunObserver.bigThings))
            {
               if(stoneMC.currentFrame == 1)
               {
                  --MouseMove.bloodNumber;
                  if(MouseMove.soundBool == true)
                  {
                     if(soundBool == true)
                     {
                        soundBlood = new SoundBlood();
                        soundBlood.play();
                     }
                  }
                  soundBool = false;
               }
               stoneMC.y += 10 * Math.sin(stoneMC.x);
            }
         }
      }
      
      override protected function getMC() : MovieClip
      {
         return new EnemyStone2();
      }
      
      override protected function initProp() : void
      {
         super.initProp();
         m = int(Math.random() * 2) * 900;
         stoneMC.x = m;
         stoneMC.y = 400;
         ConSprite.con.addChild(stoneMC);
         soundBool = true;
      }
   }
}

