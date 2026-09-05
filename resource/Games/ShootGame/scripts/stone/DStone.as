package stone
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class DStone extends BaseStone
   {
      
      private var soundBlood:SoundBlood;
      
      private var m:Number;
      
      private var n:Number;
      
      private var soundBool:Boolean;
      
      public function DStone()
      {
         super();
      }
      
      override protected function initMove() : void
      {
         trace(444);
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
         if(stoneMC.x < 490)
         {
            if(BuyGunObserver.bigThings.hitTestPoint(stoneMC.x,stoneMC.y))
            {
               stoneMC.ishited = true;
               stoneMC.x = BuyGunObserver.bigThings.x - 180;
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
            stoneMC.x = BuyGunObserver.bigThings.x + 170;
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
         return new EnemyStone4();
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

