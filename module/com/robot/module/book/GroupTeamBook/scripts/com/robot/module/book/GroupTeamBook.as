package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class GroupTeamBook extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var teambook:GroupTeamBook_Mc;
      
      private var _leftBtn:SimpleButton;
      
      private var _rightBtn:SimpleButton;
      
      public function GroupTeamBook()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(teambook);
         removeEvent();
      }
      
      private function removeEvent() : void
      {
         _leftBtn.removeEventListener(MouseEvent.CLICK,leftBtnHandler);
         _rightBtn.removeEventListener(MouseEvent.CLICK,rightBtnHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,closeBtnHandler);
      }
      
      private function closeBtnHandler(evt:MouseEvent) : void
      {
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function rightBtnHandler(evt:MouseEvent) : void
      {
         teambook.nextFrame();
         if(!_leftBtn.visible)
         {
            _leftBtn.visible = true;
         }
         if(teambook.totalFrames == teambook.currentFrame)
         {
            _rightBtn.visible = false;
         }
         else
         {
            _rightBtn.visible = true;
         }
      }
      
      private function addEvents() : void
      {
         _leftBtn.addEventListener(MouseEvent.CLICK,leftBtnHandler);
         _rightBtn.addEventListener(MouseEvent.CLICK,rightBtnHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,closeBtnHandler);
      }
      
      public function show() : void
      {
         LevelManager.stage.addChild(teambook);
         _leftBtn.visible = false;
         if(!_rightBtn.visible)
         {
            _rightBtn.visible = true;
         }
         teambook.gotoAndStop(1);
         DisplayUtil.align(teambook,null,AlignType.MIDDLE_CENTER);
         addEvents();
      }
      
      public function destroy() : void
      {
         hide();
         teambook = null;
         _leftBtn = null;
         _rightBtn = null;
         _closeBtn = null;
      }
      
      private function leftBtnHandler(evt:MouseEvent) : void
      {
         teambook.prevFrame();
         if(!_rightBtn.visible)
         {
            _rightBtn.visible = true;
         }
         if(teambook.currentFrame == 1)
         {
            _leftBtn.visible = false;
         }
         else
         {
            _leftBtn.visible = true;
         }
      }
      
      public function setup() : void
      {
         teambook = new GroupTeamBook_Mc();
         _leftBtn = teambook["leftBtn"];
         _rightBtn = teambook["rightBtn"];
         _closeBtn = teambook["closeBtn"];
      }
   }
}

