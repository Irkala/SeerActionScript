package
{
   import aero.enemies.BlueEnemy;
   import aero.enemies.BlueEnemyOne;
   import aero.enemies.BlueEnemyTwo;
   import aero.enemies.Boss.Boss;
   import aero.enemies.Boss.BossFour;
   import aero.enemies.Boss.BossOne;
   import aero.enemies.Boss.BossThree;
   import aero.enemies.Boss.BossTwo;
   import aero.enemies.RedEnemy;
   import aero.enemies.RedEnemyOne;
   import aero.enemies.RedEnemyTwo;
   import aero.player.Fighter;
   import com.ming.managers.utils.display.DisplayUtil;
   import com.ming.managers.utils.keyBoard.PopKeys;
   import element.Elements;
   import explodes.Explode;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.media.SoundChannel;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import interfaces.IGameSubject;
   import layers.Layer;
   import sounds.GameSounds;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class ThruAeroliteGame extends Sprite
   {
      
      private var _level:uint = 1;
      
      private var _scene:Sprite;
      
      private var _skyLayer:Layer;
      
      private var _bonusLayer:Layer;
      
      private var _introPanel:MovieClip;
      
      private var _enemyArr:Array = [];
      
      private var _bgSoundChl:SoundChannel;
      
      private var _bossNum:uint = 0;
      
      private var _fighterNum:MovieClip;
      
      private var _friendsArr:Array = [];
      
      private var _bulletLayer:Layer;
      
      private var _playerLayer:Layer;
      
      private var _playerArr:Array = [];
      
      private var _timeCount:Number = 0;
      
      private var _helpPanel:MovieClip;
      
      private var _timer:Timer;
      
      private var _groundLayer:Layer;
      
      private var _subject:IGameSubject;
      
      private var _fighter:Fighter;
      
      public function ThruAeroliteGame()
      {
         super();
         init();
      }
      
      private function removeEnemies() : void
      {
         var elt:Elements = null;
         var ex:Explode = null;
         for(var i:uint = 0; i < _enemyArr.length; i++)
         {
            elt = _enemyArr[i] as Elements;
            if(elt.erasable)
            {
               if(elt.explodeable)
               {
                  ex = new Explode(elt.explodeType);
                  _skyLayer.addChild(ex);
                  ex.x = elt.x;
                  ex.y = elt.y;
               }
               _enemyArr.splice(i,1);
               elt.removeEvent();
               if(elt is BossOne)
               {
                  GameSounds.bossExplodeSound.play();
                  if(_fighter.hp > 0)
                  {
                     gameNextLevel();
                  }
               }
               else if(elt is Boss)
               {
                  GameSounds.bossExplodeSound.play();
                  if(_fighter.hp > 0)
                  {
                     ++_bossNum;
                     if(_bossNum == 2)
                     {
                        passGame();
                     }
                  }
               }
               DisplayUtil.removeAllChild(elt);
               DisplayUtil.removeForParent(elt);
               elt = null;
            }
         }
      }
      
      private function setFighterNum() : void
      {
         if(_fighter == null)
         {
            return;
         }
         if(_fighter.hp == 2)
         {
            _fighterNum["icon_2"].visible = false;
         }
         if(_fighter.hp == 1)
         {
            _fighterNum["icon_1"].visible = false;
         }
      }
      
      private function createBonusLayer() : void
      {
         _bonusLayer = new Layer(Layer.BONUS);
         _bonusLayer.useShadow = true;
         _scene.addChild(_bonusLayer);
      }
      
      private function init() : void
      {
         _introPanel = new IntroducePanel();
         this.addChild(_introPanel);
         _introPanel["startBtn"].addEventListener(MouseEvent.CLICK,onStartGame);
         _introPanel["closeBtn"].addEventListener(MouseEvent.CLICK,closeIntroPane);
         _introPanel["helpBtn"].addEventListener(MouseEvent.CLICK,showHelpPanel);
      }
      
      private function removePlayer() : void
      {
         var ex:Explode = null;
         if(_fighter)
         {
            if(_fighter.erasable)
            {
               if(_fighter.explodeable)
               {
                  ex = new Explode(_fighter.explodeType);
                  _skyLayer.addChild(ex);
                  ex.x = _fighter.x;
                  ex.y = _fighter.y;
               }
               DisplayUtil.removeForParent(_fighter);
               _fighter = null;
               gameOver();
            }
         }
      }
      
      private function creatBoss() : void
      {
         var boss_1:BossOne = null;
         var boss_4:BossFour = null;
         var boss_2:BossTwo = null;
         var boss_3:BossThree = null;
         switch(_level)
         {
            case 1:
               boss_1 = new BossOne();
               boss_1.targetsArr = _playerArr;
               _enemyArr.push(boss_1);
               _skyLayer.addChild(boss_1);
               boss_1.x = GameSettings.sceneWidth;
               boss_1.y = 50;
               break;
            case 2:
               boss_4 = new BossFour();
               boss_4.targetsArr = _playerArr;
               _enemyArr.push(boss_4);
               _skyLayer.addChild(boss_4);
               boss_4.x = GameSettings.sceneWidth - boss_4.width - 10;
               boss_4.y = 150;
               break;
            case 3:
               boss_2 = new BossTwo();
               boss_2.targetsArr = _playerArr;
               _enemyArr.push(boss_2);
               _skyLayer.addChild(boss_2);
               boss_2.x = GameSettings.sceneWidth - boss_2.width - 10;
               boss_2.y = 20;
               boss_3 = new BossThree();
               boss_3.targetsArr = _playerArr;
               _enemyArr.push(boss_3);
               _skyLayer.addChild(boss_3);
               boss_3.x = GameSettings.sceneWidth - boss_3.width - 10;
               boss_3.y = 250;
         }
      }
      
      private function initGame() : void
      {
         _scene = new Sprite();
         this.addChildAt(_scene,0);
         _scene.addEventListener(Event.ENTER_FRAME,onSceneEntFrame);
      }
      
      public function passGame() : void
      {
         var passGamePanel:MovieClip = null;
         destroy();
         passGamePanel = new PassGamePanel();
         this.addChild(passGamePanel);
         passGamePanel["againBtn"].visible = false;
         passGamePanel["confirmPassBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            DisplayUtil.removeForParent(passGamePanel);
            passGamePanel = null;
            var cls:Class = getDefinitionByName("org.taomee.events.DynamicEvent") as Class;
            loaderInfo.sharedEvents.dispatchEvent(new cls("Pass_ThruAeroGame",_level));
         });
         passGamePanel["againBtn"].visible = false;
      }
      
      private function onTimer(evt:TimerEvent) : void
      {
         if(_timeCount == 100)
         {
            creatBoss();
         }
         creatUnit();
         ++_timeCount;
      }
      
      private function creatUnit() : void
      {
         var r:uint = Math.random() * 5;
         creatElement(r);
      }
      
      private function closeHelpPanel(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(_helpPanel);
         _helpPanel = null;
      }
      
      private function createFighter() : void
      {
         _fighter = new Fighter();
         _fighter.bulletLayer = _bulletLayer;
         _fighter.targetsArr = _enemyArr;
         _playerLayer.addChild(_fighter);
         _fighter.x = _fighter.width / 2 + 50;
         _fighter.y = 200;
         _playerArr.push(_fighter);
         _fighterNum = new FighterNumMC();
         _playerLayer.addChild(_fighterNum);
         _fighterNum.x = GameSettings.sceneWidth - _fighterNum.width;
      }
      
      private function creatElement(i:uint) : void
      {
         var re:RedEnemy = null;
         var reo:RedEnemy = null;
         var ret:RedEnemy = null;
         var be:BlueEnemy = null;
         var beo:BlueEnemy = null;
         var bet:BlueEnemy = null;
         switch(i)
         {
            case 0:
               re = new RedEnemy();
               re.targetsArr = _playerArr;
               re.friendsArr = _friendsArr;
               _enemyArr.push(re);
               _skyLayer.addChild(re);
               re.x = GameSettings.sceneWidth - 50;
               re.y = Math.random() * (GameSettings.sceneHeight - 30);
               if(_level != 1)
               {
                  re.hp = 2;
                  re.scaleX = 1.5;
                  re.scaleY = 1.5;
               }
               break;
            case 2:
               reo = new RedEnemyOne();
               reo.targetsArr = _playerArr;
               reo.friendsArr = _friendsArr;
               _enemyArr.push(reo);
               _skyLayer.addChild(reo);
               reo.x = GameSettings.sceneWidth - 50;
               reo.y = Math.random() * (GameSettings.sceneHeight - 30);
               if(_level != 1)
               {
                  reo.hp = 2;
                  reo.scaleX = 1.5;
                  reo.scaleY = 1.5;
               }
               break;
            case 2:
               ret = new RedEnemyTwo();
               ret.targetsArr = _playerArr;
               ret.friendsArr = _friendsArr;
               _enemyArr.push(ret);
               _skyLayer.addChild(ret);
               ret.x = GameSettings.sceneWidth - 50;
               ret.y = Math.random() * (GameSettings.sceneHeight - 30);
               if(_level != 1)
               {
                  ret.hp = 2;
                  ret.scaleX = 1.5;
                  ret.scaleY = 1.5;
               }
               break;
            case 3:
               be = new BlueEnemy();
               be.targetsArr = _playerArr;
               be.friendsArr = _friendsArr;
               _enemyArr.push(be);
               _skyLayer.addChild(be);
               be.x = GameSettings.sceneWidth - 50;
               be.y = Math.random() * (GameSettings.sceneHeight - 30);
               if(_level != 1)
               {
                  be.hp = 2;
                  be.scaleX = 1.5;
                  be.scaleY = 1.5;
               }
               break;
            case 4:
               beo = new BlueEnemyOne();
               beo.targetsArr = _playerArr;
               beo.friendsArr = _friendsArr;
               _enemyArr.push(beo);
               _skyLayer.addChild(beo);
               beo.x = GameSettings.sceneWidth - 50;
               beo.y = Math.random() * (GameSettings.sceneHeight - 30);
               if(_level != 1)
               {
                  beo.hp = 2;
                  beo.scaleX = 1.5;
                  beo.scaleY = 1.5;
               }
               break;
            case 5:
               bet = new BlueEnemyTwo();
               bet.targetsArr = _playerArr;
               bet.friendsArr = _friendsArr;
               _enemyArr.push(bet);
               _skyLayer.addChild(bet);
               bet.x = GameSettings.sceneWidth - 50;
               bet.y = Math.random() * (GameSettings.sceneHeight - 30);
               if(_level != 1)
               {
                  bet.hp = 2;
                  bet.scaleX = 1.5;
                  bet.scaleY = 1.5;
               }
         }
      }
      
      private function createSkyLayer() : void
      {
         _skyLayer = new Layer(Layer.SKY);
         _skyLayer.useShadow = true;
         _scene.addChild(_skyLayer);
      }
      
      private function showHelpPanel(evt:MouseEvent) : void
      {
         _helpPanel = new HelpPanel();
         _helpPanel["startBtn"].addEventListener(MouseEvent.CLICK,onStartGame);
         _helpPanel["closeBtn"].addEventListener(MouseEvent.CLICK,closeHelpPanel);
         this.addChild(_helpPanel);
      }
      
      private function onSceneEntFrame(eve:Event) : void
      {
         removeEnemies();
         removePlayer();
         removeBonus();
         removeElement(_bulletLayer);
         removeElement(_skyLayer);
         setFighterNum();
      }
      
      private function createBulletLayer() : void
      {
         _bulletLayer = new Layer(Layer.BULLET);
         _bulletLayer.useShadow = true;
         _scene.addChild(_bulletLayer);
      }
      
      private function createPlayerLayer() : void
      {
         _playerLayer = new Layer(Layer.PLAYER);
         _playerLayer.useShadow = true;
         _scene.addChild(_playerLayer);
      }
      
      private function onStartGame(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(_helpPanel);
         _helpPanel = null;
         DisplayUtil.removeForParent(_introPanel);
         _introPanel = null;
         startGame();
      }
      
      private function removeElement(layer:Layer) : void
      {
         var belt:BasicElement = null;
         for(var i:uint = 0; i < layer.numChildren; i++)
         {
            belt = layer.getChildAt(i) as BasicElement;
            if(belt.erasable)
            {
               belt.removeEvent();
               DisplayUtil.removeForParent(belt);
               belt = null;
            }
         }
      }
      
      private function closeIntroPane(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(_introPanel);
         _introPanel = null;
         var cls:Class = getDefinitionByName("org.taomee.events.DynamicEvent") as Class;
         loaderInfo.sharedEvents.dispatchEvent(new cls("False_ThruAeroGame",0));
      }
      
      private function createBg() : void
      {
         var bg:BgMC = new BgMC();
         this.addChildAt(bg,0);
         bg.cacheAsBitmap = true;
      }
      
      public function gameOver() : void
      {
         var gameOverPanel:MovieClip = null;
         destroy();
         gameOverPanel = new GameOverPanel();
         this.addChild(gameOverPanel);
         gameOverPanel["overConfirmBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            DisplayUtil.removeForParent(gameOverPanel);
            gameOverPanel = null;
            var cls:Class = getDefinitionByName("org.taomee.events.DynamicEvent") as Class;
            loaderInfo.sharedEvents.dispatchEvent(new cls("False_ThruAeroGame",_level - 1));
         });
         gameOverPanel["tryAgainBtn"].visible = false;
      }
      
      private function createGroundLayer() : void
      {
         _groundLayer = new Layer(Layer.GROUND);
         _groundLayer.useShadow = true;
         _scene.addChild(_groundLayer);
      }
      
      public function startGame() : void
      {
         PopKeys.addStageLis(this.stage);
         this.stage.focus = this.stage;
         initGame();
         createBg();
         createGroundLayer();
         createBulletLayer();
         createBonusLayer();
         createSkyLayer();
         createPlayerLayer();
         createFighter();
         _timer = new Timer(500);
         _timer.addEventListener(TimerEvent.TIMER,onTimer);
         _timer.start();
         _bgSoundChl = GameSounds.bgSound.play(1000,1000);
      }
      
      public function destroy() : void
      {
         var layer:Layer = null;
         var mc:BasicElement = null;
         var elt:BasicElement = null;
         _scene.removeEventListener(Event.ENTER_FRAME,onSceneEntFrame);
         if(_timer)
         {
            _timer.removeEventListener(TimerEvent.TIMER,onTimer);
            _timer.stop();
            _timer = null;
         }
         while(_scene.numChildren > 0)
         {
            layer = _scene.getChildAt(0) as Layer;
            if(layer)
            {
               layer.clearLayer();
               DisplayUtil.removeForParent(layer);
               layer = null;
            }
         }
         DisplayUtil.removeAllChild(_scene);
         DisplayUtil.removeAllChild(_groundLayer);
         while(_bulletLayer.numChildren > 0)
         {
            mc = _bulletLayer.getChildAt(0) as BasicElement;
            if(mc)
            {
               _bulletLayer.removeChild(mc);
               mc.removeEvent();
               mc = null;
            }
         }
         DisplayUtil.removeAllChild(_bulletLayer);
         DisplayUtil.removeAllChild(_bonusLayer);
         while(_skyLayer.numChildren > 0)
         {
            elt = _skyLayer.getChildAt(0) as BasicElement;
            if(elt)
            {
               elt.removeEvent();
               _skyLayer.removeChild(elt);
               elt = null;
            }
         }
         DisplayUtil.removeAllChild(_skyLayer);
         DisplayUtil.removeAllChild(_playerLayer);
         DisplayUtil.removeAllChild(this);
         _playerArr = [];
         _friendsArr = [];
         _enemyArr = [];
         _timer = null;
         _timeCount = 0;
         _bgSoundChl.stop();
         _bgSoundChl = null;
      }
      
      private function removeBonus() : void
      {
      }
      
      public function gameNextLevel() : void
      {
         var nextLevelPanel:MovieClip = null;
         destroy();
         nextLevelPanel = new NextLevelPanel();
         this.addChild(nextLevelPanel);
         nextLevelPanel["nextLevelBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            DisplayUtil.removeAllChild(nextLevelPanel);
            DisplayUtil.removeForParent(nextLevelPanel);
            nextLevelPanel = null;
            ++_level;
            startGame();
         });
      }
   }
}

