package
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   import org.taomee.utils.DisplayUtil;
   import scr.GoldLevel.SetLevel;
   import scr.MainMethod.NextScrene;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class Miner extends Sprite
   {
      
      public static var goldArray:Array;
      
      public static var stageW:Number;
      
      public static var stageH:Number;
      
      private static var owner:Miner;
      
      public static var mainScrene:MainScrene;
      
      public static var soundBool:Boolean = true;
      
      public static var closeGameStr:String = "open";
      
      private var closeBtn:CloseButton;
      
      public var scoreObj:Object;
      
      private var actScrenePlay:ActionPlay;
      
      private var nextScr:NextScrene;
      
      private var soundCh:SoundChannel = new SoundChannel();
      
      private var closeSound:SimpleButton;
      
      private var closeSound2:SimpleButton;
      
      private var soundNum:Number = 0;
      
      public function Miner()
      {
         super();
         owner = this;
         actScrenePlay = new ActionPlay();
         soundCh = actScrenePlay.play(0,1000);
         mainScrene = new MainScrene();
         mainScrene.cacheAsBitmap = true;
         getRoot().addChildAt(mainScrene,0);
         mainScrene.scaleX = mainScrene.scaleY = 0.9;
         mainScrene.x = -350;
         mainScrene.y = -290;
         closeSound = new SoundClose();
         getRoot().addChild(closeSound);
         closeSound.x = 900;
         closeSound.y = 420;
         closeSound.scaleX = closeSound.scaleY = 1.7;
         closeSound.visible = true;
         closeSound.addEventListener(MouseEvent.CLICK,closeSoun);
         closeSound2 = new SoundClose2();
         getRoot().addChild(closeSound2);
         closeSound2.x = 900;
         closeSound2.y = 420;
         closeSound2.scaleX = closeSound2.scaleY = 1.7;
         closeSound2.visible = false;
         closeSound2.mouseEnabled = false;
         closeSound2.addEventListener(MouseEvent.CLICK,closeSoun);
         closeBtn = new CloseButton();
         getRoot().addChild(closeBtn);
         closeBtn.scaleX = closeBtn.scaleY = 0.8;
         closeBtn.x = 900;
         closeBtn.y = 10;
         closeBtn.addEventListener(MouseEvent.CLICK,closeGame);
         nextScr = new NextScrene();
         nextScr.central();
      }
      
      public static function gameOver(per:Number = 0, score:int = 0, paidou:int = 0) : void
      {
         closeGameStr = "closed";
         owner.scoreObj = new Object();
         owner.scoreObj.per = per;
         owner.scoreObj.score = score;
         owner.scoreObj.paidou = paidou;
         owner.dispatchEvent(new Event("shootGameOver"));
      }
      
      public static function getRoot() : Sprite
      {
         return owner;
      }
      
      private function closeGame(e:MouseEvent) : void
      {
         gameOver(SetLevel.hadScore / 35000 * 100,SetLevel.hadScore);
         trace(getRoot().numChildren);
         for(var i:uint = 0; i < getRoot().numChildren; i++)
         {
            getRoot().removeChildAt(0);
         }
         soundBool = false;
         soundCh.stop();
         if(NextScrene.con)
         {
            DisplayUtil.removeAllChild(NextScrene.con);
         }
         SetLevel.goldArray = [];
         DisplayUtil.removeAllChild(Miner.getRoot());
      }
      
      private function closeSoun(e:MouseEvent) : void
      {
         ++soundNum;
         if(soundNum % 2 != 0)
         {
            closeSound.visible = false;
            closeSound.mouseEnabled = false;
            closeSound2.visible = true;
            closeSound2.mouseEnabled = true;
            soundBool = false;
            soundCh.stop();
         }
         else
         {
            closeSound.visible = true;
            closeSound.mouseEnabled = true;
            closeSound2.visible = false;
            closeSound2.mouseEnabled = false;
            soundBool = true;
            soundCh = actScrenePlay.play(0,1000);
         }
      }
   }
}

