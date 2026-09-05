package com.robot.module.app.petBreed
{
   import com.robot.app.info.BreedInfo;
   import com.robot.app.panel.PetChoosePanel;
   import com.robot.core.CommandID;
   import com.robot.core.animate.AnimateManager;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.CommonUI;
   import com.robot.module.app.PetBreedPanel;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class BreedPanel implements IBreedPanel
   {
      
      private var _parent:PetBreedPanel;
      
      private var _ui:MovieClip;
      
      private var _breedInfo:BreedInfo;
      
      private var _male:PetInfo;
      
      private var _female:PetInfo;
      
      public function BreedPanel()
      {
         super();
      }
      
      public function show(param1:PetBreedPanel) : void
      {
         var parent:PetBreedPanel = param1;
         this._parent = parent;
         this._ui = new breed_ui();
         this._ui["effect"].gotoAndStop(1);
         CommonUI.setEnabled(this._ui["female"],false);
         CommonUI.setEnabled(this._ui["start"],false);
         LevelManager.appLevel.addChild(this._ui);
         DisplayUtil.align(this._ui,null,AlignType.MIDDLE_CENTER);
         this._parent.updateInfo(function(param1:BreedInfo):void
         {
            _breedInfo = param1;
            ToolTipManager.add(_ui["book"],"繁殖公式");
            _ui["close"].addEventListener(MouseEvent.CLICK,onClose);
            _ui["male"].addEventListener(MouseEvent.CLICK,onMale);
            _ui["female"].addEventListener(MouseEvent.CLICK,onFemale);
            _ui["book"].addEventListener(MouseEvent.CLICK,onBook);
            _ui["start"].addEventListener(MouseEvent.CLICK,onStart);
            _ui["hatch"].addEventListener(MouseEvent.CLICK,onHatch);
         });
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._parent.hide();
      }
      
      private function onMale(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(PetManager.infos.some(function(param1:PetInfo, param2:int, param3:Array):Boolean
         {
            if(PetXMLInfo.getPetGender(param1.id) == 1 && param1.level >= 50)
            {
               return true;
            }
            return false;
         }) == false)
         {
            Alarm.show("你的精灵背包中没有可以参与繁殖的雄性精灵哦！");
            return;
         }
         this._ui.mouseEnabled = false;
         this._ui.mouseChildren = false;
         PetChoosePanel.show(function(param1:PetInfo):void
         {
            if(Boolean(_male) && _male.catchTime != param1.catchTime)
            {
               _female = null;
               DisplayUtil.removeAllChild(_ui["femalePet"]);
               CommonUI.setEnabled(_ui["start"],false);
            }
            if(Boolean(_male))
            {
               ResourceManager.cancelURL(ClientConfig.getPetSwfPath(_male.id));
            }
            _male = param1;
            loadPet(_male.id,_ui["malePet"],"rightdown");
            CommonUI.setEnabled(_ui["female"],true);
            _ui.mouseEnabled = true;
            _ui.mouseChildren = true;
         },function():void
         {
            _ui.mouseEnabled = true;
            _ui.mouseChildren = true;
         },function(param1:PetInfo):Boolean
         {
            if(PetXMLInfo.getPetGender(param1.id) == 1 && param1.level >= 50)
            {
               return true;
            }
            return false;
         });
      }
      
      private function onFemale(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this._ui.mouseEnabled = false;
         this._ui.mouseChildren = false;
         SocketConnection.addCmdListener(CommandID.GET_BREED_PET,function(param1:SocketEvent):void
         {
            var data:ByteArray = null;
            var count:uint = 0;
            var i:uint = 0;
            var female:Array = null;
            var e:SocketEvent = param1;
            female = null;
            SocketConnection.removeCmdListener(CommandID.GET_BREED_PET,arguments.callee);
            data = e.data as ByteArray;
            female = [];
            count = data.readUnsignedInt();
            i = 0;
            while(i < count)
            {
               female.push(data.readUnsignedInt());
               i++;
            }
            if(PetManager.infos.some(function(param1:PetInfo, param2:int, param3:Array):Boolean
            {
               if(param1.level >= 50 && female.indexOf(param1.catchTime) != -1)
               {
                  return true;
               }
               return false;
            }) == false)
            {
               Alarm.show("你的精灵背包中没有与精灵<font color=\'#ff0000\'>" + PetXMLInfo.getName(_male.id) + "</font>匹配的50级以上雌性精灵！");
               _ui.mouseEnabled = true;
               _ui.mouseChildren = true;
               return;
            }
            PetChoosePanel.show(function(param1:PetInfo):void
            {
               if(Boolean(_female))
               {
                  ResourceManager.cancelURL(ClientConfig.getPetSwfPath(_female.id));
               }
               _female = param1;
               loadPet(_female.id,_ui["femalePet"],"leftdown");
               CommonUI.setEnabled(_ui["start"],true);
               _ui.mouseEnabled = true;
               _ui.mouseChildren = true;
            },function():void
            {
               _ui.mouseEnabled = true;
               _ui.mouseChildren = true;
            },function(param1:PetInfo):Boolean
            {
               if(param1.level >= 50 && female.indexOf(param1.catchTime) != -1)
               {
                  return true;
               }
               return false;
            });
         });
         SocketConnection.send(CommandID.GET_BREED_PET,this._male.catchTime);
      }
      
      private function onBook(param1:MouseEvent) : void
      {
         this._parent.hide();
         ModuleManager.showModule(ClientConfig.getBookModule("BreedFormulaBook"),"正在加载精灵繁殖公式.... ");
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(this._breedInfo.breedCoolTime > 0)
         {
            Alarm.show("繁殖仓能量耗尽，需要72小时的修复时间，你可以在" + Math.ceil(this._breedInfo.breedCoolTime / 3600) + "小时后再次使用繁殖仓！");
         }
         else
         {
            this._ui.mouseEnabled = false;
            this._ui.mouseChildren = false;
            if(MainManager.actorInfo.coins < 5000)
            {
               Alarm.show("精灵繁殖需要花费5000赛尔豆，你的赛尔豆不够哦！",function():void
               {
                  _ui.mouseEnabled = true;
                  _ui.mouseChildren = true;
               });
            }
            else
            {
               Alert.show("精灵繁殖需要花费5000赛尔豆，确定要开始繁殖吗？",function():void
               {
                  CommonUI.setEnabled(_ui["male"],false);
                  CommonUI.setEnabled(_ui["female"],false);
                  CommonUI.setEnabled(_ui["start"],false);
                  SocketConnection.addCmdListener(CommandID.START_BREED,function(param1:SocketEvent):void
                  {
                     var e:SocketEvent = param1;
                     SocketConnection.removeCmdListener(CommandID.START_BREED,arguments.callee);
                     MainManager.actorInfo.coins -= 5000;
                     _parent.playSound("loveegg");
                     AnimateManager.playMcAnimate(_ui["effect"],0,"",function():void
                     {
                        Alarm.show("繁殖成功，精灵蛋已经进入了孵蛋器！赶快去看看吧！",function():void
                        {
                           if(Boolean(_parent))
                           {
                              _parent.showPanel(new HatchPanel());
                           }
                        });
                     });
                  });
                  SocketConnection.send(CommandID.START_BREED,_male.catchTime,_female.catchTime);
               },function():void
               {
                  _ui.mouseEnabled = true;
                  _ui.mouseChildren = true;
               });
            }
         }
      }
      
      private function onHatch(param1:MouseEvent) : void
      {
         this._parent.showPanel(new HatchPanel());
      }
      
      private function loadPet(param1:uint, param2:MovieClip, param3:String) : void
      {
         var id:uint = param1;
         var con:MovieClip = param2;
         var direction:String = param3;
         DisplayUtil.removeAllChild(con);
         ResourceManager.getResource(ClientConfig.getPetSwfPath(id),function(param1:DisplayObject):void
         {
            var pet:MovieClip = null;
            var o:DisplayObject = param1;
            pet = null;
            pet = o as MovieClip;
            con.addChild(pet);
            pet.addEventListener(Event.ENTER_FRAME,function():void
            {
               var _loc2_:MovieClip = pet.getChildAt(0) as MovieClip;
               if(Boolean(_loc2_))
               {
                  _loc2_.gotoAndStop(1);
                  pet.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  CommonUI.equalScale(pet,110,150);
                  CommonUI.centerAlign(pet,con,new Point(0,0));
               }
            });
            pet.gotoAndStop(direction);
         },"pet");
      }
      
      public function hide() : void
      {
         ToolTipManager.remove(this._ui["book"]);
         this._ui["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
         this._ui["male"].removeEventListener(MouseEvent.CLICK,this.onMale);
         this._ui["female"].removeEventListener(MouseEvent.CLICK,this.onFemale);
         this._ui["book"].removeEventListener(MouseEvent.CLICK,this.onBook);
         this._ui["start"].removeEventListener(MouseEvent.CLICK,this.onStart);
         this._ui["hatch"].removeEventListener(MouseEvent.CLICK,this.onHatch);
         DisplayUtil.removeForParent(this._ui);
         this._parent = null;
         this._ui = null;
         this._breedInfo = null;
         this._male = null;
         this._female = null;
      }
   }
}

