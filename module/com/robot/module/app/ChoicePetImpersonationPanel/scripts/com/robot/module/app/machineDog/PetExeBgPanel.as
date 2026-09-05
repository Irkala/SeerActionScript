package com.robot.module.app.machineDog
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.info.pet.PetListInfo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class PetExeBgPanel extends Sprite
   {
      
      private var _showMc:MovieClip;
      
      private var _bgMc:PetExeBg_MC;
      
      private var _info:PetListInfo;
      
      public function PetExeBgPanel()
      {
         super();
         _bgMc = new PetExeBg_MC();
         this.addChild(_bgMc);
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         var rec:Rectangle = null;
         _showMc = o as MovieClip;
         if(_showMc)
         {
            DisplayUtil.stopAllMovieClip(_showMc);
            _bgMc.addChild(_showMc);
            rec = _bgMc.getBounds(_showMc);
            _showMc.x -= rec.x;
            _showMc.y -= rec.y;
            _showMc.x -= (_showMc.width - 47) / 2;
            _showMc.y -= (_showMc.height - 47) / 2;
         }
      }
      
      public function get info() : PetListInfo
      {
         return _info;
      }
      
      public function removePet() : void
      {
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
         if(_info)
         {
            _info = null;
         }
      }
      
      public function addPet(info:PetListInfo) : void
      {
         _info = info;
         ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id),onShowComplete,"pet");
      }
   }
}

