package com.robot.module.app
{
   import com.robot.app.spt.SptInfo;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import gs.TweenMax;
   import gs.events.TweenEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SptPanel extends Sprite implements IModule
   {
      
      private var _dragMc:MovieClip;
      
      private var _iconMc:Sprite;
      
      private var _rightMc:MovieClip;
      
      private var _leftBtn:SimpleButton;
      
      private var _leftMc:MovieClip;
      
      private var _pageTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _curPage:uint;
      
      private var _desMc:SptDisMc;
      
      private var _allClassA:Array = [B1_MC,B2_MC,B3_MC,B4_MC,B5_MC,B6_MC,B7_MC,B8_MC,B9_MC,B10_MC,B11_MC,B12_MC,B13_MC,B14_MC,B15_MC,B16_MC,B17_MC,B18_MC,B19_MC,B20_MC];
      
      private var _infoA:Array;
      
      private var _iconMask:Sprite;
      
      private const _paginal:uint = 3;
      
      private var _iconA:Array;
      
      private var tween:TweenMax;
      
      private const _curMove:uint = 153;
      
      private var _mainBgMc:Sprite;
      
      private var _totalPage:uint;
      
      private var _rightBtn:SimpleButton;
      
      public function SptPanel()
      {
         super();
      }
      
      private function makeMask() : void
      {
         if(!this._iconMc)
         {
            this._iconMc = new Sprite();
         }
         if(!DisplayUtil.hasParent(this._iconMc))
         {
            this._mainBgMc.addChild(this._iconMc);
            this._iconMc.x = 45;
            this._iconMc.y = 100;
         }
         if(!this._iconMask)
         {
            this._iconMask = new Sprite();
            this._iconMask.graphics.lineStyle(1,0,1);
            this._iconMask.graphics.beginFill(0,1);
            this._iconMask.graphics.drawRect(0,0,459,170);
            this._iconMask.graphics.endFill();
         }
         if(!DisplayUtil.hasParent(this._iconMask))
         {
            this._mainBgMc.addChild(this._iconMask);
            this._iconMask.x = 45;
            this._iconMask.y = 100;
         }
         this._iconMc.mask = this._iconMask;
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(this._mainBgMc))
         {
            LevelManager.appLevel.addChild(this._mainBgMc);
         }
         DisplayUtil.align(this._mainBgMc,null,AlignType.MIDDLE_CENTER);
         if(this._iconMc.numChildren == 0)
         {
            this.addIcon();
         }
         this.addEvent();
      }
      
      public function init(param1:Object = null) : void
      {
         this._infoA = param1 as Array;
      }
      
      private function setPage() : void
      {
         this._pageTxt.text = this._curPage.toString() + "/" + this._totalPage.toString();
      }
      
      public function setup() : void
      {
         this._mainBgMc = new SptBg_MC();
         this._leftMc = this._mainBgMc["leftMc"];
         this._rightMc = this._mainBgMc["rightMc"];
         this._leftBtn = this._mainBgMc["leftBtn"];
         this._rightBtn = this._mainBgMc["rightBtn"];
         this._closeBtn = this._mainBgMc["closeBtn"];
         this._pageTxt = this._mainBgMc["pageTxt"];
         this._dragMc = this._mainBgMc["dragMc"];
         this._dragMc.buttonMode = true;
         this._iconA = new Array();
         this.makeMask();
         this.makePage();
         this.setMoveMcVisible(true,false);
         this.setPage();
      }
      
      private function onUpHandler(param1:MouseEvent) : void
      {
         this._mainBgMc.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onUpHandler);
      }
      
      private function makePage() : void
      {
         this._curPage = 1;
         if(this._allClassA.length <= this._paginal)
         {
            this._totalPage = 1;
         }
         else if(this._allClassA.length % this._paginal == 0)
         {
            this._totalPage = this._allClassA.length / this._paginal;
         }
         else
         {
            this._totalPage = uint(this._allClassA.length / this._paginal) + 1;
         }
      }
      
      private function onCloseBtnClickHAndler(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onDragDownHandler(param1:MouseEvent) : void
      {
         this._mainBgMc.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,this.onUpHandler);
      }
      
      private function addDes(param1:Point, param2:String) : void
      {
         if(!this._desMc)
         {
            this._desMc = new SptDisMc();
         }
         if(DisplayUtil.hasParent(this._desMc) == false)
         {
            this._mainBgMc.addChild(this._desMc);
         }
         this._desMc.x = param1.x + 20;
         this._desMc.y = param1.y + 20;
         this._desMc["disTxt"].text = "描述:";
         this._desMc["desTxt"].text = "    " + param2;
      }
      
      private function removeOldIcon() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._paginal)
         {
            if(this._iconA[_loc1_] != undefined)
            {
               if(this._iconA[_loc1_] != null)
               {
                  this._iconA[_loc1_].removeEventListener(MouseEvent.MOUSE_OVER,this.onIconOverHandler);
                  DisplayUtil.removeForParent(this._iconA[_loc1_]);
                  this._iconA[_loc1_] = null;
               }
            }
            _loc1_++;
         }
         this._iconA.splice(0,this._paginal);
      }
      
      private function addIcon() : void
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:SptInfo = null;
         var _loc4_:int = 0;
         var _loc5_:uint = (this._curPage - 1) * this._paginal;
         var _loc6_:uint = _loc5_ + this._paginal;
         var _loc7_:Array = this._allClassA.slice(_loc5_,_loc6_);
         var _loc8_:Array = this._infoA.slice(_loc5_,_loc6_);
         if(_loc7_.length > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc7_.length)
            {
               _loc2_ = new (_loc7_[_loc1_] as Class)() as MovieClip;
               _loc3_ = _loc8_[_loc1_] as SptInfo;
               _loc2_["name_txt"].text = _loc3_.title;
               if(_loc3_.onLine)
               {
                  _loc2_["mc2"].visible = false;
                  if(_loc3_.status == 3)
                  {
                     _loc2_["win"].visible = true;
                  }
                  else
                  {
                     _loc2_["win"].visible = false;
                  }
               }
               else
               {
                  _loc2_["win"].visible = false;
                  _loc2_["mc1"].visible = false;
                  _loc2_["mc1"].gotoAndStop(1);
               }
               _loc2_["leMc"].gotoAndStop(_loc3_.level);
               this._iconMc.addChild(_loc2_);
               _loc2_.x = this._curMove * (_loc1_ + _loc5_);
               _loc2_.name = "icon" + (_loc1_ + _loc5_);
               _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.onIconOverHandler);
               this._iconA.push(_loc2_);
               _loc1_++;
            }
         }
         if(this._iconA.length % this._paginal != 0)
         {
            _loc4_ = 0;
            while(_loc4_ < this._iconA.length % this._paginal)
            {
               this._iconA.push(null);
               _loc4_++;
            }
         }
      }
      
      private function onIconOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = this._mainBgMc.mouseX;
         var _loc3_:Number = this._mainBgMc.mouseY;
         var _loc4_:Point = new Point(_loc2_,_loc3_);
         var _loc5_:String = String(param1.currentTarget.name);
         var _loc6_:uint = uint(_loc5_.slice(4,_loc5_.length));
         this.addDes(_loc4_,(this._infoA[_loc6_] as SptInfo).description);
         (param1.currentTarget as MovieClip).addEventListener(MouseEvent.MOUSE_MOVE,this.onMoveHandler);
         (param1.currentTarget as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onOutHandler);
      }
      
      private function onLeftBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         if(this._curPage > 1)
         {
            --this._curPage;
            this.setBtnEnabled(false,false);
            if(this._curPage == 1)
            {
               this.setMoveMcVisible(true,false);
            }
            else
            {
               this.setMoveMcVisible(false,false);
            }
            this.setPage();
            this.addIcon();
            _loc2_ = this._iconMc.x + this._curMove * this._paginal;
            this.tween = new TweenMax(this._iconMc,0.3,{"x":_loc2_});
            this.tween.addEventListener(TweenEvent.COMPLETE,this.onTweenHandler);
         }
         else
         {
            this.setMoveMcVisible(true,false);
         }
      }
      
      public function hide() : void
      {
         this.removeEvent();
         DisplayUtil.removeForParent(this._mainBgMc,false);
      }
      
      private function setBtnEnabled(param1:Boolean, param2:Boolean) : void
      {
         this._leftBtn.mouseEnabled = param1;
         this._rightBtn.mouseEnabled = param2;
      }
      
      private function onMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = this._mainBgMc.mouseX;
         var _loc3_:Number = this._mainBgMc.mouseY;
         var _loc4_:Point = new Point(_loc2_,_loc3_);
         var _loc5_:String = String(param1.currentTarget.name);
         var _loc6_:uint = uint(_loc5_.slice(4,_loc5_.length));
         this.addDes(_loc4_,(this._infoA[_loc6_] as SptInfo).description);
      }
      
      private function onOutHandler(param1:MouseEvent) : void
      {
         this.removeDes();
         (param1.currentTarget as MovieClip).removeEventListener(MouseEvent.MOUSE_MOVE,this.onMoveHandler);
         (param1.currentTarget as MovieClip).removeEventListener(MouseEvent.MOUSE_OUT,this.onOutHandler);
      }
      
      private function onTweenHandler(param1:TweenEvent) : void
      {
         this.tween.removeEventListener(TweenEvent.COMPLETE,this.onTweenHandler);
         this.tween = null;
         this.setBtnEnabled(true,true);
         this.removeOldIcon();
      }
      
      private function onRightBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         if(this._curPage < this._totalPage)
         {
            ++this._curPage;
            this.setBtnEnabled(false,false);
            if(this._curPage == this._totalPage)
            {
               this.setMoveMcVisible(false,true);
            }
            else
            {
               this.setMoveMcVisible(false,false);
            }
            this.addIcon();
            this.setPage();
            _loc2_ = this._iconMc.x - this._curMove * this._paginal;
            this.tween = new TweenMax(this._iconMc,0.3,{"x":_loc2_});
            this.tween.addEventListener(TweenEvent.COMPLETE,this.onTweenHandler);
         }
         else
         {
            this.setMoveMcVisible(false,true);
         }
      }
      
      private function removeDes() : void
      {
         if(this._desMc)
         {
            DisplayUtil.removeForParent(this._desMc);
            this._desMc = null;
         }
      }
      
      private function setMoveMcVisible(param1:Boolean, param2:Boolean) : void
      {
         this._leftMc.visible = param1;
         this._rightMc.visible = param2;
      }
      
      private function removeEvent() : void
      {
         this._leftBtn.addEventListener(MouseEvent.CLICK,this.onLeftBtnClickHandler);
         this._rightBtn.addEventListener(MouseEvent.CLICK,this.onRightBtnClickHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseBtnClickHAndler);
         this._dragMc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDragDownHandler);
      }
      
      private function addEvent() : void
      {
         this._leftBtn.addEventListener(MouseEvent.CLICK,this.onLeftBtnClickHandler);
         this._rightBtn.addEventListener(MouseEvent.CLICK,this.onRightBtnClickHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseBtnClickHAndler);
         this._dragMc.addEventListener(MouseEvent.MOUSE_DOWN,this.onDragDownHandler);
      }
      
      public function destroy() : void
      {
         this.hide();
         this._mainBgMc = null;
         this._leftMc = null;
         this._rightMc = null;
         this._leftBtn = null;
         this._rightBtn = null;
         this._closeBtn = null;
         this._pageTxt = null;
         this._dragMc = null;
         this._allClassA = null;
         this._infoA = null;
      }
   }
}

