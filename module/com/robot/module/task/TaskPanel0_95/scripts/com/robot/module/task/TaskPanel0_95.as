package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_95;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.setTimeout;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_95 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _panelID:uint = 0;
      
      private var _mainUI:MovieClip;
      
      private var txt:TextField;
      
      public function TaskPanel0_95()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeAllChild(_mainUI);
         DisplayUtil.removeForParent(_mainUI);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
      }
      
      public function init(data:Object = null) : void
      {
         _panelID = uint(data);
         if(_mainUI)
         {
            DisplayUtil.removeAllChild(_mainUI);
         }
         switch(_panelID)
         {
            case 0:
               _mainUI = new Task95_Panel_0();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_0();
               break;
            case 1:
               _mainUI = new Task95_Panel_1();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_1();
               break;
            case 2:
               _mainUI = new Task95_Panel_2();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_2();
               break;
            case 3:
               _mainUI = new Task95_Panel_2();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_3();
               break;
            case 4:
               _mainUI = new Task95_Panel_4();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_4();
               break;
            case 5:
               _mainUI = new Task95_Panel_2();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_5();
               break;
            case 6:
               _mainUI = new Task95_Panel_2();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_6();
               break;
            case 7:
               _mainUI = new Task95_Panel_2();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_7();
               break;
            case 8:
               _mainUI = new Task95_Panel_5();
               _closeBtn = _mainUI["closeBtn"];
               taskPanel_8();
         }
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      private function taskPanel_0() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            hide();
            TaskController_95.showPanel();
         });
      }
      
      private function taskPanel_1() : void
      {
         var mc:MovieClip = null;
         _closeBtn.visible = false;
         _closeBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            hide();
            EventManager.dispatchEvent(new DynamicEvent("taskPanel_1_close"));
         });
         _mainUI["mc"].gotoAndStop(1);
         mc = _mainUI["mc"]["loaderMC"]["mc"];
         mc.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            if(mc.currentFrame == mc.totalFrames)
            {
               mc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               _closeBtn.visible = true;
               _mainUI["mc"].gotoAndStop(2);
            }
         });
      }
      
      private function taskPanel_2() : void
      {
         var txtArr:Array = ["喂!我可是摩尔庄园的拉姆校长！你们这群野蛮的机械外星人！到底干嘛！干嘛！我不会怕了你们的！！！还我葡萄……","你……你才是野蛮的外星人呢！不知道是谁还弄……弄出了个黑色旋涡！搞的我们都没有办法离开了！","慢！结巴外星人！你刚才说什么黑色旋涡？……这个……那个！我可能知道一点眉目哦！哎呀！糟糕！！！大卫的那个时空穿梭机！","我没脸见大卫了，要不我先在这里避避风头吧？对了！对了！大卫现在就在摩尔庄园，我想我的葡萄应该能够帮到你们哦！我想我的摩尔庄园！我想我的拉姆学校……"];
         showTaskPanel_2(2,txtArr,[1,2]);
      }
      
      private function taskPanel_3() : void
      {
         var nextFunc:Function = null;
         var txtArr:Array = ["你好！我们是来自赛尔号的小赛尔，我们听三根毛说，哦不对！是菩提校长说，他误打误撞用你的机器打开了时空之门，造成了宇宙中的黑色旋涡！有什么办法可以关闭它吗?","我现在也很苦恼啊！这个机器应该缺少电能！还缺少一些矿石的融合……我也不知道怎么办了…………","矿石？电量？这个好办啊，我们每个赛尔都可以用头部射击来产生电量，至于矿石，我想我们的矿石跟踪器应该可以帮你找到一些不可思议的矿石吧！"];
         showTaskPanel_2(3,txtArr,[3,4],nextFunc);
         nextFunc = function():void
         {
            DisplayUtil.removeForParent(_mainUI);
            _mainUI = null;
            _mainUI = new Task95_Panel_3();
            show();
            setTimeout(function():void
            {
               LevelManager.openMouseEvent();
               DisplayUtil.removeForParent(_mainUI);
               _mainUI = null;
               _mainUI = new Task95_Panel_2();
               show();
               _closeBtn = _mainUI["closeBtn"];
               _closeBtn.visible = true;
               _closeBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
               {
                  hide();
                  EventManager.dispatchEvent(new DynamicEvent("taskPanel_3_close"));
               });
               txt = _mainUI["txt"];
               txt.htmlText = "    咦!我发现在不远处存在着一种矿石哦，我从未见到过！要不我去拿来给你看看吧？我想应该会有用的哦！";
               _mainUI["nextBtn"].visible = false;
            },6500);
         };
      }
      
      private function taskPanel_4() : void
      {
         var noseMc:MovieClip = null;
         var txt:TextField = null;
         var confirmBtn:SimpleButton = null;
         var btn:SimpleButton = null;
         var onChooseNose:Function = null;
         onChooseNose = function(evt:MouseEvent):void
         {
            var frame:uint;
            var b:SimpleButton = evt.currentTarget as SimpleButton;
            noseMc.visible = true;
            frame = uint(b.name.split("_")[1]) + 1;
            noseMc.gotoAndStop(frame);
            switch(frame)
            {
               case 1:
                  txt.htmlText = "    你这也叫伪装？0分！0分！";
                  break;
               case 2:
                  txt.htmlText = "    这个……那个……是不是再小一点？你再换个！";
                  break;
               case 3:
                  txt.htmlText = "    勉强可以给你来个80分！如果我在鼻子上踹一脚！我想就100分了！";
                  confirmBtn.visible = true;
                  confirmBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
                  {
                     hide();
                     EventManager.dispatchEvent(new DynamicEvent("taskPanel_4_close"));
                  });
            }
         };
         var btn_0:SimpleButton = _mainUI["btn_0"];
         var btn_1:SimpleButton = _mainUI["btn_1"];
         var btn_2:SimpleButton = _mainUI["btn_2"];
         var btnArr:Array = [btn_0,btn_1,btn_2];
         noseMc = _mainUI["noseMC"];
         noseMc.visible = false;
         txt = _mainUI["txt"];
         confirmBtn = _mainUI["confirmBtn"];
         confirmBtn.visible = false;
         for each(btn in btnArr)
         {
            btn.addEventListener(MouseEvent.CLICK,onChooseNose);
         }
      }
      
      private function taskPanel_5() : void
      {
         var txtArr:Array = ["……这个可是神速！你们怎么速度这么快！刚才有个小摩尔也找到了一个特殊的矿石！现在矿石应该是没问题了！就缺少电量了！","这个不成问题！电量我能提供！","外星人？超人？你怎么什么都可以……哦对了！你记得要注意电量千万不能超过频率啊！"];
         showTaskPanel_2(5,txtArr,[4,6]);
      }
      
      private function taskPanel_6() : void
      {
         var txtArr:Array = ["帅啊！！！哈哈没想到这么快就搞定了！铁皮超人！我还真要感谢你呢！","没事！我们也正因为这个漩涡的事情苦恼呢！好了，我们船长还在等我去复命！我想我该走了！"];
         showTaskPanel_2(6,txtArr,[4,6]);
      }
      
      private function taskPanel_8() : void
      {
         var type:uint = 0;
         var mc_0:MovieClip = null;
         var mc_1:MovieClip = null;
         var confirmBtn:SimpleButton = null;
         _closeBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            hide();
         });
         type = 1;
         mc_0 = _mainUI["mc0"];
         mc_0.buttonMode = true;
         mc_0.gotoAndStop(1);
         mc_1 = _mainUI["mc1"];
         mc_1.buttonMode = true;
         mc_1.gotoAndStop(1);
         confirmBtn = _mainUI["confirmBtn"];
         mc_0.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            mc_0.gotoAndStop(2);
            mc_1.gotoAndStop(1);
            confirmBtn.mouseEnabled = true;
            type = 1;
         });
         mc_1.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            mc_0.gotoAndStop(1);
            mc_1.gotoAndStop(2);
            confirmBtn.mouseEnabled = true;
            type = 2;
         });
         confirmBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            TasksManager.complete(95,7,null,false,type);
            hide();
         });
      }
      
      private function showTaskPanel_2(eventID:uint, txtArray:Array, mcFrameArr:Array, func:Function = null) : void
      {
         var count:uint = 0;
         var txtArr:Array = null;
         var mc:MovieClip = null;
         var nextBtn:MovieClip = null;
         var next:Function = null;
         next = function(evt:MouseEvent):void
         {
            ++count;
            if(count == txtArr.length)
            {
               nextBtn.removeEventListener(MouseEvent.CLICK,next);
               LevelManager.openMouseEvent();
               _closeBtn.visible = true;
               nextBtn.visible = false;
               if(func != null)
               {
                  func();
               }
               return;
            }
            txt.htmlText = "    " + txtArr[count];
            if(count == 1)
            {
               mc.gotoAndStop(uint(mcFrameArr[1]));
            }
            else
            {
               mc.gotoAndStop(uint(mcFrameArr[0]));
            }
         };
         _closeBtn.visible = false;
         _closeBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            hide();
            var eventName:String = "taskPanel_" + eventID + "_close";
            EventManager.dispatchEvent(new DynamicEvent(eventName));
         });
         count = 0;
         txt = _mainUI["txt"];
         txtArr = txtArray;
         txt.htmlText = "    " + txtArr[count];
         mc = _mainUI["mc"];
         mc.gotoAndStop(uint(mcFrameArr[0]));
         LevelManager.closeMouseEvent();
         nextBtn = _mainUI["nextBtn"];
         nextBtn.buttonMode = true;
         nextBtn.addEventListener(MouseEvent.CLICK,next);
      }
      
      public function setup() : void
      {
      }
      
      private function taskPanel_7() : void
      {
         var txtArr:Array = ["剪刀石头布！哈哈哈！！你们又输啦！哈哈哈！！！","菩提大伯，你不准备回摩尔庄园了？不过没关系，我们设立了一个摩尔庄园的传送口，如果你想回去随时可以走哦！有什么问题的话还可以来找我帮忙！赛尔号很欢迎你……","先不说啦！船长还等着我呢！！我先去复命啦！"];
         showTaskPanel_2(7,txtArr,[6,7]);
      }
   }
}

