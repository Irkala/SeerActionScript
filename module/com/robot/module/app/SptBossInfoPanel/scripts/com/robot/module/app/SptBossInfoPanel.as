package com.robot.module.app
{
   import com.robot.app.spt.FightBossController;
   import com.robot.app.spt.SptXmlInfo;
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.MapXMLInfo;
   import com.robot.core.config.xml.PetBookXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.manager.UIManager;
   import com.robot.core.utils.CommonUI;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class SptBossInfoPanel extends SimpleModule
   {
      
      public static const START_CLOSE:String = "startClose";
      
      public static const NORMAL_CLOSE:String = "normalClose";
      
      private var _sptId:int = 0;
      
      private var _petId:int;
      
      private var _parentPetIDs:Array;
      
      private var soundCh:SoundChannel;
      
      private var bossName:String;
      
      private var bossIndex:int;
      
      private var gIndex:int;
      
      public function SptBossInfoPanel()
      {
         super();
      }
      
      override public function setup() : void
      {
         _ui = new SptBossInfo_ui();
         addMoudleEvent(_ui["sound"],MouseEvent.CLICK,this.onSoundClick);
         addMoudleEvent(_ui["statr_btn"],MouseEvent.CLICK,function(e:*):void
         {
            hide();
            ModuleManager.dispatchEvent(new DataEvent(ModuleManager.MODEL_CLOSE,true,true,START_CLOSE));
            FightBossController.startFight(bossName,bossIndex,gIndex);
         });
      }
      
      override protected function onClose(e:*) : void
      {
         super.onClose(e);
         ModuleManager.dispatchEvent(new DataEvent(ModuleManager.MODEL_CLOSE,true,true,NORMAL_CLOSE));
      }
      
      override public function init(data:Object = null) : void
      {
         this.bossName = data["bossName"];
         this.bossIndex = data["index"];
         this.gIndex = data["gIndex"];
      }
      
      private function setData() : void
      {
         this._sptId = SptXmlInfo.getIdByTitle(this.bossName);
         this._petId = SptXmlInfo.getPetIdByID(this._sptId);
         this._parentPetIDs = PetXMLInfo.getParentIDs(this._petId);
      }
      
      override public function show() : void
      {
         this.setData();
         this.initPanel();
         super.show();
         if(this._sptId == 0)
         {
            this.onClose(null);
            FightBossController.startFight(this.bossName,this.bossIndex,this.gIndex);
         }
      }
      
      private function initPanel() : void
      {
         var typeBtn:SimpleButton;
         ResourceManager.getResource(ClientConfig.getPetSwfPath(this._petId),function(mc:MovieClip):void
         {
            mc.gotoAndStop("right");
            addMoudleEvent(mc,Event.ENTER_FRAME,function(e:*):void
            {
               var petMv:MovieClip = mc.getChildAt(0) as MovieClip;
               if(null != petMv)
               {
                  petMv.stop();
                  DisplayUtil.stopAllMovieClip(petMv);
               }
            });
            mc.scaleX = mc.scaleY = petContainer.width / mc.width < petContainer.height / mc.height ? petContainer.width / mc.width : petContainer.height / mc.height;
            petContainer.addChild(mc);
            CommonUI.centerAlign(mc,petContainer,new Point(0,0));
         },"pet");
         if(TasksManager.getTaskStatus(this._sptId) == TasksManager.COMPLETE)
         {
            _ui["win"].visible = true;
         }
         else
         {
            _ui["win"].visible = false;
         }
         typeBtn = UIManager.getButton("Icon_PetType_" + PetXMLInfo.getType(this._petId));
         DisplayUtil.removeAllChild(this.typeMv);
         this.typeMv.addChild(typeBtn);
         CommonUI.centerAlign(this.typeMv,this.typeMv,new Point(0,0));
         this.initParentPet();
         (_ui["boss_name"] as TextField).text = PetXMLInfo.getName(this._petId);
         (_ui["heigh"] as TextField).text = PetBookXMLInfo.getHeight(this._petId) + "cm";
         (_ui["weight"] as TextField).text = PetBookXMLInfo.getWeight(this._petId) + "Kg";
         (_ui["map"] as TextField).text = MapXMLInfo.getName(SptXmlInfo.getMapByID(this._sptId));
         (_ui["fenxi"] as TextField).text = "     " + SptXmlInfo.getDescriptionByID(this._sptId);
         (_ui["petInfo"] as TextField).text = "    " + PetBookXMLInfo.getFeatures(this._petId);
         _ui["sound"].visible = PetBookXMLInfo.hasSound(this._petId);
         (_ui["difficulty"] as MovieClip).gotoAndStop(SptXmlInfo.getDifficultyByID(this._sptId));
      }
      
      private function initParentPet() : void
      {
         var frame:int = int(this._parentPetIDs.length);
         this._parentPetIDs.push(this._petId);
         if(this._parentPetIDs.length == 0)
         {
            this.parentMv.visible = false;
            return;
         }
         KTool.getFrameMc(this.parentMv,frame,"p0",function(mv:MovieClip):void
         {
            for(var i:int = 0; i < _parentPetIDs.length; i++)
            {
               addParentPet(i);
            }
         });
      }
      
      private function addParentPet(i:int) : void
      {
         var petId:int = int(this._parentPetIDs[i]);
         ResourceManager.getResource(ClientConfig.getPetSwfPath(petId),function(mc:MovieClip):void
         {
            var container:MovieClip = parentMv["p" + i];
            mc.scaleX = mc.scaleY = 1.5;
            mc.gotoAndStop("right");
            container.addChild(mc);
            addMoudleEvent(mc,Event.ENTER_FRAME,function(e:*):void
            {
               var petMv:MovieClip = mc.getChildAt(0) as MovieClip;
               if(null != petMv)
               {
                  petMv.stop();
                  DisplayUtil.stopAllMovieClip(petMv);
               }
            });
            CommonUI.centerAlign(mc,container,new Point(0,0));
         },"pet");
      }
      
      private function get typeMv() : MovieClip
      {
         return _ui["typeMv"];
      }
      
      private function get parentMv() : MovieClip
      {
         return _ui["parentMv"];
      }
      
      private function get petContainer() : MovieClip
      {
         return _ui["pet"];
      }
      
      private function onSoundClick(e:MouseEvent) : void
      {
         if(Boolean(this.soundCh))
         {
            this.soundCh.stop();
            this.soundCh = null;
         }
         var sound:Sound = new Sound();
         sound.load(new URLRequest(ClientConfig.getResPath("pet/sound/" + this._petId + ".mp3")));
         this.soundCh = sound.play();
      }
   }
}

