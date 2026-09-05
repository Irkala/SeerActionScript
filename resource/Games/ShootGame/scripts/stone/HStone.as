package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.media.Sound;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class HStone extends BaseStone
   {
      
      private var soundBlood:Sound;
      
      private var m:Number;
      
      private var n:Number;
      
      private var soundBool:Boolean;
      
      public function HStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(8888);
      }
      
      override protected function down(e:Event) : void
      {
         if(m < 100)
         {
            stoneMC.x += 10;
         }
         else if(m > 100)
         {
            stoneMC.x -= 10;
         }
         if(stoneMC.x < 490)
         {
            if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x,stoneMC.y))
            {
               stoneMC.ishited = true;
               stoneMC.x = BuyGunObserver.bigThings.x - 150;
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
         return new EnemyStone8();
      }
      
      override protected function initProp() : void
      {
         super.initProp();
         m = int(Math.random() * 2) * 900;
         n = Math.floor(Math.random() * 200) + 200;
         stoneMC.x = m;
         stoneMC.y = n;
         ConSprite.con.addChild(stoneMC);
         soundBool = true;
      }
   }
}

