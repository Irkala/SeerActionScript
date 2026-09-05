package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class GStone extends BaseStone
   {
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      private var soundBool:Boolean;
      
      public function GStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(7777);
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100)
         {
            stoneMC.x += 15;
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
                     soundBool = false;
                  }
               }
               stoneMC.y += 15 * Math.sin(stoneMC.x);
            }
         }
         else if(m > 100)
         {
            stoneMC.x -= 15;
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
                     soundBool = false;
                  }
               }
               stoneMC.y += 15 * Math.sin(stoneMC.x);
            }
         }
      }
      
      override protected function getMC() : MovieClip
      {
         return new EnemyStone7();
      }
      
      override protected function initProp() : void
      {
         super.initProp();
         m = int(Math.random() * 2) * 900;
         n = 420;
         stoneMC.x = m;
         stoneMC.y = n;
         ConSprite.con.addChild(stoneMC);
         soundBool = true;
      }
   }
}

