package com.robot.module.app.expadm
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.info.pet.PetInfo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class ExpAdmListItem extends Sprite
   {
      
      private var _showMc:MovieClip;
      
      private var _bg:UI_ExpAdmListItem;
      
      public var info:PetInfo;
      
      public function ExpAdmListItem()
      {
         super();
         _bg = new UI_ExpAdmListItem();
         addChild(_bg);
      }
      
      public function clear() : void
      {
         info = null;
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
      }
      
      public function setSelect(b:Boolean) : void
      {
         if(b)
         {
            _bg.filters = [new GlowFilter(16776960,1,5,5,10)];
         }
         else
         {
            _bg.filters = [];
         }
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         _showMc = o as MovieClip;
         if(_showMc)
         {
            DisplayUtil.stopAllMovieClip(_showMc);
            _showMc.x = 28;
            _showMc.y = 42;
            addChild(_showMc);
         }
      }
      
      public function destroy() : void
      {
         _bg = null;
         clear();
      }
      
      public function show(i:PetInfo) : void
      {
         clear();
         info = i;
         ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id),onShowComplete,"pet");
      }
   }
}

