package com.robot.module.app.tream
{
   import com.robot.core.info.team.SimpleTeamInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.uic.UIScrollBar;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import gs.TweenLite;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class TeamLogoPanel extends Sprite
   {
      
      public static const PREV_STEP:String = "prevStep";
      
      public static const CREATE_TEAM:String = "createTeam";
      
      private var iconBgSprite:Sprite;
      
      private var scrollIndex:uint = 0;
      
      public var bgIndex:uint = 10000;
      
      private var iconScrollBar:UIScrollBar;
      
      private var itemArray:Array = [];
      
      private var mc:MovieClip;
      
      private var iconSprite:Sprite;
      
      private const BG_LENGTH:uint = 12;
      
      private var prevBtn:SimpleButton;
      
      private var colorArray:Array = [15658734,10247936,13500416,9896087,6422013,6421760,206,24320,16645547,16627379,16633088,16604928];
      
      private var prevParent:Sprite;
      
      private var createBtn:SimpleButton;
      
      private var bgScrollBar:UIScrollBar;
      
      private var closeBtn:SimpleButton;
      
      private var logoTxt:TextField;
      
      private var txtColorArray:Array = [0,16777215,16777215,16777215,0,0,16777215,16777215,0,0,0,16777215];
      
      private var ICON_UI_NUM:uint = 22;
      
      private var prevIcon:LogoIconItem;
      
      private var colorPrev:SimpleButton;
      
      public var txtColor:uint;
      
      public var iconIndex:uint = 10000;
      
      private var prevBg:LogoBgItem;
      
      private var colorPanel:Sprite;
      
      private const ICON_LENGTH:uint = 9;
      
      public var mcColor:uint = 16777215;
      
      private var tf:TextFormat;
      
      private var BG_UI_NUM:uint = 27;
      
      private var colorNext:SimpleButton;
      
      private var scrollNum:uint = colorArray.length - 4;
      
      public function TeamLogoPanel()
      {
         super();
         tf = new TextFormat();
         tf.font = "黑体";
         tf.size = 14;
         mc = new team_logo_panel();
         addChild(mc);
         closeBtn = mc["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         prevBtn = mc["prevBtn"];
         prevBtn.addEventListener(MouseEvent.CLICK,prevHandler);
         createBtn = mc["createBtn"];
         createBtn.addEventListener(MouseEvent.CLICK,createHandler);
         logoTxt = mc["logoTxt"];
         logoTxt.addEventListener(Event.CHANGE,onTxtScroll);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         initIconPanel();
         initColorPanel();
      }
      
      public function destroy() : void
      {
         hide();
         logoTxt.removeEventListener(Event.CHANGE,onTxtScroll);
         logoTxt = null;
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         closeBtn = null;
         prevBtn.removeEventListener(MouseEvent.CLICK,prevHandler);
         prevBtn = null;
         createBtn.removeEventListener(MouseEvent.CLICK,createHandler);
         createBtn = null;
         mc = null;
         iconBgSprite = null;
         iconSprite = null;
         if(bgScrollBar)
         {
            bgScrollBar.destroy();
         }
         bgScrollBar = null;
         if(iconScrollBar)
         {
            iconScrollBar.destroy();
         }
         iconScrollBar = null;
         prevParent = null;
         if(prevBg)
         {
            prevBg.removeEventListener(MouseEvent.CLICK,clickBg);
            prevBg.destroy();
         }
         if(prevIcon)
         {
            prevIcon.destroy();
         }
         prevBg = null;
         prevIcon = null;
         colorPanel = null;
         itemArray = [];
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var index:int = 0;
         var item:LogoBgItem = null;
         for(var i:int = 0; i < BG_LENGTH; i++)
         {
            index = i + bgScrollBar.index * bgScrollBar.lineNum;
            item = iconBgSprite.getChildAt(i) as LogoBgItem;
            item.clear();
            if(index < BG_UI_NUM)
            {
               item.info = index;
            }
         }
      }
      
      public function showByModify(info:SimpleTeamInfo) : void
      {
         mcColor = info.logoColor;
         txtColor = info.txtColor;
         LevelManager.appLevel.addChild(this);
         scrollIndex = 0;
         colorPanel.x = 560;
         colorPanel.y = 366;
         bgIndex = info.logoBg;
         iconIndex = info.logoIcon;
         appendPrev(bgIndex,0);
         appendPrev(iconIndex,1);
         logoTxt.text = info.logoWord;
         prevIcon.txt.text = logoTxt.text;
         prevIcon.txt.textColor = txtColor;
         prevIcon.txt.setTextFormat(tf);
         createBtn.x = 373;
         DisplayUtil.removeForParent(prevBtn);
      }
      
      private function prevHandler(event:MouseEvent) : void
      {
         hide();
         dispatchEvent(new Event(PREV_STEP));
      }
      
      private function showIcon() : void
      {
         var item:LogoIconItem = null;
         for(var i:uint = 0; i < ICON_LENGTH; i++)
         {
            item = new LogoIconItem();
            item.info = i;
            item.x = (item.width + 5) * (i % 3);
            item.y = (item.height + 5) * Math.floor(i / 3);
            item.addEventListener(MouseEvent.CLICK,clickLogoIcon);
            iconSprite.addChild(item);
         }
         iconScrollBar.totalLength = ICON_UI_NUM;
      }
      
      private function alignIcon(icon:DisplayObject) : void
      {
         DisplayUtil.align(icon,prevParent.getRect(prevParent),AlignType.MIDDLE_CENTER);
      }
      
      private function createHandler(event:MouseEvent) : void
      {
         if(iconIndex == 10000)
         {
            Alarm.show("请选择战队的标志");
            return;
         }
         dispatchEvent(new Event(CREATE_TEAM));
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function showItem() : void
      {
         var item:LogoBgItem = null;
         for(var i:uint = 0; i < BG_LENGTH; i++)
         {
            item = new LogoBgItem();
            item.info = i;
            item.x = (item.width + 5) * (i % 3);
            item.y = (item.height + 5) * Math.floor(i / 3);
            item.addEventListener(MouseEvent.CLICK,clickLogoBg);
            iconBgSprite.addChild(item);
         }
         bgScrollBar.totalLength = BG_UI_NUM;
      }
      
      private function clickColor(event:MouseEvent) : void
      {
         var item:LogoColorItem = event.currentTarget as LogoColorItem;
         if(prevIcon)
         {
            mcColor = item.bgColor;
            txtColor = item.txtColor;
            DisplayUtil.FillColor(prevIcon.colorMC,mcColor);
            prevIcon.txt.textColor = txtColor;
         }
      }
      
      private function initColorPanel() : void
      {
         var i:uint = 0;
         var item:LogoColorItem = null;
         var mask:Shape = new Shape();
         mask.graphics.beginFill(0);
         mask.graphics.drawRect(0,0,185,60);
         mask.x = 558;
         mask.y = 360;
         mc.addChild(mask);
         colorPanel = new Sprite();
         colorPanel.x = 560;
         colorPanel.y = 366;
         mc.addChild(colorPanel);
         colorPanel.mask = mask;
         var count:uint = 0;
         for each(i in colorArray)
         {
            item = new LogoColorItem(i,txtColorArray[count]);
            item.addEventListener(MouseEvent.CLICK,clickColor);
            item.x = 3 + (item.width + 5) * count;
            colorPanel.addChild(item);
            count++;
         }
         colorPrev = mc["colorPrev"];
         colorNext = mc["colorNext"];
         colorPrev.addEventListener(MouseEvent.CLICK,prevColor);
         colorNext.addEventListener(MouseEvent.CLICK,nextColor);
      }
      
      private function nextColor(event:MouseEvent) : void
      {
         if(scrollIndex < scrollNum)
         {
            ++scrollIndex;
            TweenLite.to(colorPanel,0.3,{"x":560 - 46 * scrollIndex});
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this,false);
      }
      
      private function onTxtScroll(event:Event) : void
      {
         if(prevIcon)
         {
            prevIcon.txt.text = logoTxt.text;
            prevIcon.txt.textColor = txtColor;
            prevIcon.txt.setTextFormat(tf);
         }
      }
      
      private function onIconScrollMove(e:MouseEvent) : void
      {
         var index:int = 0;
         var item:LogoIconItem = null;
         for(var i:int = 0; i < ICON_LENGTH; i++)
         {
            index = i + iconScrollBar.index * iconScrollBar.lineNum;
            item = iconSprite.getChildAt(i) as LogoIconItem;
            item.clear();
            if(index < ICON_UI_NUM)
            {
               item.info = index;
            }
         }
      }
      
      private function initIconPanel() : void
      {
         prevParent = new Sprite();
         prevParent.graphics.beginFill(0,0);
         prevParent.graphics.drawRect(0,0,72,72);
         prevParent.x = 350;
         prevParent.y = 110;
         prevParent.scaleX = prevParent.scaleY = 2;
         mc.addChild(prevParent);
         iconBgSprite = new Sprite();
         iconBgSprite.x = 40;
         iconBgSprite.y = 102;
         mc.addChild(iconBgSprite);
         iconSprite = new Sprite();
         iconSprite.x = 545;
         iconSprite.y = 104;
         mc.addChild(iconSprite);
         bgScrollBar = new UIScrollBar(mc["barBall"],mc["barBg"],BG_LENGTH,mc["upBtn"],mc["downBtn"]);
         bgScrollBar.lineNum = 3;
         bgScrollBar.wheelObject = iconBgSprite;
         bgScrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
         iconScrollBar = new UIScrollBar(mc["barBall_1"],mc["barBg_1"],ICON_LENGTH,mc["upBtn_1"],mc["downBtn_1"]);
         iconScrollBar.lineNum = 3;
         iconScrollBar.wheelObject = iconSprite;
         iconScrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onIconScrollMove);
         showItem();
         showIcon();
      }
      
      private function prevColor(event:MouseEvent) : void
      {
         if(scrollIndex > 0)
         {
            --scrollIndex;
            TweenLite.to(colorPanel,0.3,{"x":560 - 46 * scrollIndex});
         }
      }
      
      private function clickLogoIcon(event:MouseEvent) : void
      {
         var mc:LogoIconItem = event.currentTarget as LogoIconItem;
         iconIndex = mc.num;
         appendPrev(mc.num,1);
         mcColor = 16777215;
      }
      
      private function clickBg(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(prevBg);
         prevBg.destroy();
         prevBg.removeEventListener(MouseEvent.CLICK,clickBg);
         prevBg = null;
         bgIndex = 10000;
         if(prevIcon)
         {
            prevIcon.x = 0;
            prevIcon.y = 0;
            prevParent.addChild(prevIcon);
            alignIcon(prevIcon);
         }
      }
      
      public function get logoText() : String
      {
         return logoTxt.text;
      }
      
      private function appendPrev(num:uint, index:uint) : void
      {
         if(index == 0)
         {
            DisplayUtil.removeForParent(prevBg);
            if(prevBg)
            {
               prevBg.removeEventListener(MouseEvent.CLICK,clickBg);
            }
            prevBg = new LogoBgItem(false);
            prevBg.addEventListener(MouseEvent.CLICK,clickBg);
            prevBg.info = num;
            alignIcon(prevBg);
            prevParent.addChild(prevBg);
            if(prevIcon)
            {
               prevIcon.x = -prevIcon.icon.x;
               prevIcon.y = -prevIcon.icon.y;
               prevBg.icon.addChild(prevIcon);
            }
            return;
         }
         DisplayUtil.removeForParent(prevIcon);
         prevIcon = new LogoIconItem(false);
         prevIcon.info = num;
         prevIcon.txt.text = logoTxt.text;
         prevIcon.txt.textColor = 0;
         prevIcon.txt.setTextFormat(tf);
         txtColor = 0;
         if(prevBg)
         {
            prevIcon.x = -prevIcon.icon.x;
            prevIcon.y = -prevIcon.icon.y;
            prevBg.icon.addChild(prevIcon);
         }
         else
         {
            alignIcon(prevIcon);
            prevParent.addChild(prevIcon);
         }
      }
      
      public function show(isReset:Boolean = true) : void
      {
         mcColor = 16777215;
         txtColor = 0;
         if(prevBg)
         {
            prevBg.destroy();
         }
         if(prevIcon)
         {
            prevIcon.destroy();
         }
         prevBg = null;
         prevIcon = null;
         if(isReset)
         {
            logoTxt.text = "";
         }
         LevelManager.appLevel.addChild(this);
         DisplayUtil.removeAllChild(prevParent);
         scrollIndex = 0;
         colorPanel.x = 560;
         colorPanel.y = 366;
      }
      
      private function clickLogoBg(event:MouseEvent) : void
      {
         var mc:LogoBgItem = event.currentTarget as LogoBgItem;
         bgIndex = mc.num;
         appendPrev(mc.num,0);
      }
   }
}

