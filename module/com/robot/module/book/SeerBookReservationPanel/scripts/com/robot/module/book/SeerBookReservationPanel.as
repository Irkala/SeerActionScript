package com.robot.module.book
{
   import com.robot.app.vipSession.VipSession;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SeerBookReservationPanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _panel:SeerBookReservationMc;
      
      public function SeerBookReservationPanel()
      {
         super();
      }
      
      private function onLinkPassHandler(e:Event) : void
      {
         var r:VipSession = null;
         r = new VipSession();
         r.addEventListener(VipSession.GET_SESSION,function(event:Event):void
         {
            navigateToURL(new URLRequest("http://pay.61.com/index.php?m=pwd&userid=" + MainManager.actorID + "&time=" + r.time + "&sign=" + r.key),"_blank");
         });
         r.getSession();
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_panel))
         {
            LevelManager.appLevel.addChild(_panel);
         }
         _panel.gotoAndStop(1);
         _panel.x = 30;
         _panel.y = 40;
         addEvent();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      public function setup() : void
      {
         _panel = new SeerBookReservationMc();
         _closeBtn = _panel["closeBtn"];
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onLinkHandler(e:Event) : void
      {
         var r:VipSession = null;
         r = new VipSession();
         r.addEventListener(VipSession.GET_SESSION,function(event:Event):void
         {
            navigateToURL(new URLRequest("http://pay.61.com/index.php?m=buy&game=seer&userid=" + MainManager.actorID + "&time=" + r.time + "&sign=" + r.key),"_blank");
         });
         r.getSession();
      }
      
      private function removeEvent() : void
      {
         _panel.removeEventListener("linkToPayUrl",onLinkHandler);
         _panel.removeEventListener("linkToPassUrl",onLinkPassHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function addEvent() : void
      {
         _panel.addEventListener("linkToPayUrl",onLinkHandler);
         _panel.addEventListener("linkToPassUrl",onLinkPassHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
      }
      
      public function destroy() : void
      {
         hide();
         _panel = null;
         _closeBtn = null;
      }
   }
}

