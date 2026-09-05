package com.robot.module.app.item
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class Item extends Sprite
   {
      
      private var _itemBG:SP_BG_MC;
      
      private var _oldUrl:String = "";
      
      private var _iconP:MLoadPane;
      
      private var _iconMc:Sprite;
      
      public function Item()
      {
         super();
         this._itemBG = new SP_BG_MC();
         this.addChild(this._itemBG);
      }
      
      public function setVi(param1:uint) : void
      {
         this._itemBG.visible = true;
         this._itemBG.gotoAndStop(param1);
      }
      
      public function show(param1:String = "", param2:String = "") : void
      {
         if(this._oldUrl != "")
         {
            ResourceManager.cancelURL(this._oldUrl);
         }
         if(this._iconP)
         {
            this._iconP.destroy();
            DisplayUtil.removeForParent(this._iconP);
            this._iconP = null;
         }
         this._itemBG.gotoAndStop(1);
         if(param1 == "")
         {
            this._itemBG.visible = false;
            return;
         }
         this._itemBG.visible = true;
         this._oldUrl = param1;
         if(param2 != "")
         {
            ResourceManager.getResource(param1,this.onComHandler,param2);
         }
         else
         {
            ResourceManager.getResource(param1,this.onComHandler);
         }
      }
      
      private function onComHandler(param1:DisplayObject) : void
      {
         DisplayUtil.stopAllMovieClip(param1 as MovieClip);
         this._iconP = new MLoadPane(param1);
         if(param1.width > param1.height)
         {
            this._iconP.fitType = MLoadPane.FIT_WIDTH;
         }
         else
         {
            this._iconP.fitType = MLoadPane.FIT_HEIGHT;
         }
         this._iconP.setSizeWH(40,40);
         this._iconP.x = this._iconP.y = 2.4;
         this.addChild(this._iconP);
      }
   }
}

