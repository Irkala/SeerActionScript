package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetKingChoosePanel extends Sprite implements IModule
   {
      
      public static const HAS_CHOOSE_FIGHT:String = "hasChooseFight";
      
      private static const NAME_ARR:Array = ["草","水","火","电","战斗","飞行","机械","地面","冰"];
      
      private var _closeBtn:SimpleButton;
      
      private var _btnArr:Array;
      
      private var _mainUI:MovieClip;
      
      public function PetKingChoosePanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onCloseBtnClick(e:MouseEvent) : void
      {
         hide();
      }
      
      private function onBtnClick(e:MouseEvent) : void
      {
         var type:int = int(e.currentTarget.name.split("_")[1]);
         this.loaderInfo.sharedEvents.dispatchEvent(new DynamicEvent(HAS_CHOOSE_FIGHT,type));
         hide();
      }
      
      public function init(obj:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         var btn:MovieClip = null;
         _mainUI = new UI_PetKingChoosePanel();
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnClick);
         _btnArr = new Array();
         for(var i:int = 1; i <= 9; i++)
         {
            btn = _mainUI["btn_" + i];
            ToolTipManager.add(btn,NAME_ARR[i - 1] + "系大战");
            btn.addEventListener(MouseEvent.CLICK,onBtnClick);
            _btnArr.push(btn);
         }
      }
      
      public function destroy() : void
      {
         hide();
         for(var i:int = 0; i < 9; i++)
         {
            _btnArr[i].removeEventListener(MouseEvent.CLICK,onBtnClick);
         }
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnClick);
         _btnArr = null;
         _closeBtn = null;
         _mainUI = null;
      }
      
      public function show() : void
      {
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(_mainUI);
      }
   }
}

