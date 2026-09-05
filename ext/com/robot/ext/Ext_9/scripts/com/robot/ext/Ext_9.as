package com.robot.ext
{
   import com.robot.app.im.talk.TalkPanelManager;
   import com.robot.core.info.UserInfo;
   import com.robot.core.manager.RelationManager;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_9 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      public function Ext_9()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClick(e:MouseEvent) : void
      {
         var arr:Array = RelationManager.getFriendInfos(false);
         var info:UserInfo = arr[int(Math.random() * arr.length)];
         TalkPanelManager.showTalkPanel(info.userID);
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
   }
}

