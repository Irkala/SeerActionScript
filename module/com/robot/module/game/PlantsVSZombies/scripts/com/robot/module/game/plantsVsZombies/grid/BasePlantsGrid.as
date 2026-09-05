package com.robot.module.game.plantsVsZombies.grid
{
   import com.robot.module.game.plantsVsZombies.PlantsFactory;
   import com.robot.module.game.plantsVsZombies.event.PlantsEvent;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.plants.IPlants;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class BasePlantsGrid extends Sprite
   {
      
      private var smokeMC:MovieClip;
      
      private var _isPut:Boolean = false;
      
      private var isShow:Boolean = false;
      
      private var isCanPut:Boolean;
      
      private var _prevBmp:Bitmap;
      
      private var _plants:IPlants;
      
      private var _xIndex:uint;
      
      public var row:uint;
      
      public function BasePlantsGrid(index:uint)
      {
         super();
         this.graphics.drawRect(0,0,GridDataManager.gridDim.width,GridDataManager.gridDim.height);
         isCanPut = true;
         _xIndex = index;
         smokeMC = new plants_smoke_mc();
         smokeMC.x = this.width / 2;
         smokeMC.y = this.height / 2;
         smokeMC.gotoAndStop(1);
      }
      
      public function clearPrev() : void
      {
         DisplayUtil.removeForParent(_prevBmp);
         isShow = false;
      }
      
      public function get plantes() : IPlants
      {
         return _plants;
      }
      
      public function put(type:uint) : void
      {
         if(!isCanPut)
         {
            return;
         }
         clearPrev();
         _plants = PlantsFactory.createPlants(type,_xIndex);
         addChild(_plants.sprite);
         _plants.sprite.x = GridDataManager.gridDim.width / 2;
         _plants.sprite.y = GridDataManager.gridDim.height / 2 + 20;
         _plants.row = this.row;
         _plants.addEventListener(PlantsEvent.DIE,onPlantsDie);
         _isPut = true;
      }
      
      public function showPrev(o:DisplayObject) : void
      {
         if(isShow)
         {
            return;
         }
         _prevBmp = DisplayUtil.copyDisplayAsBmp(o);
         _prevBmp.alpha = 0.5;
         DisplayUtil.align(_prevBmp,this.getBounds(this),AlignType.MIDDLE_CENTER);
         addChild(_prevBmp);
         isShow = true;
      }
      
      private function onPlantsDie(event:PlantsEvent) : void
      {
         carvernOut();
      }
      
      public function destroy() : void
      {
         carvernOut();
         DisplayUtil.removeForParent(_prevBmp);
         _prevBmp = null;
         smokeMC = null;
      }
      
      public function get isPut() : Boolean
      {
         return _isPut;
      }
      
      public function carvernOut(isSmoke:Boolean = true) : void
      {
         clearPrev();
         if(isSmoke)
         {
            smokeMC.gotoAndPlay(2);
            addChild(smokeMC);
            setTimeout(function():void
            {
               DisplayUtil.removeForParent(smokeMC,false);
            },500);
         }
         if(_plants)
         {
            _plants.removeEventListener(PlantsEvent.DIE,onPlantsDie);
            DisplayUtil.removeForParent(_plants.sprite);
            _plants.destroy();
            _plants = null;
         }
         _isPut = false;
      }
   }
}

