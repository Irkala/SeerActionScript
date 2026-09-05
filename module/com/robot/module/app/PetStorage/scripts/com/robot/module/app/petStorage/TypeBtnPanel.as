package com.robot.module.app.petStorage
{
   import com.robot.core.config.xml.SkillXMLInfo;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import org.taomee.ds.HashMap;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.ToolTipManager;
   
   public class TypeBtnPanel extends EventDispatcher
   {
      
      private var _glow:GlowFilter;
      
      private const length:uint = 18;
      
      private var _btnMap:HashMap;
      
      private var _preBtn:SimpleButton;
      
      private var _nextBtn:SimpleButton;
      
      private var _simpleTypeBtn:SimpleButton;
      
      private var _complexTypeBtn:SimpleButton;
      
      private var _pageText:TextField;
      
      public var isSimpleType:Boolean = true;
      
      private var pageNum:int = 1;
      
      private var pageTotal:int = 2;
      
      private var _ui:MovieClip;
      
      public function TypeBtnPanel(param1:MovieClip, param2:uint)
      {
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:SimpleButton = null;
         var _loc6_:MovieClip = null;
         var _loc7_:int = 0;
         var _loc8_:SimpleButton = null;
         this._ui = param1;
         this._preBtn = param1.getChildByName("typePreBtn") as SimpleButton;
         this._nextBtn = param1.getChildByName("typeNextBtn") as SimpleButton;
         this._simpleTypeBtn = param1.getChildByName("simpleTypeBtn") as SimpleButton;
         this._complexTypeBtn = param1.getChildByName("complexTypeBtn") as SimpleButton;
         this._pageText = param1.getChildByName("tyepPageTxt") as TextField;
         this._pageText.text = "1 / " + this.pageTotal.toString();
         this._ui.gotoAndStop("simpleTypePage1");
         this._preBtn.addEventListener(MouseEvent.CLICK,this.prePage);
         this._nextBtn.addEventListener(MouseEvent.CLICK,this.nextPage);
         this._simpleTypeBtn.addEventListener(MouseEvent.CLICK,this.changeToSimpleTypePage);
         this._complexTypeBtn.addEventListener(MouseEvent.CLICK,this.changeToComplexTypePage);
         var _loc9_:int = 0;
         var _loc10_:SimpleButton = null;
         this._btnMap = new HashMap();
         this._glow = new GlowFilter(16776960,1,4,4,10);
         super();
         this._btnMap = new HashMap();
         var _loc11_:int = 1;
         while(_loc11_ <= 2)
         {
            _loc3_ = param1.getChildByName("simpleTypePage" + _loc11_.toString()) as MovieClip;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               try
               {
                  _loc5_ = _loc3_.getChildAt(_loc4_) as SimpleButton;
                  if(_loc5_.name != "")
                  {
                     _loc9_ = int(_loc5_.name.split("_")[1]);
                     _loc10_ = _loc5_;
                     ToolTipManager.add(_loc10_,SkillXMLInfo.petTypeName(_loc9_) + "系");
                     _loc10_.addEventListener(MouseEvent.CLICK,this.onClick);
                     _loc10_.filters = [];
                     this._btnMap.add(_loc10_,_loc9_);
                  }
               }
               catch(error:Error)
               {
               }
               _loc4_++;
            }
            _loc11_++;
         }
         var _loc12_:int = 1;
         while(_loc12_ <= 6)
         {
            _loc6_ = param1.getChildByName("complexTypePage" + _loc12_.toString()) as MovieClip;
            _loc7_ = 0;
            while(_loc7_ < _loc6_.numChildren)
            {
               try
               {
                  _loc8_ = _loc6_.getChildAt(_loc7_) as SimpleButton;
                  if(_loc8_.name != "")
                  {
                     _loc9_ = int(_loc8_.name.split("_")[1]);
                     _loc10_ = _loc8_;
                     ToolTipManager.add(_loc10_,SkillXMLInfo.petTypeName(_loc9_) + "系");
                     _loc10_.addEventListener(MouseEvent.CLICK,this.onClick);
                     _loc10_.filters = [];
                     this._btnMap.add(_loc10_,_loc9_);
                  }
               }
               catch(error:Error)
               {
               }
               _loc7_++;
            }
            _loc12_++;
         }
         var _loc13_:SimpleButton = this._btnMap.getKey(param2) as SimpleButton;
         if(_loc13_)
         {
            _loc13_.filters = [this._glow];
         }
         param1.getChildByName("simpleTypePage1").visible = true;
         param1.getChildByName("simpleTypePage2").visible = false;
         var _loc14_:int = 1;
         while(_loc14_ <= 6)
         {
            param1.getChildByName("complexTypePage" + _loc14_.toString()).visible = false;
            _loc14_++;
         }
      }
      
      private function changeToSimpleTypePage(param1:MouseEvent) : void
      {
         if(this.isSimpleType)
         {
            return;
         }
         this.isSimpleType = true;
         this._ui.getChildByName("simpleTypePage1").visible = true;
         this._ui.getChildByName("simpleTypePage2").visible = false;
         var _loc2_:int = 1;
         while(_loc2_ <= 6)
         {
            this._ui.getChildByName("complexTypePage" + _loc2_.toString()).visible = false;
            _loc2_++;
         }
         this.pageTotal = 2;
         this.pageNum = 1;
         this._pageText.text = this.pageNum.toString() + " / " + this.pageTotal.toString();
      }
      
      private function changeToComplexTypePage(param1:MouseEvent) : void
      {
         if(!this.isSimpleType)
         {
            return;
         }
         this.isSimpleType = false;
         this._ui.getChildByName("simpleTypePage1").visible = false;
         this._ui.getChildByName("simpleTypePage2").visible = false;
         this._ui.getChildByName("complexTypePage1").visible = true;
         var _loc2_:int = 2;
         while(_loc2_ <= 6)
         {
            this._ui.getChildByName("complexTypePage" + _loc2_.toString()).visible = false;
            _loc2_++;
         }
         this.pageTotal = 6;
         this.pageNum = 1;
         this._pageText.text = this.pageNum.toString() + " / " + this.pageTotal.toString();
      }
      
      private function prePage(param1:MouseEvent) : void
      {
         --this.pageNum;
         if(this.pageNum < 1)
         {
            this.pageNum = 1;
         }
         var _loc2_:int = 1;
         while(_loc2_ <= this.pageTotal)
         {
            this._ui.getChildByName((this.isSimpleType ? "simpleTypePage" : "complexTypePage") + _loc2_.toString()).visible = _loc2_ == this.pageNum;
            _loc2_++;
         }
         this._pageText.text = this.pageNum.toString() + " / " + this.pageTotal.toString();
      }
      
      private function nextPage(param1:MouseEvent) : void
      {
         this.pageNum += 1;
         if(this.pageNum > this.pageTotal)
         {
            this.pageNum = this.pageTotal;
         }
         var _loc2_:int = 1;
         while(_loc2_ <= this.pageTotal)
         {
            this._ui.getChildByName((this.isSimpleType ? "simpleTypePage" : "complexTypePage") + _loc2_.toString()).visible = _loc2_ == this.pageNum;
            _loc2_++;
         }
         this._pageText.text = this.pageNum.toString() + " / " + this.pageTotal.toString();
      }
      
      public function destroy() : void
      {
         this._btnMap.eachKey(function(param1:SimpleButton):void
         {
            ToolTipManager.remove(param1);
         });
         this._btnMap = null;
         this._glow = null;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this._btnMap.eachKey(function(param1:SimpleButton):void
         {
            param1.filters = [];
         });
         (e.currentTarget as SimpleButton).filters = [this._glow];
         dispatchEvent(new DynamicEvent(MouseEvent.CLICK,this._btnMap.getValue(e.currentTarget)));
      }
   }
}

