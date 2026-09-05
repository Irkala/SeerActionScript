package com.robot.module.app
{
   import com.robot.app.task.petstory.util.EventListenerManager;
   import com.robot.core.event.MapEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.ds.HashSet;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   public class SimpleModule extends Sprite implements IModule
   {
      
      private var _eventListenerManager:EventListenerManager;
      
      protected var _ui:MovieClip;
      
      private var _tipObjs:HashSet;
      
      protected var _isRmoveScene:Boolean = false;
      
      public function SimpleModule()
      {
         super();
         this._eventListenerManager = new EventListenerManager();
      }
      
      protected function addMoudleEvent(target:*, type:String, func:Function) : void
      {
         this._eventListenerManager.addEventListener(target,type,func);
      }
      
      protected function removeMoudleEvent(target:*, type:String = null, func:Function = null) : void
      {
         this._eventListenerManager.removeEventListener(target,type,func);
      }
      
      public function setup() : void
      {
         throw new Error("need override");
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._ui);
         if(null != this._ui["close_btn"])
         {
            this.addMoudleEvent(this._ui["close_btn"],MouseEvent.CLICK,this.onClose);
         }
         if(this._isRmoveScene)
         {
            LevelManager.showOrRemoveMapLevelandToolslevel(false,true);
         }
         MapManager.addEventListener(MapEvent.MAP_SWITCH_COMPLETE,this.onMapChange);
      }
      
      private function onMapChange(e:*) : void
      {
         this.hide();
         MapManager.removeEventListener(MapEvent.MAP_SWITCH_COMPLETE,this.onMapChange);
      }
      
      protected function onClose(e:*) : void
      {
         this.hide();
      }
      
      public function hide() : void
      {
         if(this._isRmoveScene)
         {
            LevelManager.showOrRemoveMapLevelandToolslevel(true);
         }
         DisplayUtil.removeForParent(this._ui);
         ModuleManager.destroyForInstance(this);
      }
      
      public function destroy() : void
      {
         if(Boolean(this._eventListenerManager))
         {
            this._eventListenerManager.clear();
            this._eventListenerManager = null;
         }
         this.clearTips();
         DisplayUtil.removeForParent(this._ui);
         MapManager.removeEventListener(MapEvent.MAP_SWITCH_COMPLETE,this.onMapChange);
         this._ui = null;
      }
      
      public function addModuleTip(obj:InteractiveObject, tip:String) : void
      {
         ToolTipManager.add(obj,tip);
         if(null == this._tipObjs)
         {
            this._tipObjs = new HashSet();
         }
         this._tipObjs.add(obj);
      }
      
      protected function clearTips() : void
      {
         var obj:InteractiveObject = null;
         if(this._tipObjs == null)
         {
            return;
         }
         var allObjs:Array = this._tipObjs.toArray();
         for each(obj in allObjs)
         {
            ToolTipManager.remove(obj);
            this._tipObjs.remove(obj);
         }
         this._tipObjs.clear();
         this._tipObjs = null;
      }
      
      protected function closeEvent() : void
      {
         if(this._ui != null)
         {
            this._ui.mouseChildren = this._ui.mouseEnabled = false;
         }
      }
      
      protected function openEvent() : void
      {
         if(this._ui != null)
         {
            this._ui.mouseChildren = this._ui.mouseEnabled = true;
         }
      }
   }
}

