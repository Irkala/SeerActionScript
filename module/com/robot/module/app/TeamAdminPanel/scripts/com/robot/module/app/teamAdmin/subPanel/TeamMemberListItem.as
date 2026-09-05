package com.robot.module.app.teamAdmin.subPanel
{
   import com.robot.app.im.ui.IMListItem;
   import com.robot.app.team.TeamController;
   import com.robot.app.user.UserInfoController;
   import com.robot.core.info.team.TeamMemberInfo;
   import com.robot.core.manager.MainManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import org.taomee.utils.DisplayUtil;
   
   public class TeamMemberListItem extends IMListItem
   {
      
      private static var array:Array = [];
      
      private var txt1:TextField;
      
      private var _priv:uint;
      
      private var uid:uint;
      
      private var tf:TextFormat;
      
      private var txt:TextField;
      
      public function TeamMemberListItem()
      {
         super();
         tf = new TextFormat();
         tf.size = 14;
         tf.align = TextFormatAlign.RIGHT;
         array.push(this);
         txt = new TextField();
         txt.selectable = false;
         txt.mouseEnabled = false;
         txt.width = 50;
         txt.height = 18;
         txt.x = 85 + 20;
         txt.y = 3;
         txt.textColor = 1341659;
         addChild(txt);
         txt1 = new TextField();
         txt1.selectable = false;
         txt1.mouseEnabled = false;
         txt1.width = 36;
         txt1.height = 18;
         txt1.x = 137;
         txt1.y = 3;
         txt1.textColor = 1341659;
         addChild(txt1);
         txt1.visible = false;
         _talkMc.x += 18;
      }
      
      override protected function getMainUI() : Sprite
      {
         return new team_IMListItem();
      }
      
      public function get memberInfo() : TeamMemberInfo
      {
         return _info as TeamMemberInfo;
      }
      
      private function onClick(event:MouseEvent) : void
      {
         var i:TeamMemberListItem = null;
         for each(i in array)
         {
            i.filters = [];
         }
         dispatchEvent(new Event(Event.SELECT));
         this.filters = [new GlowFilter(16711680,0.5,4,4,8)];
      }
      
      public function setMemberInfo(i:TeamMemberInfo, isSingle:Boolean = false, type:uint = 0) : void
      {
         if(!i)
         {
            return;
         }
         buttonMode = true;
         _info = i;
         if(memberInfo.priv == 5)
         {
            txt.text = "";
         }
         else
         {
            txt.text = TeamController.ADMIN_STR[memberInfo.priv];
         }
         txt.setTextFormat(tf);
         trace(_info.serverID);
         if(_info)
         {
            txt1.text = (_info as TeamMemberInfo).contribute.toString();
         }
         if(_info.serverID)
         {
            _headMc.visible = true;
            DisplayUtil.FillColor(_headMc,_info.color);
            _txt.textColor = 0;
            if(_info.vip)
            {
               _nonoMc.visible = true;
            }
         }
         else
         {
            _headMc.visible = false;
            _txt.textColor = 10066329;
         }
         if(_info.userID != MainManager.actorID)
         {
            if(type == 0)
            {
               _talkMc.visible = true;
               _talkMc.addEventListener(MouseEvent.CLICK,onTalk);
            }
            else
            {
               _talkMc.visible = false;
            }
         }
         _faceMc.visible = true;
         if(!isSingle)
         {
            _faceMc.mouseEnabled = true;
            _faceMc.addEventListener(MouseEvent.CLICK,showInfo);
            _clickBtn.addEventListener(MouseEvent.CLICK,onClick);
         }
         else
         {
            _faceMc.mouseEnabled = false;
            _clickBtn.addEventListener(MouseEvent.CLICK,showInfo);
         }
         _txt.text = _info.nick;
         var p:DisplayObjectContainer = _clickBtn.parent;
         p.addChildAt(_clickBtn,0);
      }
      
      private function showInfo(event:MouseEvent) : void
      {
         UserInfoController.show(_info.userID);
      }
      
      override public function clear() : void
      {
         super.clear();
         txt.text = "";
         this.filters = [];
         buttonMode = false;
         if(_talkMc)
         {
            _talkMc.visible = false;
         }
         _clickBtn.removeEventListener(MouseEvent.CLICK,onClick);
      }
      
      public function setVisible(b1:Boolean) : void
      {
         txt1.visible = b1;
         if(b1)
         {
            if(_info)
            {
               txt1.text = (_info as TeamMemberInfo).contribute.toString();
            }
         }
         txt.visible = !b1;
         _talkMc.visible = !b1;
      }
      
      public function changePriv(v:uint) : void
      {
         memberInfo.priv = v;
         if(memberInfo.priv == 5)
         {
            txt.text = "";
         }
         else
         {
            txt.text = TeamController.ADMIN_STR[memberInfo.priv];
         }
         txt.setTextFormat(tf);
      }
   }
}

