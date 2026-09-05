package com.robot.module.app
{
   import com.robot.app.spacesurvey.SurveyResultXMLInfo;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.event.MCLoadEvent;
   import com.robot.core.info.SystemTimeInfo;
   import com.robot.core.info.pet.PetBargeListInfo;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.newloader.MCLoader;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import org.taomee.component.containers.HBox;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.component.control.UIMovieClip;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ExploreStationManager extends Sprite implements IModule
   {
      
      private var progressMC:MovieClip;
      
      private var starCtOne:HBox;
      
      private var mainMC:MovieClip;
      
      private var airStarHBox:HBox;
      
      private var petContainer:HBox;
      
      private var startDate:Date;
      
      private var startHboxArr:Array = [];
      
      private var mapEnergyList:Array = [];
      
      private var namestr:String = "";
      
      private var closeBtn:SimpleButton;
      
      private var energyList:Array = [];
      
      private var introlTxt:TextField;
      
      private var dayCount:uint;
      
      private var soilStarHBox:HBox;
      
      private var resumePanel:MovieClip;
      
      private var energyContainer:HBox;
      
      private const SPACE:uint = 80;
      
      private var starCtTwo:HBox;
      
      private var waterStarHBox:HBox;
      
      private var mapPetsList:Array = [];
      
      private var resumeBtn:SimpleButton;
      
      private var bargePetList:Array = [];
      
      private var startStarNumArr:Array = [];
      
      private var spaceNameTxt:TextField;
      
      public function ExploreStationManager()
      {
         super();
      }
      
      public function setup() : void
      {
      }
      
      private function onLoadPet(index:uint, petsArr:Array) : Function
      {
         var func:Function = function(o:DisplayObject):void
         {
            var bmp:Bitmap;
            var _showMc:MovieClip = null;
            _showMc = o as MovieClip;
            var bg:MovieClip = new IconBgMC();
            var loadPanel:MLoadPane = new MLoadPane(null,MLoadPane.FIT_HEIGHT);
            loadPanel.setSizeWH(bg.width - 10,bg.height - 10);
            loadPanel.x = loadPanel.y = 5;
            bg.addChild(loadPanel);
            if(_showMc)
            {
               _showMc.gotoAndStop("rightdown");
               _showMc.addEventListener(Event.ENTER_FRAME,function():void
               {
                  var mc:MovieClip = _showMc.getChildAt(0) as MovieClip;
                  if(mc)
                  {
                     mc.gotoAndStop(1);
                     _showMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  }
               });
               DisplayUtil.stopAllMovieClip(_showMc);
            }
            bmp = DisplayUtil.copyDisplayAsBmp(_showMc);
            bmp.x = bmp.y = 0;
            if(checkPetIsBarge(mapPetsList[index]))
            {
               loadPanel.setIcon(bmp);
               ToolTipManager.add(bg,PetXMLInfo.getName(petsArr[index]));
            }
            else
            {
               bg.addChild(new UnknowPetMC());
            }
            petContainer.append(new UIMovieClip(bg));
         };
         return func;
      }
      
      public function init(data:Object = null) : void
      {
         var energysS:String;
         var k:uint;
         var petsS:String;
         namestr = data.toString();
         mainMC = new ExploreStationMC();
         introlTxt = mainMC["introl_txt"];
         spaceNameTxt = mainMC["spaceName_txt"];
         petContainer = new HBox();
         petContainer.isMask = false;
         mainMC.addChild(petContainer);
         petContainer.x = 40;
         petContainer.y = 140;
         energyContainer = new HBox();
         energyContainer.isMask = false;
         mainMC.addChild(energyContainer);
         energyContainer.x = 40;
         energyContainer.y = 228;
         closeBtn = mainMC["close_btn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeStationPanel);
         resumeBtn = mainMC["resumeBtn"];
         resumeBtn.addEventListener(MouseEvent.CLICK,showResumePanel);
         resumePanel = new ResumePanel();
         resumePanel["readResourceBtn"].addEventListener(MouseEvent.CLICK,showResourcePanel);
         resumePanel["startResumeBtn"].addEventListener(MouseEvent.CLICK,startResume);
         resumePanel["closeBtn"].addEventListener(MouseEvent.CLICK,closeResumePanel);
         progressMC = resumePanel["progressMC"];
         airStarHBox = new HBox(4);
         airStarHBox.setSizeWH(60,12);
         soilStarHBox = new HBox(4);
         soilStarHBox.setSizeWH(60,12);
         waterStarHBox = new HBox(4);
         waterStarHBox.setSizeWH(60,12);
         startHboxArr = [airStarHBox,soilStarHBox,waterStarHBox];
         startStarNumArr = [2,1,1];
         starCtOne = new HBox(8);
         starCtOne.setSizeWH(200,12);
         starCtTwo = new HBox(105);
         starCtTwo.setSizeWH(600,12);
         for(k = 0; k < 3; k++)
         {
            starCtOne.append(startHboxArr[k]);
         }
         mainMC.addChild(starCtOne);
         starCtOne.x = 40;
         starCtOne.y = 390;
         resumePanel.addChild(starCtTwo);
         starCtTwo.x = 75;
         starCtTwo.y = 140;
         petsS = SurveyResultXMLInfo.getPetsByName(namestr);
         mapPetsList = petsS.split("|");
         energysS = SurveyResultXMLInfo.getEnergysByName(namestr);
         mapEnergyList = energysS.split("|");
         startDate = new Date(2009,11,18);
         SocketConnection.addCmdListener(CommandID.SYSTEM_TIME,function(event:SocketEvent):void
         {
            var num:uint = 0;
            var j:uint = 0;
            SocketConnection.removeCmdListener(CommandID.SYSTEM_TIME,arguments.callee);
            var date:Date = (event.data as SystemTimeInfo).date;
            dayCount = (date.getTime() - startDate.getTime()) / 1000 / 60 / 60 / 24;
            var frame:uint = progressMC.totalFrames / 20 * dayCount;
            progressMC.gotoAndStop(frame);
            for(var i:uint = 0; i < 3; i++)
            {
               num = Math.floor(dayCount / 20) + startStarNumArr[i];
               if(num > 5)
               {
                  num = 5;
               }
               for(j = 0; j < num; j++)
               {
                  startHboxArr[i].append(new UIMovieClip(new StarMC()));
               }
            }
         });
         SocketConnection.send(CommandID.SYSTEM_TIME);
         SocketConnection.addCmdListener(CommandID.PET_BARGE_LIST,function(event:SocketEvent):void
         {
            SocketConnection.removeCmdListener(CommandID.PET_BARGE_LIST,arguments.callee);
            var data:PetBargeListInfo = event.data as PetBargeListInfo;
            bargePetList = data.petBargeIdList;
            loadPet();
         });
         SocketConnection.send(CommandID.PET_BARGE_LIST,105,120);
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,function(evt:ItemEvent):void
         {
            ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,arguments.callee);
            energyList = ItemManager.getCollectionIDs();
            loadItem();
         });
         ItemManager.getCollection();
      }
      
      public function show() : void
      {
         petContainer.removeAll();
         energyContainer.removeAll();
         DisplayUtil.align(mainMC,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainMC);
         introlTxt.text = SurveyResultXMLInfo.getIntrolInfo(namestr);
         spaceNameTxt.text = namestr;
      }
      
      private function onLoadItem(index:uint, energysArr:Array) : Function
      {
         var func:Function = function(o:DisplayObject):void
         {
            var _showMc:MovieClip = o as MovieClip;
            _showMc.gotoAndStop(1);
            var bg:MovieClip = new IconBgMC();
            var loadPanel:MLoadPane = new MLoadPane(_showMc);
            loadPanel.setSizeWH(bg.width - 10,bg.height - 10);
            loadPanel.x = loadPanel.y = 5;
            loadPanel.setSizeWH(bg.width,bg.height);
            if(hasEnergy(mapEnergyList[index]))
            {
               bg.addChild(loadPanel);
               ToolTipManager.add(bg,ItemXMLInfo.getName(energysArr[index]));
            }
            else
            {
               bg.addChild(new UnknowEnergyMC());
            }
            energyContainer.append(new UIMovieClip(bg));
         };
         return func;
      }
      
      private function loadItem() : void
      {
         var i:uint = 0;
         var bg:MovieClip = null;
         if(mapEnergyList.length >= 1 && mapEnergyList[0] != "")
         {
            for(i = 0; i < mapEnergyList.length; i++)
            {
               ResourceManager.getResource(ItemXMLInfo.getIconURL(uint(mapEnergyList[i])),onLoadItem(i,mapEnergyList),"item");
            }
         }
         else
         {
            bg = new IconBgMC();
            bg.addChild(new UnknowEnergyMC());
            energyContainer.append(new UIMovieClip(bg));
         }
      }
      
      private function showResumePanel(evt:MouseEvent) : void
      {
         closeStationPanel();
         DisplayUtil.align(resumePanel,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(resumePanel);
         for(var k:uint = 0; k < 3; k++)
         {
            starCtTwo.append(startHboxArr[k]);
         }
      }
      
      private function onBeginGame(evt:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.JOIN_GAME,onBeginGame);
         var by:ByteArray = evt.data as ByteArray;
         var gameID:uint = by.readUnsignedInt();
         SocketConnection.addCmdListener(CommandID.GAME_OVER,onGameOver);
      }
      
      private function startResume(evt:MouseEvent) : void
      {
         destroy();
         var url:String = "resource/Games/MatterTransferGame.swf";
         var mcloader:MCLoader = new MCLoader(url,LevelManager.appLevel,1,"加载中");
         mcloader.addEventListener(MCLoadEvent.SUCCESS,onLoaded);
         mcloader.doLoad();
      }
      
      private function showResourcePanel(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(resumePanel);
         DisplayUtil.align(mainMC,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainMC);
         for(var k:uint = 0; k < 3; k++)
         {
            starCtOne.append(startHboxArr[k]);
         }
      }
      
      private function checkPetIsBarge(petID:uint) : Boolean
      {
         var id:uint = 0;
         for each(id in bargePetList)
         {
            if(id == petID)
            {
               return true;
            }
         }
         return false;
      }
      
      private function closeResumePanel(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(resumePanel);
      }
      
      private function closeStationPanel(event:MouseEvent = null) : void
      {
         DisplayUtil.removeForParent(mainMC);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this);
      }
      
      private function hasEnergy(id:uint) : Boolean
      {
         var i:uint = 0;
         for each(i in energyList)
         {
            if(id == i)
            {
               return true;
            }
         }
         return false;
      }
      
      private function loadPet() : void
      {
         var i:uint = 0;
         if(mapPetsList.length > 0)
         {
            for(i = 0; i < mapPetsList.length; i++)
            {
               ResourceManager.getResource(ClientConfig.getPetSwfPath(uint(mapPetsList[i])),onLoadPet(i,mapPetsList),"pet");
            }
         }
      }
      
      private function onLoaded(event:MCLoadEvent) : void
      {
         var mcloader:MCLoader = null;
         var content:Sprite = event.getContent() as Sprite;
         MainManager.getStage().addChild(content);
         SocketConnection.addCmdListener(CommandID.JOIN_GAME,onBeginGame);
         SocketConnection.send(CommandID.JOIN_GAME,1);
         mcloader = event.currentTarget as MCLoader;
         mcloader.sharedEvents.addEventListener("False_TransferGame",function(evt:DynamicEvent):void
         {
            mcloader.sharedEvents.removeEventListener("False_TransferGame",arguments.callee);
            var precent:uint = 0;
            precent = 20 * uint(evt.paramObject);
            SocketConnection.send(CommandID.GAME_OVER,precent,precent);
         });
         mcloader.sharedEvents.addEventListener("Pass_TransferGame",function(evt:DynamicEvent):void
         {
            mcloader.sharedEvents.removeEventListener("Pass_TransferGame",arguments.callee);
            SocketConnection.send(CommandID.GAME_OVER,100,100);
         });
      }
      
      private function onGameOver(evt:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.GAME_OVER,onGameOver);
      }
      
      public function destroy() : void
      {
         petContainer.destroy();
         energyContainer.destroy();
         DisplayUtil.removeForParent(mainMC);
         DisplayUtil.removeForParent(resumePanel);
      }
   }
}

