package com.robot.app.mapProcess
{
   import com.robot.app.task.control.*;
   import com.robot.app.task.taskUtils.taskDialog.*;
   import com.robot.core.animate.*;
   import com.robot.core.manager.*;
   import com.robot.core.manager.map.config.BaseMapProcess;
   import com.robot.core.npc.*;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import org.taomee.manager.*;
   
   public class MapProcess_513 extends BaseMapProcess
   {
      
      private var npc:MovieClip;
      
      private var _shou_mc:MovieClip;
      
      private var _shou_btn:SimpleButton;
      
      private var _mov_mc:MovieClip;
      
      private var _kz_btn:SimpleButton;
      
      private var _pj_mc:MovieClip;
      
      private var _hj_mc:MovieClip;
      
      private var _f4_mc:MovieClip;
      
      private var _npc_lyman:MovieClip;
      
      private var _npc_pt:MovieClip;
      
      private var _npc_shawn:MovieClip;
      
      private var _npc_luoj:MovieClip;
      
      private var _nono_mc:MovieClip;
      
      public function MapProcess_513()
      {
         super();
      }
      
      override protected function init() : void
      {
         this._npc_lyman = conLevel["npc_1"];
         this._npc_pt = conLevel["npc_2"];
         this._npc_shawn = conLevel["npc_3"];
         this._npc_luoj = conLevel["npc_4"];
         this._npc_lyman.visible = false;
         this._npc_pt.visible = false;
         this._npc_luoj.visible = false;
         this._npc_shawn.visible = false;
         this.npc = conLevel["npc"];
         this._mov_mc = animatorLevel["movieMC"];
         this._shou_mc = this._mov_mc["shou_mc"];
         this._f4_mc = this._mov_mc["f4_mc"];
         this._nono_mc = this._mov_mc["nono_mc"];
         this._f4_mc.visible = false;
         this._npc_lyman.buttonMode = true;
         this._npc_pt.buttonMode = true;
         this._npc_luoj.buttonMode = true;
         this._npc_shawn.buttonMode = true;
         this._shou_btn = btnLevel["shou_btn"];
         this._kz_btn = btnLevel["kz_btn"];
         ToolTipManager.add(this._shou_btn,"能量屏障器");
         ToolTipManager.add(this._kz_btn,"启动控制台");
         this._shou_btn.visible = false;
         this._kz_btn.visible = false;
         this._pj_mc = this._mov_mc["pj_mc"];
         this._hj_mc = conLevel["hj_mc"];
         this._pj_mc.visible = true;
         this._hj_mc.visible = false;
         this._hj_mc.buttonMode = true;
         this.initTask92();
      }
      
      private function initTask92() : void
      {
         TasksManager.getProStatusList(TaskController_92.TASK_ID,function(param1:Array):void
         {
            if(Boolean(param1[0]))
            {
               showFun();
               if(Boolean(param1[0]) && !param1[2])
               {
                  _npc_lyman.addEventListener(MouseEvent.CLICK,showTalkLymon);
               }
               else if(Boolean(param1[2]) && !param1[4])
               {
                  enableShouMC();
               }
               else if(param1[4] && !param1[6] || param1[5] && !param1[6])
               {
                  enableKzMC();
               }
               else if(Boolean(param1[6]) && !param1[7])
               {
                  showJst();
               }
               else if(Boolean(param1[7]) && !param1[8])
               {
                  showShiperTalk();
               }
            }
         });
      }
      
      public function clickNpc() : void
      {
         TasksManager.getProStatusList(TaskController_92.TASK_ID,function(param1:Array):void
         {
            var arr:Array = param1;
            if(!arr[0] && !arr[1])
            {
               NpcDialog.show(NPC.CICI,["小铁皮，你来啦。我已经切断这里的对外联系。如果芯片有病毒的话也不会感染外面的电脑。随时都可以开始读取资料。"],["这是船长的授权命令。"],[function():void
               {
                  NpcDialog.show(NPC.CICI,["好，那就让我们开始吧！"],["开始扫描"],[function():void
                  {
                     TaskController_92.showPanel1();
                     TaskController_92.showNPC(showFun);
                     _npc_lyman.addEventListener(MouseEvent.CLICK,showTalkLymon);
                  }]);
               }]);
            }
         });
      }
      
      private function showTalkLymon(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         TasksManager.complete(92,1,null);
         NpcDialog.show(NPC.LYMAN,["小铁皮，你很勇敢，在关键时候一定要表现的更加果断才行！不用太担心这次有我帮忙的话贾斯汀一定没关系的！#1"],["确定"],[function():void
         {
            NpcDialog.show(NPC.LYMAN,["我已经派人在这里的操作台边上做了配置！这次我们一定能帮贾斯汀重生！"],["有什么我可以帮忙的吗？"],[function():void
            {
               NpcDialog.show(NPC.LYMAN,["为保安全，我们需要先对操作台上进行加固。小铁皮，看到边上的能量屏障发生器了吗？启动它就能确保机械臂支架的牢固。"],["包在我身上"],[function():void
               {
                  TasksManager.complete(92,2,function():void
                  {
                     TasksManager.complete(92,3,function():void
                     {
                        enableShouMC();
                        TaskController_92.showPanel();
                     });
                  });
               }]);
            }]);
         }]);
      }
      
      private function enableShouMC() : void
      {
         this._npc_lyman.removeEventListener(MouseEvent.CLICK,this.showTalkLymon);
         this._shou_btn.visible = true;
         this._shou_btn.addEventListener(MouseEvent.CLICK,this.showShouMovie);
      }
      
      private function showShouMovie(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         LevelManager.closeMouseEvent();
         this._shou_btn.removeEventListener(MouseEvent.CLICK,this.showShouMovie);
         this._shou_mc.gotoAndPlay(2);
         this._shou_mc.addEventListener(Event.ENTER_FRAME,function(param1:Event):void
         {
            var evt:Event = param1;
            if(_shou_mc.currentFrame == _shou_mc.totalFrames)
            {
               LevelManager.openMouseEvent();
               _shou_mc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               NpcDialog.show(NPC.CICI,["小铁皮，这次让我来监控系统的读取，你来启动操作控制台。"],["嗯，我会小心的"],[function():void
               {
                  TasksManager.complete(92,4,function():void
                  {
                     TasksManager.complete(92,5,function():void
                     {
                        enableKzMC();
                        TaskController_92.showPanel();
                     });
                  });
               }]);
            }
         });
      }
      
      private function enableKzMC() : void
      {
         this._shou_btn.visible = false;
         this._kz_btn.visible = true;
         this._kz_btn.addEventListener(MouseEvent.CLICK,this.showMovie);
      }
      
      private function showMovie(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         AnimateManager.playFullScreenAnimate("resource/bounsMovie/task_92_1.swf",function():void
         {
            _kz_btn.removeEventListener(MouseEvent.CLICK,showMovie);
            _kz_btn.visible = false;
            TasksManager.complete(92,6,function():void
            {
               showJst();
               TaskController_92.showPanel();
            });
         },null,"sound");
      }
      
      private function showJst() : void
      {
         this._pj_mc.visible = false;
         this._hj_mc.visible = true;
         this._hj_mc.addEventListener(MouseEvent.CLICK,function():void
         {
            _hj_mc.removeEventListener(MouseEvent.CLICK,arguments.callee);
            NpcDialog.show(NPC.SEER,["站长你感觉如何？"],["站长看起来非常精神！"],[function():void
            {
               NpcDialog.show(NPC.JUSTIN,["这一切就好像是做了一场梦一样"],["不管怎么说，你回来就好！"],[function():void
               {
                  NpcDialog.show(NPC.JUSTIN,["小铁皮，我不在的期间感谢你保护飞船和大家！"],["这些都是我应该做的","我什么也没有做"],[function():void
                  {
                     showJstTalk2();
                  },function():void
                  {
                     showJstTalk2();
                  }]);
               }]);
            }]);
         });
      }
      
      private function showJstTalk2() : void
      {
         NpcDialog.show(NPC.JUSTIN,["我已经迫不及待想要回到自己的岗位上去了，船长好像还有话要对你说！"],["哦!"],[function():void
         {
            TasksManager.complete(92,7,function():void
            {
               showShiperTalk();
               TaskController_92.showPanel();
            });
         }]);
      }
      
      private function showShiperTalk() : void
      {
         this._npc_luoj.addEventListener(MouseEvent.CLICK,function():void
         {
            _npc_luoj.removeEventListener(MouseEvent.CLICK,arguments.callee);
            NpcDialog.show(NPC.SHIPER,["小铁皮，你在这次事件中表现出的智慧和果断让我们大家都非常钦佩。我想如果是你的话，一定能够完成这个使命，派特博士请宣布我的决定。"],["确定"],[function():void
            {
               NpcDialog.show(NPC.DOCTOR,["经过我们星际委员会商议，决定把尼布交给飞船中最优秀的小铁皮。"],["最优秀的小铁皮？是谁？"],[function():void
               {
                  NpcDialog.show(NPC.DOCTOR,["看什么看，说的就是你。虽然它之前是海盗们训练的精灵，但是我们相信所有精灵的本质都是善良的。只要有合适训练，它就可以成为小铁皮的好伙伴。"],["真的吗？真的吗？"],[function():void
                  {
                     NpcDialog.show(NPC.DOCTOR,["如果还有什么问题可以来实验室找我哦，我很欢迎你这样的小铁皮来和我一起研究精灵世界的秘密。#1"],["哦耶！精灵万岁！精灵万岁耶！"],[function():void
                     {
                        NpcDialog.show(NPC.SHIPER,["我相信你一定能够把尼布训练成一只出色的精灵，往后的日子不可能一帆风顺，不过贾斯汀回来了，小铁皮又有你这样优秀的榜样，我对未来充满了信心"],["船长，我一定会努力的！"],[function():void
                        {
                           TasksManager.complete(92,8,function():void
                           {
                              NpcTipDialog.show("\r<p align=\'center\'>感谢Mario修复「站长归来」任务的文案</p>",null,NpcTipDialog.NONO);
                              removeNpc();
                           });
                        }]);
                     }]);
                  }]);
               }]);
            }]);
         });
      }
      
      private function showFun() : void
      {
         this._npc_lyman.visible = true;
         this._npc_pt.visible = true;
         this._npc_luoj.visible = true;
         this._npc_shawn.visible = true;
         this._f4_mc.visible = true;
      }
      
      private function removeNpc() : void
      {
         this._npc_lyman.visible = false;
         this._npc_pt.visible = false;
         this._npc_luoj.visible = false;
         this._npc_shawn.visible = false;
         this._f4_mc.visible = false;
         this._pj_mc.visible = false;
         this._hj_mc.visible = false;
         this.npc.visible = false;
      }
      
      override public function destroy() : void
      {
         LevelManager.showMapLevel();
         this.npc = null;
      }
   }
}

