package com.robot.module.app.petStorage
{
   import com.robot.app.sceneInteraction.RoomPetManager;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.info.pet.PetListInfo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class PetListItem extends Sprite
   {
      
      private var panel:MLoadPane;
      
      private var _exeMc:Sprite;
      
      private var _info:PetListInfo;
      
      private var _sbgmc:DisplayObject;
      
      private var _yinmc:DisplayObject;
      
      private var _obj:MovieClip;
      
      private var _bgmc:DisplayObject;
      
      private var _select:Boolean;
      
      public function PetListItem()
      {
         super();
         buttonMode = true;
         mouseChildren = false;
         var _loc1_:PetStorage_ListItem_bg = new PetStorage_ListItem_bg();
         addChild(_loc1_);
         this._sbgmc = _loc1_["sbgMc"];
         this._bgmc = _loc1_["bgMc"];
         this._yinmc = _loc1_["yinMc"];
         this._yinmc.visible = false;
         this._exeMc = _loc1_["exeMc"];
         this._exeMc.visible = false;
         this.select = false;
      }
      
      public function get select() : Boolean
      {
         return this._select;
      }
      
      public function clear() : void
      {
         if(this._info)
         {
            ResourceManager.cancel(ClientConfig.getPetSwfPath(this._info.skinID != 0 ? uint(this._info.skinID) : uint(this._info.id)),this.onLoadPet);
         }
         this._info = null;
         if(this._obj)
         {
            DisplayUtil.removeForParent(this._obj);
            this._obj = null;
         }
         if(this.panel)
         {
            this.panel.destroy();
            this.panel = null;
         }
         this._yinmc.visible = false;
         this._exeMc.visible = false;
      }
      
      private function onLoadPet(param1:DisplayObject) : void
      {
         this._obj = param1 as MovieClip;
         DisplayUtil.stopAllMovieClip(this._obj);
         this.panel = new MLoadPane(this._obj,MLoadPane.FIT_NONE);
         this.panel.setSizeWH(this._bgmc.width,this._bgmc.height);
         this.panel.x = this._bgmc.x;
         this.panel.y = this._bgmc.y;
         addChild(this.panel);
         addChild(this._yinmc);
      }
      
      public function get info() : PetListInfo
      {
         return this._info;
      }
      
      public function set info(param1:PetListInfo) : void
      {
         if(this._info)
         {
            ResourceManager.cancel(ClientConfig.getPetSwfPath(this._info.skinID != 0 ? uint(this._info.skinID) : uint(this._info.id)),this.onLoadPet);
         }
         this._info = param1;
         if(this._obj)
         {
            DisplayUtil.removeForParent(this._obj);
            this._obj = null;
         }
         ResourceManager.getResource(ClientConfig.getPetSwfPath(this._info.skinID != 0 ? uint(this._info.skinID) : uint(this._info.id)),this.onLoadPet,"pet");
         if(RoomPetManager.getInstance().contains(this._info.catchTime))
         {
            this._yinmc.visible = true;
         }
         if(this._info.course > 0)
         {
            this._exeMc.visible = true;
         }
         else
         {
            this._exeMc.visible = false;
         }
      }
      
      public function set select(param1:Boolean) : void
      {
         this._select = param1;
         if(this._select)
         {
            this._sbgmc.visible = true;
         }
         else
         {
            this._sbgmc.visible = false;
         }
      }
   }
}

