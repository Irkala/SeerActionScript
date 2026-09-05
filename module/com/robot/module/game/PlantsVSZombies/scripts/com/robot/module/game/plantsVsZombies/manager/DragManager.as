package com.robot.module.game.plantsVsZombies.manager
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.card.BasePlantsCard;
   import com.robot.module.game.plantsVsZombies.card.RemoveCard;
   import com.robot.module.game.plantsVsZombies.event.DragEvent;
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import com.robot.module.game.plantsVsZombies.ob.PlantsGridObserver;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.utils.DisplayUtil;
   
   public class DragManager
   {
      
      private static var gridOb:PlantsGridObserver;
      
      private static var oldMC:Sprite;
      
      private static var currentCard:BasePlantsCard;
      
      private static var currentType:uint;
      
      private static var instance:EventDispatcher;
      
      private static var currentGrid:BasePlantsGrid;
      
      public function DragManager()
      {
         super();
      }
      
      public static function destroy() : void
      {
         clear();
         gridOb = null;
      }
      
      public static function dispatchEvent(event:Event) : void
      {
         getInstance().dispatchEvent(event);
      }
      
      public static function willTrigger(type:String) : Boolean
      {
         return getInstance().willTrigger(type);
      }
      
      private static function getInstance() : EventDispatcher
      {
         if(instance == null)
         {
            instance = new EventDispatcher();
         }
         return instance;
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         getInstance().removeEventListener(type,listener,useCapture);
      }
      
      public static function clear() : void
      {
         if(oldMC)
         {
            oldMC.stopDrag();
            oldMC.removeEventListener(MouseEvent.CLICK,clickHandler);
            oldMC.removeEventListener(MouseEvent.MOUSE_MOVE,onMoveHandler);
         }
         DisplayUtil.removeForParent(oldMC);
         oldMC = null;
         currentGrid = null;
         if(currentCard)
         {
            currentCard.destroy();
            currentCard = null;
         }
      }
      
      private static function clickHandler(event:MouseEvent) : void
      {
         oldMC.stopDrag();
         oldMC.removeEventListener(MouseEvent.CLICK,clickHandler);
         oldMC.removeEventListener(MouseEvent.MOUSE_MOVE,onMoveHandler);
         DisplayUtil.removeForParent(oldMC);
         oldMC = null;
         currentCard.alpha = 1;
         if(currentGrid)
         {
            if(currentCard is RemoveCard)
            {
               currentGrid.carvernOut();
               currentGrid.alpha = 1;
            }
            else
            {
               currentGrid.put(currentType);
               dispatchEvent(new DragEvent(DragEvent.DRAG_OVER,currentCard));
            }
         }
         currentGrid = null;
         currentCard = null;
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         getInstance().addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function startDrag(card:BasePlantsCard) : void
      {
         currentCard = card;
         currentCard.alpha = 0.5;
         currentType = card.type;
         if(oldMC)
         {
            oldMC.stopDrag();
            oldMC.removeEventListener(MouseEvent.CLICK,clickHandler);
            oldMC.removeEventListener(MouseEvent.MOUSE_MOVE,onMoveHandler);
         }
         var mc:Sprite = new Sprite();
         mc.addChild(DisplayUtil.copyDisplayAsBmp(card.icon));
         mc.x = MainManager.getStage().mouseX - mc.width / 2;
         mc.y = MainManager.getStage().mouseY - mc.height / 2;
         oldMC = mc;
         LevelManager.gameLevel.addChild(mc);
         mc.startDrag();
         mc.addEventListener(MouseEvent.MOUSE_MOVE,onMoveHandler);
         mc.addEventListener(MouseEvent.CLICK,clickHandler);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return getInstance().hasEventListener(type);
      }
      
      private static function onMoveHandler(event:MouseEvent) : void
      {
         var i:BasePlantsGrid = null;
         var p:Point = null;
         var j:uint = 0;
         currentGrid = null;
         var array:Array = [];
         for each(i in gridOb.gridList)
         {
            i.clearPrev();
            i.alpha = 1;
            if(currentCard is RemoveCard)
            {
               if(i.hitTestObject(oldMC) && i.isPut)
               {
                  array.push(i);
               }
            }
            else if(i.hitTestObject(oldMC) && !i.isPut)
            {
               array.push(i);
            }
         }
         if(array.length > 0)
         {
            p = oldMC.localToGlobal(new Point());
            currentGrid = array[0];
            for(j = 1; j < array.length; j++)
            {
               if(Point.distance(array[j].localToGlobal(new Point()),p) < Point.distance(currentGrid.localToGlobal(new Point()),p))
               {
                  currentGrid = array[j];
               }
            }
            if(currentCard is RemoveCard)
            {
               currentGrid.alpha = 0.5;
            }
            else
            {
               currentGrid.showPrev(oldMC);
            }
         }
      }
      
      public static function setup(_gridOb:PlantsGridObserver) : void
      {
         gridOb = _gridOb;
      }
   }
}

