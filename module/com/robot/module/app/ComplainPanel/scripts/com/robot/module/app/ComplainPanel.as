package com.robot.module.app
{
   import com.robot.core.info.UserInfo;
   import com.robot.module.app.complain.ComplainAnswer;
   import com.robot.module.app.complain.ComplainListPanel;
   import flash.display.Sprite;
   import org.taomee.module.IModule;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ComplainPanel extends Sprite implements IModule
   {
      
      private var _userInfo:UserInfo;
      
      public function ComplainPanel()
      {
         super();
      }
      
      public function hide() : void
      {
      }
      
      private function complainHandler() : void
      {
         ComplainAnswer.show("    你确定要举报<font color=\'#ff0000\'>" + _userInfo.nick + "(" + _userInfo.userID + ")</font>的不良行为吗？",showComplainList);
      }
      
      private function showComplainList() : void
      {
         ComplainListPanel.show(_userInfo);
      }
      
      public function show() : void
      {
         ComplainAnswer.show("    当你发现有船员违反了《赛尔号船员公约》时，可以使用此系统。" + "星际船员委员会将根据系统记录进行审核，并给予相应的处理。\r    你确定继续举报吗？",complainHandler);
      }
      
      public function init(data:Object = null) : void
      {
         _userInfo = data as UserInfo;
      }
      
      public function destroy() : void
      {
      }
      
      public function setup() : void
      {
      }
   }
}

