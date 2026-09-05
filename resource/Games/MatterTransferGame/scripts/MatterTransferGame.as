package
{
   import com.ming.managers.utils.display.DisplayUtil;
   import data.MapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.utils.getDefinitionByName;
   import gs.TweenLite;
   import ui.BackGround;
   import ui.Light;
   import ui.LineSprite;
   import ui.MatterBlock;
   import ui.NearbyArrowHead;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class MatterTransferGame extends Sprite
   {
      
      private var _level:uint;
      
      private var _levelPanel:MovieClip;
      
      private var _clickMb:MatterBlock;
      
      private var xmlCls:Class;
      
      private var _light:Light;
      
      private var _totalEnergyNum:uint = 5;
      
      private var _bStarted:Boolean = false;
      
      private var _nextLinkBlockArr:Array;
      
      private var _energyDisplayPanel:MovieClip;
      
      private var _startBlockArr:Array;
      
      private var _btnSoundPanel:MovieClip;
      
      private var _passedLevel:uint = 0;
      
      private var _mapXML:XML;
      
      private var _movedLight:Light;
      
      private var _nearbyAH:NearbyArrowHead;
      
      private var _gameSoundChal:SoundChannel;
      
      private var _gameSound:Sound;
      
      private var _energyNum:uint = 0;
      
      private var _hasLinker:Boolean = false;
      
      private var _bSdPlay:Boolean = true;
      
      private var _bg:BackGround;
      
      private var _startPoint:Point;
      
      private var _bgMask:Sprite;
      
      private var _gameStartPanel:MovieClip;
      
      private var _finishBlockArr:Array;
      
      private var _arrowHeadArr:Array;
      
      private var _lineSprite:LineSprite;
      
      public function MatterTransferGame()
      {
         var helpMc:MovieClip = null;
         xmlCls = MatterTransferGame_xmlCls;
         _mapXML = XML(new xmlCls());
         _level = Math.floor(Math.random() * 3) + 1;
         _nextLinkBlockArr = [];
         _startBlockArr = [];
         _arrowHeadArr = [];
         _finishBlockArr = [];
         super();
         createBg();
         _gameStartPanel = new StartGamePanel();
         this.addChild(_gameStartPanel);
         helpMc = _gameStartPanel["helpMC"];
         helpMc.visible = false;
         _gameStartPanel["startBtn"].addEventListener(MouseEvent.CLICK,startGame);
         _gameStartPanel["closeBtn"].addEventListener(MouseEvent.CLICK,closeGame);
         _gameStartPanel["helpBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            helpMc.visible = true;
            helpMc.scaleX = 0;
            helpMc.scaleY = 0;
            TweenLite.to(helpMc,0.5,{
               "scaleX":1,
               "scaleY":1
            });
         });
         helpMc["closeBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            helpMc.visible = false;
         });
      }
      
      public function get totalEnergyNum() : uint
      {
         return _totalEnergyNum;
      }
      
      private function createSound() : void
      {
         _gameSound = new GameSound();
         _gameSoundChal = _gameSound.play();
      }
      
      private function gameOver() : void
      {
         var gameoverPanel:MovieClip = null;
         trace("Game Over");
         destroy();
         gameoverPanel = new GameOverPanel();
         this.addChild(gameoverPanel);
         gameoverPanel.x = -80;
         gameoverPanel.y = 150;
         gameoverPanel.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            var cls:Class = null;
            if(gameoverPanel.currentFrame == gameoverPanel.totalFrames)
            {
               gameoverPanel.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               DisplayUtil.removeForParent(gameoverPanel);
               gameoverPanel = null;
               cls = getDefinitionByName("org.taomee.events.DynamicEvent") as Class;
               loaderInfo.sharedEvents.dispatchEvent(new cls("False_TransferGame",_passedLevel));
            }
         });
      }
      
      private function createLevelPanel() : void
      {
         _levelPanel = new LevelDisplayPanel();
         this.addChild(_levelPanel);
         _levelPanel.x = 960;
         _levelPanel.y = -_levelPanel.height;
         TweenLite.to(_levelPanel,0.5,{
            "x":960 - _levelPanel.width,
            "y":0
         });
         _levelPanel["levelTxt"].text = _passedLevel + 1;
      }
      
      public function set totalEnergyNum(value:uint) : void
      {
         _totalEnergyNum = value;
      }
      
      private function energy() : void
      {
         if(_energyNum >= totalEnergyNum)
         {
            _energyNum = totalEnergyNum;
         }
         if(_energyNum <= 0)
         {
            _energyNum = 0;
         }
      }
      
      private function createLine() : void
      {
         _lineSprite = new LineSprite();
         this.addChild(_lineSprite);
         _movedLight = new Light();
      }
      
      private function closeGame(evt:MouseEvent) : void
      {
         destroy();
         DisplayUtil.removeForParent(_gameStartPanel);
         _gameStartPanel = null;
      }
      
      private function passGame() : void
      {
         var gamePassPanel:MovieClip = null;
         destroy();
         if(_passedLevel == 4)
         {
            gamePassPanel = new GamePassPanel();
            this.addChild(gamePassPanel);
            gamePassPanel.x = -80;
            gamePassPanel.y = 150;
            gamePassPanel.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
            {
               var cls:Class = null;
               if(gamePassPanel.currentFrame == gamePassPanel.totalFrames)
               {
                  gamePassPanel.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  DisplayUtil.removeForParent(gamePassPanel);
                  gamePassPanel = null;
                  cls = getDefinitionByName("org.taomee.events.DynamicEvent") as Class;
                  loaderInfo.sharedEvents.dispatchEvent(new cls("Pass_TransferGame",5));
               }
            });
         }
         else
         {
            nextLevel();
         }
      }
      
      private function clickMatterBlock(evt:MouseEvent) : void
      {
         var mc:MatterBlock = evt.currentTarget as MatterBlock;
         if(mc == null || !mc.clickable)
         {
            return;
         }
         currentBlockStatus(mc);
      }
      
      private function createBtnSdPanle() : void
      {
         _btnSoundPanel = new BtnSoundPanel();
         this.addChild(_btnSoundPanel);
         _btnSoundPanel.x = 960;
         _btnSoundPanel.y = 560;
         TweenLite.to(_btnSoundPanel,0.5,{
            "x":960 - _btnSoundPanel.width,
            "y":560 - _btnSoundPanel.height
         });
         _btnSoundPanel["quitBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            gameOver();
         });
         _btnSoundPanel["soundBtn"].gotoAndStop(1);
         _btnSoundPanel["soundBtn"].buttonMode = true;
         _btnSoundPanel["soundBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            if(_bSdPlay)
            {
               _btnSoundPanel["soundBtn"].gotoAndStop(2);
               _bSdPlay = false;
               _gameSoundChal.stop();
            }
            else
            {
               _btnSoundPanel["soundBtn"].gotoAndStop(1);
               _bSdPlay = true;
               _gameSoundChal = _gameSound.play();
            }
         });
      }
      
      private function createEnergy() : void
      {
         _energyDisplayPanel = new EnergyDisplayPanel();
         this.addChild(_energyDisplayPanel);
         _energyDisplayPanel.x = -_energyDisplayPanel.width;
         _energyDisplayPanel.y = 560;
         TweenLite.to(_energyDisplayPanel,0.5,{
            "x":0,
            "y":468
         });
         _energyDisplayPanel["energyTxt"].htmlText = energyNum + " / " + "<font color=\'#92FEFE\'>" + totalEnergyNum + "</font>";
      }
      
      private function checkGameStatus() : void
      {
         if(_nextLinkBlockArr.length == 0)
         {
            if(hasPassGame())
            {
               passGame();
            }
            else
            {
               gameOver();
            }
            return;
         }
         if(energyNum <= 0)
         {
            if(hasPassGame())
            {
               passGame();
            }
            else
            {
               gameOver();
            }
            return;
         }
         if(hasPassGame())
         {
            passGame();
         }
      }
      
      private function currentBlockStatus(mc:MatterBlock) : void
      {
         var i:MatterBlock = null;
         var smb:MatterBlock = null;
         var ah:MovieClip = null;
         var m:MatterBlock = null;
         var arrowhead:MovieClip = null;
         var mb:MatterBlock = null;
         var ahName:String = null;
         var aH:MovieClip = null;
         if(!_bStarted)
         {
            for each(smb in _startBlockArr)
            {
               smb.buttonMode = false;
               smb.removeEventListener(MouseEvent.CLICK,clickMatterBlock);
            }
            for each(ah in _arrowHeadArr)
            {
               DisplayUtil.removeForParent(ah);
               ah = null;
            }
            _arrowHeadArr = [];
            for each(m in _finishBlockArr)
            {
               if(!m.bFilled)
               {
                  arrowhead = new ArrowheadMC();
                  arrowhead.x = m.x;
                  arrowhead.y = m.y;
                  arrowhead.name = "arrowheadMC" + m.rows + "_" + m.cols;
                  this.addChild(arrowhead);
               }
            }
            _nearbyAH = new NearbyArrowHead();
         }
         _clickMb = mc;
         mc.bFilled = true;
         mc.clickable = false;
         mc.buttonMode = false;
         mc.removeEventListener(MouseEvent.CLICK,clickMatterBlock);
         _light = new Light();
         this.addChild(_light);
         _light.x = mc.x;
         _light.y = mc.y - 10;
         this.addChild(_nearbyAH);
         _nearbyAH.x = mc.x;
         _nearbyAH.y = mc.y;
         _nearbyAH.showNearbyAH(mc.nearbyBlockArr);
         if(_bStarted)
         {
            if(_startPoint)
            {
               _lineSprite.endDraw(_startPoint,new Point(mc.x,mc.y - 10));
            }
            for each(mb in _nextLinkBlockArr)
            {
               mb.buttonMode = false;
               mb.removeEventListener(MouseEvent.CLICK,clickMatterBlock);
               mb.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveBlock);
            }
            _nextLinkBlockArr = [];
            if(mc.type == 5)
            {
               ahName = "arrowheadMC" + mc.rows + "_" + mc.cols;
               aH = this.getChildByName(ahName) as MovieClip;
               DisplayUtil.removeForParent(aH);
               aH = null;
            }
            if(mc.type >= 7)
            {
               autoTransfer(mc);
               return;
            }
         }
         checkEnergy(mc);
         _startPoint = new Point(mc.x,mc.y - 10);
         for each(i in mc.nearbyBlockArr)
         {
            if(i)
            {
               if(!i.bFilled)
               {
                  i.clickable = true;
                  i.buttonMode = true;
                  _nextLinkBlockArr.push(i);
                  i.addEventListener(MouseEvent.CLICK,clickMatterBlock);
                  i.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveBlock);
               }
            }
         }
         _bStarted = true;
         checkGameStatus();
      }
      
      private function checkEnergy(mc:MatterBlock) : void
      {
         if(mc.energy >= 1)
         {
            energyNum += mc.energy;
         }
         else
         {
            energyNum -= mc.energyCost;
         }
         if(mc.type == 6)
         {
            energyNum = totalEnergyNum;
         }
         if(mc.maxEnergy >= 1)
         {
            totalEnergyNum += mc.maxEnergy;
         }
         _energyDisplayPanel["energyTxt"].htmlText = energyNum + " / " + "<font color=\'#92FEFE\'>" + totalEnergyNum + "</font>";
      }
      
      private function initGame() : void
      {
         createBg();
         createSound();
         createMap();
         createEnergy();
         createLevelPanel();
         createBtnSdPanle();
         createLine();
      }
      
      private function autoTransfer(mb:MatterBlock) : void
      {
         var tp:Point = null;
         var targetMb:MatterBlock = null;
         if(mb.type >= 7)
         {
            tp = MapData.gameMapDic[mb.targetID[0] + "_" + mb.targetID[1]];
            targetMb = MapData.gameBlockDic[tp.x + "_" + tp.y];
            if(targetMb == null || targetMb.bFilled)
            {
               trace("targetMb is null!");
               gameOver();
               return;
            }
            _lineSprite.endDraw(new Point(mb.x,mb.y - 10),new Point(targetMb.x,targetMb.y - 10));
            _light = new Light();
            this.addChild(_light);
            _light.x = targetMb.x;
            _light.y = targetMb.y - 10;
            mb.bFilled = true;
            autoTransfer(targetMb);
            checkEnergy(targetMb);
         }
         else
         {
            _startPoint = null;
            currentBlockStatus(mb);
         }
      }
      
      public function set energyNum(value:uint) : void
      {
         _energyNum = value;
         energy();
      }
      
      private function createMap() : void
      {
         var _mapXMLList:XMLList = null;
         var num:uint = 0;
         var i:uint = 0;
         var item:XML = null;
         var c:uint = 0;
         var r:uint = 0;
         var t:uint = 0;
         var mb:MatterBlock = null;
         var p:Point = null;
         var arrowhead:MovieClip = null;
         var tr:String = null;
         var tc:String = null;
         _mapXMLList = _mapXML.gamemap.(@level == _level).block;
         num = uint(_mapXMLList.length());
         for(i = 0; i < num; i++)
         {
            item = _mapXMLList[i];
            c = uint(item.@col);
            r = uint(item.@row);
            t = uint(item.@type);
            mb = new MatterBlock(r,c,t);
            this.addChild(mb);
            p = MapData.gameMapDic[r + "_" + c];
            mb.x = p.x;
            mb.y = p.y;
            if(mb.type == 5)
            {
               _finishBlockArr.push(mb);
            }
            if(mb.type == 6)
            {
               mb.clickable = true;
               mb.buttonMode = true;
               mb.addEventListener(MouseEvent.CLICK,clickMatterBlock);
               _startBlockArr.push(mb);
               arrowhead = new ArrowheadMC();
               arrowhead.x = mb.x;
               arrowhead.y = mb.y;
               this.addChild(arrowhead);
               _arrowHeadArr.push(arrowhead);
            }
            MapData.gameBlockDic[p.x + "_" + p.y] = mb;
            if(mb.type >= 7)
            {
               tr = item.@target.split("|")[1];
               tc = item.@target.split("|")[0];
               mb.targetID = [tr,tc];
            }
            _nextLinkBlockArr = [];
         }
      }
      
      private function nextLevel() : void
      {
         var nextLevelMC:MovieClip = null;
         destroy();
         ++_passedLevel;
         _level = _passedLevel * 3 + Math.floor(Math.random() * 3) + 1;
         nextLevelMC = new NextLevelMC();
         this.addChild(nextLevelMC);
         nextLevelMC.x = -80;
         nextLevelMC.y = 150;
         nextLevelMC.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            if(nextLevelMC.currentFrame == nextLevelMC.totalFrames)
            {
               nextLevelMC.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               DisplayUtil.removeForParent(nextLevelMC);
               nextLevelMC = null;
               startGame();
            }
         });
      }
      
      private function onMouseMoveBlock(evt:MouseEvent) : void
      {
         var i:MatterBlock = null;
         clearConnect();
         for each(i in _nextLinkBlockArr)
         {
            if(i.hitTestPoint(mouseX,mouseY,true))
            {
               _lineSprite.startDraw(new Point(_clickMb.x,_clickMb.y));
               _lineSprite.draw(_startPoint,new Point(mouseX,mouseY));
               this.addChild(_movedLight);
               _movedLight.x = mouseX;
               _movedLight.y = mouseY;
               break;
            }
            clearConnect();
         }
      }
      
      private function clearConnect() : void
      {
         _lineSprite.clear();
         DisplayUtil.removeForParent(_movedLight);
      }
      
      public function get energyNum() : uint
      {
         return _energyNum;
      }
      
      private function createBg() : void
      {
         var bg:MovieClip = new BackGroundMC();
         this.addChild(bg);
         _bg = new BackGround();
         _bg.drawBg();
         this.addChild(_bg);
      }
      
      private function hasPassGame() : Boolean
      {
         var mb:MatterBlock = null;
         for each(mb in _finishBlockArr)
         {
            if(!mb.bFilled)
            {
               return false;
            }
         }
         return true;
      }
      
      private function initEvent() : void
      {
      }
      
      private function destroy() : void
      {
         DisplayUtil.removeAllChild(this);
         _bg = null;
         _bgMask = null;
         _light = null;
         _movedLight = null;
         _lineSprite = null;
         _clickMb = null;
         _nearbyAH = null;
         _startPoint = null;
         _nextLinkBlockArr = [];
         _finishBlockArr = [];
         energyNum = 0;
         _totalEnergyNum = 5;
         _nextLinkBlockArr = [];
         _bStarted = false;
         _startBlockArr = [];
         _arrowHeadArr = [];
         _finishBlockArr = [];
         MapData.destroy();
      }
      
      private function startGame(evt:MouseEvent = null) : void
      {
         DisplayUtil.removeForParent(_gameStartPanel);
         _gameStartPanel = null;
         initGame();
      }
   }
}

