package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.plantsVsZombies.card.*;
   import com.robot.module.game.plantsVsZombies.event.DragEvent;
   import com.robot.module.game.plantsVsZombies.manager.DragManager;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class PlantsTopBoxObserver extends GameObserver implements IGameObserver
   {
      
      public static var txt:TextField;
      
      public static var cardArray:Array = [];
      
      private var timer:Timer;
      
      private var mc:MovieClip;
      
      private var array:Array = [[Card_3],[Card_3,Card_2],[Card_3,Card_2,Card_4],[Card_3,Card_2,Card_4,Card_1],[Card_3,Card_2,Card_4,Card_1],[SunshineCard_1,SunshineCard_2,SunshineCard_3,SunshineCard_4]];
      
      private var cardBox:Sprite;
      
      private var toolMC:MovieClip;
      
      private var removeCard:RemoveCard;
      
      private var isChangeTop:Boolean = false;
      
      public function PlantsTopBoxObserver(subject:GameSubject)
      {
         super(subject);
         mc = new plants_top_mc();
         mc["maskMC"].gotoAndStop(1);
         txt = mc["txt"];
         subject.container.addChild(mc);
         timer = new Timer(3000);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
         var mask:Shape = new Shape();
         mask.graphics.beginFill(0);
         mask.graphics.drawRect(0,0,822,296);
         mc.addChild(mask);
         cardBox = new Sprite();
         cardBox.x = 24;
         cardBox.mask = mask;
         mc.addChildAt(cardBox,1);
         toolMC = mc["toolMC"];
         toolMC.buttonMode = true;
         removeCard = new RemoveCard();
      }
      
      private function clickTool(event:MouseEvent) : void
      {
         DragManager.startDrag(removeCard);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         ToolTipManager.remove(toolMC);
         DragManager.removeEventListener(DragEvent.DRAG_OVER,onDragOver);
         toolMC.removeEventListener(MouseEvent.CLICK,clickTool);
         DisplayUtil.removeForParent(mc);
         mc = null;
         timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
         timer = null;
      }
      
      private function onTimerHandler(event:TimerEvent) : void
      {
         if(cardArray.length >= 8)
         {
            return;
         }
         var array:Array = this.array[PlantsLevelManager.level];
         var cls:Class = array[Math.floor(Math.random() * array.length)];
         var card:BasePlantsCard = new cls();
         cardArray.push(card);
         card.x = 830;
         cardBox.addChild(card);
         card.setup();
         card.addEventListener(MouseEvent.CLICK,clickCardHandler);
      }
      
      override public function gameStart() : void
      {
         isChangeTop = false;
         toolMC.addEventListener(MouseEvent.CLICK,clickTool);
         ToolTipManager.add(toolMC,"从地面移除一个精灵");
         DragManager.addEventListener(DragEvent.DRAG_OVER,onDragOver);
         timer.start();
      }
      
      override public function nextLevel() : void
      {
         var arr:Array = null;
         var count:uint = 0;
         var i:Class = null;
         var card:BasePlantsCard = null;
         if(PlantsLevelManager.level < 5)
         {
            timer.start();
         }
         else
         {
            if(!isChangeTop)
            {
               isChangeTop = true;
               mc["maskMC"].gotoAndStop(2);
            }
            if(PlantsLevelManager.level > array.length - 1)
            {
               arr = array[array.length - 1];
            }
            else
            {
               arr = array[PlantsLevelManager.level];
            }
            count = 0;
            for each(i in arr)
            {
               trace(".................",i);
               card = new i() as BasePlantsCard;
               card.x = 100 * count;
               card.y = 20;
               card.setup();
               cardBox.addChild(card);
               cardArray.push(card);
               card.addEventListener(MouseEvent.CLICK,clickCardHandler);
               count++;
            }
         }
      }
      
      override public function gameOver() : void
      {
         var i:BasePlantsCard = null;
         for each(i in cardArray)
         {
            DisplayUtil.removeForParent(i);
            i.removeEventListener(MouseEvent.CLICK,clickCardHandler);
            i.destroy();
         }
         timer.stop();
         cardArray = [];
      }
      
      private function onDragOver(event:DragEvent) : void
      {
         var i:BasePlantsCard = null;
         var card:BasePlantsCard = event.card;
         card.useCard();
         if(card is BaseSunshineCard)
         {
            return;
         }
         var index:int = cardArray.indexOf(card);
         if(index != -1)
         {
            cardArray.splice(index,1);
         }
         for each(i in cardArray)
         {
            i.setup();
         }
      }
      
      private function clickCardHandler(event:MouseEvent) : void
      {
         var card:BasePlantsCard = event.currentTarget as BasePlantsCard;
         DragManager.startDrag(card);
      }
   }
}

