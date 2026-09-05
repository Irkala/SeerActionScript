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
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ShopingGuidePanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _panel:ShopingGuideMc;
      
      private var _nextBtn:SimpleButton;
      
      private var _prevBtn:SimpleButton;
      
      public function ShopingGuidePanel()
      {
         super();
      }
      
      private function addEvent() : void
      {
         _panel.addEventListener("linkTopayPage",onLinkHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      private function onNextClickHandler(e:MouseEvent) : void
      {
         if(_panel.currentFrame < _panel.totalFrames)
         {
            _panel.gotoAndStop(_panel.currentFrame + 1);
         }
      }
      
      public function setup() : void
      {
         _panel = new ShopingGuideMc();
         _panel.gotoAndStop(1);
         _closeBtn = _panel["closeBtn"];
      }
      
      private function onPrevClickHandler(e:MouseEvent) : void
      {
         if(_panel.currentFrame > 1)
         {
            _panel.gotoAndStop(_panel.currentFrame - 1);
         }
      }
      
      private function onCloseClickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removeEvent() : void
      {
         _panel.removeEventListener("linkTopayPage",onLinkHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseClickHandler);
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
      
      public function destroy() : void
      {
         hide();
         _panel = null;
         _closeBtn = null;
      }
      
      public function show() : void
      {
         _panel.gotoAndStop(1);
         if(!DisplayUtil.hasParent(_panel))
         {
            LevelManager.appLevel.addChild(_panel);
         }
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         _panel.x += 55;
         addEvent();
      }
   }
}

