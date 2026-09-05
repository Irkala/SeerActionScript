package com.robot.module.book
{
   import com.robot.core.event.MapEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.effect.ColorFilter;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class BreedFormulaBook extends Sprite implements IModule
   {
      
      private var _panel:MovieClip;
      
      private var _prevBtn:SimpleButton;
      
      private var _nextBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _map_0:Array = [0,0,0,330,17,0,0,0,0,0];
      
      private var _map_1:Array = [0,0,0,429,0,0,0,0,0,0];
      
      public function BreedFormulaBook()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         this._panel = new BreedFormulaBook_ui();
         this._prevBtn = this._panel["prev"];
         this._nextBtn = this._panel["next"];
         this._closeBtn = this._panel["close"];
      }
      
      public function show() : void
      {
         this._panel["main"].gotoAndStop(1);
         this.update();
         LevelManager.appLevel.addChild(this._panel);
         DisplayUtil.align(this._panel,null,AlignType.MIDDLE_CENTER);
         this._panel["go_0"].addEventListener(MouseEvent.CLICK,this.onGo_0);
         this._panel["go_1"].addEventListener(MouseEvent.CLICK,this.onGo_1);
         this._prevBtn.addEventListener(MouseEvent.CLICK,this.onPrevClick);
         this._nextBtn.addEventListener(MouseEvent.CLICK,this.onNextClick);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseClick);
         MapManager.addEventListener(MapEvent.MAP_DESTROY,this.onMapDestory);
      }
      
      private function onGo_0(e:MouseEvent) : void
      {
         var id:uint = uint(this._map_0[this._panel["main"].currentFrame - 1]);
         ModuleManager.destroyForInstance(this);
         MapManager.changeMap(id);
      }
      
      private function onGo_1(e:MouseEvent) : void
      {
         var id:uint = 0;
         if(this._panel["main"].currentFrame == 4)
         {
            ModuleManager.destroyForInstance(this);
            MapManager.changeMap(435);
         }
         else
         {
            id = uint(this._map_0[this._panel["main"].currentFrame - 1]);
            ModuleManager.destroyForInstance(this);
            MapManager.changeMap(id);
         }
      }
      
      private function onPrevClick(e:MouseEvent) : void
      {
         this._panel["main"].gotoAndStop(this._panel["main"].currentFrame - 1);
         this.update();
      }
      
      private function onNextClick(e:MouseEvent) : void
      {
         this._panel["main"].gotoAndStop(this._panel["main"].currentFrame + 1);
         this.update();
      }
      
      private function onCloseClick(e:MouseEvent) : void
      {
         ModuleManager.destroyForInstance(this);
      }
      
      private function onMapDestory(e:MapEvent) : void
      {
         ModuleManager.destroyForInstance(this);
      }
      
      private function update() : void
      {
         if(this._panel["main"].currentFrame == 1)
         {
            this.setBtnEnabled(this._prevBtn,false);
         }
         else
         {
            this.setBtnEnabled(this._prevBtn,true);
         }
         if(this._panel["main"].currentFrame == this._panel["main"].totalFrames)
         {
            this.setBtnEnabled(this._nextBtn,false);
         }
         else
         {
            this.setBtnEnabled(this._nextBtn,true);
         }
         if(this._map_0[this._panel["main"].currentFrame - 1] == 0)
         {
            this._panel["go_0"].visible = false;
         }
         else
         {
            this._panel["go_0"].visible = true;
         }
         if(this._map_1[this._panel["main"].currentFrame - 1] == 0)
         {
            this._panel["go_1"].visible = false;
         }
         else
         {
            this._panel["go_1"].visible = true;
         }
         this._panel["page"].text = this._panel["main"].currentFrame + "/" + this._panel["main"].totalFrames;
      }
      
      private function setBtnEnabled(btn:SimpleButton, b:Boolean) : void
      {
         if(b)
         {
            btn.enabled = true;
            btn.mouseEnabled = true;
            btn.filters = null;
         }
         else
         {
            btn.enabled = false;
            btn.mouseEnabled = false;
            btn.filters = [ColorFilter.setGrayscale()];
         }
      }
      
      public function hide() : void
      {
         ModuleManager.destroyForInstance(this);
      }
      
      public function destroy() : void
      {
         DisplayUtil.removeForParent(this._panel);
         this._panel["go_0"].removeEventListener(MouseEvent.CLICK,this.onGo_0);
         this._panel["go_1"].removeEventListener(MouseEvent.CLICK,this.onGo_1);
         this._prevBtn.removeEventListener(MouseEvent.CLICK,this.onPrevClick);
         this._nextBtn.removeEventListener(MouseEvent.CLICK,this.onNextClick);
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseClick);
         MapManager.removeEventListener(MapEvent.MAP_DESTROY,this.onMapDestory);
         this._panel = null;
         this._prevBtn = null;
         this._nextBtn = null;
         this._closeBtn = null;
      }
   }
}

