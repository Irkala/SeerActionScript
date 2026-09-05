package
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.text.TextField;
   import flash.utils.Timer;
   import gs.TweenLite;
   import org.taomee.utils.DisplayUtil;
   import starGame.game.Game;
   import starGame.game.StarArray;
   import starGame.game.lightFirst;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class theStarGame extends Sprite
   {
      
      private var level:int;
      
      private var soundArray:Array;
      
      private var _allArray:Array;
      
      private var gameFa_s:Sound;
      
      private var back_s:Sound;
      
      private var isNextB:Boolean;
      
      private var _time:Timer;
      
      private var _isSoundB:Boolean;
      
      private var main:MovieClip;
      
      private var _textStart:TextField;
      
      private var _tongBar:MovieClip;
      
      private var _falseBar:MovieClip;
      
      private var gameSucc_s:Sound;
      
      private var _lightFirst:MovieClip;
      
      private var jiandao_s:Sound;
      
      private var theLast_s:Sound;
      
      private var tongGuan_s:Sound;
      
      private var _sprite:Sprite;
      
      private var game:MovieClip;
      
      private var chanel:SoundChannel;
      
      private var stopIn_s:Sound;
      
      private var _enter_btn:SimpleButton;
      
      public function theStarGame()
      {
         super();
         initGame();
      }
      
      private function nextGame(e:Event) : void
      {
         isNextB = true;
         newGame();
      }
      
      private function showLevel(e:MouseEvent = null) : void
      {
         var starname:String = _allArray[level][0];
         _lightFirst = new lightFirst(level,starname);
         addChild(_lightFirst);
         _lightFirst.addEventListener("goingame",inGame);
         removeMain();
      }
      
      private function removeGame() : void
      {
         if(game)
         {
            if(game.alpha < 1)
            {
               game.removeEventListener(Event.ENTER_FRAME,gameAlphaEvent);
            }
            game.removeTimer();
            game.removeThis();
            removeChild(game);
         }
      }
      
      private function initGame() : void
      {
         back_s = new BackSound_StarGame();
         gameSucc_s = new GameSucc_StarGame();
         gameFa_s = new GameFaile_StarGame();
         theLast_s = new TheLastSound_StarGame();
         stopIn_s = new StopIn_StarGame();
         tongGuan_s = new TongGuan_StarGame();
         jiandao_s = new JianDao_StarGame();
         drawBack();
         level = 0;
         _isSoundB = true;
         _allArray = StarArray.getStarArray();
         chanel = back_s.play(0,999);
         initMain();
      }
      
      private function againGame(e:Event) : void
      {
         isNextB = false;
         newGame();
      }
      
      private function timeCompHandler(e:TimerEvent) : void
      {
         _time.removeEventListener(TimerEvent.TIMER_COMPLETE,timeCompHandler);
         _time = null;
         trace("level:" + level);
         if(isNextB)
         {
            ++level;
            if(level == 10)
            {
               if(_isSoundB)
               {
                  tongGuan_s.play(0,1);
               }
               SocketConnection.send(CommandID.GAME_OVER,100,690);
               destray();
            }
            else
            {
               removeGame();
               showLevel();
            }
         }
         else
         {
            removeGame();
            showLevel();
         }
      }
      
      private function inGame(e:Event = null) : void
      {
         isNextB = false;
         removeLightFirst();
         var array:Array = _allArray[level];
         game = new Game(level,array,MainManager.getStage(),gameSucc_s,stopIn_s,jiandao_s);
         game._isSoundB = _isSoundB;
         game.alpha = 0;
         addChild(game);
         game.addEventListener(Event.ENTER_FRAME,gameAlphaEvent);
         game.addEventListener("changesound",changeSound);
         game.addEventListener("closehandler",closeHandler);
      }
      
      private function closeHandler(e:Event) : void
      {
         gameFalse();
      }
      
      private function changeSound(e:Event) : void
      {
         _isSoundB = !_isSoundB;
         if(_isSoundB)
         {
            back_s = new BackSound_StarGame();
            chanel = back_s.play(0,999);
         }
         else
         {
            chanel.stop();
            back_s = null;
         }
      }
      
      private function newGame() : void
      {
         TweenLite.to(game,3,{"alpha":0});
         _time = new Timer(1000,3);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,timeCompHandler);
      }
      
      private function drawBack() : void
      {
         _sprite = new Sprite();
         _sprite.graphics.beginFill(0,1);
         _sprite.graphics.drawRect(0,0,960,560);
         _sprite.graphics.endFill();
         addChild(_sprite);
      }
      
      private function gameFalse(e:Event = null) : void
      {
         var score:Number = NaN;
         if(level <= 4)
         {
            score = level * 50;
         }
         else if(level > 4 && level <= 7)
         {
            score = (level - 4) * 80 + 250;
         }
         else if(level > 7)
         {
            score = 490 + (level - 8) * 100;
         }
         var bi:int = int(score / 690 * 100);
         SocketConnection.send(CommandID.GAME_OVER,bi,score);
         destray();
         if(_isSoundB)
         {
            gameFa_s.play(0,1);
         }
      }
      
      private function removeMain() : void
      {
         if(main)
         {
            trace("remove main");
            _enter_btn.removeEventListener(MouseEvent.CLICK,showLevel);
            _enter_btn = null;
            removeChild(main);
            main = null;
         }
      }
      
      private function removeLightFirst() : void
      {
         if(_lightFirst)
         {
            _lightFirst.removeEventListener("goingame",inGame);
            _lightFirst.removeThis();
            removeChild(_lightFirst);
            _lightFirst = null;
         }
      }
      
      private function destray() : void
      {
         trace("destrqy");
         if(chanel)
         {
            chanel.stop();
            chanel = null;
            back_s = null;
         }
         removeChild(_sprite);
         _sprite = null;
         removeMain();
         removeLightFirst();
         removeGame();
         DisplayUtil.removeForParent(this);
      }
      
      private function initMain() : void
      {
         main = new FirstUI_StarGame();
         addChild(main);
         _enter_btn = main["enter_btn"];
         _enter_btn.addEventListener(MouseEvent.CLICK,showLevel);
      }
      
      private function gameAlphaEvent(e:Event) : void
      {
         if(game.alpha < 1)
         {
            game.alpha += 0.02;
         }
         else
         {
            game.removeEventListener(Event.ENTER_FRAME,gameAlphaEvent);
            game.addEventListener("gamewin",nextGame);
            game.addEventListener("againgame",againGame);
            game.addEventListener("gamefalse",gameFalse);
         }
      }
   }
}

