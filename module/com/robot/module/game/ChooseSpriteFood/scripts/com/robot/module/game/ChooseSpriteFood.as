package com.robot.module.game
{
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import gs.TweenLite;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ChooseSpriteFood extends Sprite implements IModule
   {
      
      private static const leftVerge:Number = 260;
      
      private static const rightVerge:Number = 459;
      
      private var food_0:MovieClip;
      
      private var food_2:MovieClip;
      
      private var food_3:MovieClip;
      
      private var food_1:MovieClip;
      
      private var foodArr:Array = [];
      
      private var handHit:MovieClip;
      
      private var chosSpriteFoodPanel:MovieClip;
      
      private var foodType:String;
      
      private var foodContainer:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var typeMC:MovieClip;
      
      private var dragedFood:MovieClip;
      
      private var hand:MovieClip;
      
      private var petType:String;
      
      private var plierMC:MovieClip;
      
      public function ChooseSpriteFood()
      {
         super();
      }
      
      public function destroy() : void
      {
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(chosSpriteFoodPanel))
         {
            return;
         }
         LevelManager.appLevel.addChild(chosSpriteFoodPanel);
         DisplayUtil.align(chosSpriteFoodPanel,null,AlignType.MIDDLE_CENTER);
      }
      
      public function setup() : void
      {
         chosSpriteFoodPanel = new ChosSpriteFoodPanel();
         hand = chosSpriteFoodPanel["hand"];
         hand.gotoAndStop(1);
         food_0 = chosSpriteFoodPanel["food_0"];
         food_1 = chosSpriteFoodPanel["food_1"];
         food_2 = chosSpriteFoodPanel["food_2"];
         food_3 = chosSpriteFoodPanel["food_3"];
         foodArr = [food_0,food_1,food_2,food_3];
         foodContainer = hand["foodContainer"];
         handHit = hand["handHit"];
         plierMC = hand["plierMC"];
         plierMC.gotoAndStop(1);
         petType = PetXMLInfo.getType(MainManager.actorModel.pet.info.petID);
         typeMC = chosSpriteFoodPanel["typeMC"];
         typeMC.gotoAndStop(petType);
         closeBtn = chosSpriteFoodPanel["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function checkGetFood() : Boolean
      {
         var type:uint = uint(petType);
         if(type == 1 || type == 2 || type == 3 || type == 4)
         {
            if(foodType == "food_0")
            {
               return true;
            }
         }
         if(type == 5 || type == 6 || type == 7 || type == 8)
         {
            if(foodType == "food_1")
            {
               return true;
            }
         }
         if(type == 9 || type == 10 || type == 11 || type == 12)
         {
            if(foodType == "food_2")
            {
               return true;
            }
         }
         if(type == 13 || type == 14 || type == 15 || type == 16)
         {
            if(foodType == "food_3")
            {
               return true;
            }
         }
         return false;
      }
      
      private function returnFood(evt:Event) : void
      {
         var timer:Timer = null;
         if(hand.currentFrame == hand.totalFrames)
         {
            hand.removeEventListener(Event.ENTER_FRAME,returnFood);
            hand.gotoAndStop(1);
            timer = new Timer(2000,1);
            timer.addEventListener(TimerEvent.TIMER,function(evt:TimerEvent):void
            {
               timer.removeEventListener(TimerEvent.TIMER,arguments.callee);
               timer.stop();
               timer = null;
               hand.gotoAndPlay(2);
               hand.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
               {
                  if(hand.currentLabel == "getfood")
                  {
                     hand.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                     hand.gotoAndStop("getfood");
                     plierMC.gotoAndPlay(2);
                     plierMC.addEventListener(Event.ENTER_FRAME,foodInBag);
                  }
               });
            });
            timer.start();
            TweenLite.to(hand,1.5,{"x":360});
         }
      }
      
      private function dragFood() : void
      {
         MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         hand.gotoAndPlay(2);
         hand.addEventListener(Event.ENTER_FRAME,getFood);
      }
      
      private function onKeyUp(evt:KeyboardEvent) : void
      {
      }
      
      private function checkIsGet() : MovieClip
      {
         var i:MovieClip = null;
         for each(i in foodArr)
         {
            if(handHit.hitTestObject(i))
            {
               return i;
            }
         }
         return null;
      }
      
      private function onKeyDown(evt:KeyboardEvent) : void
      {
         var keyCode:uint = evt.keyCode;
         switch(keyCode)
         {
            case 37:
               moveLeft();
               break;
            case 38:
               break;
            case 39:
               moveRight();
               break;
            case 40:
               dragFood();
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(chosSpriteFoodPanel);
      }
      
      private function moveRight() : void
      {
         hand.x += 5;
         if(hand.x > rightVerge)
         {
            hand.x = rightVerge;
         }
      }
      
      private function getFood(evt:Event) : void
      {
         if(hand.currentLabel == "getfood")
         {
            hand.removeEventListener(Event.ENTER_FRAME,getFood);
            hand.gotoAndStop("getfood");
            plierMC.gotoAndPlay(2);
            plierMC.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
            {
               var food:MovieClip = null;
               if(plierMC.currentFrame == plierMC.totalFrames)
               {
                  food = checkIsGet();
                  if(food != null)
                  {
                     foodContainer.addChild(food);
                     food.x = 5;
                     food.y = -5;
                     foodType = food.name;
                     dragedFood = food;
                  }
                  plierMC.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  plierMC.gotoAndStop(1);
                  hand.gotoAndPlay("getfood");
                  hand.addEventListener(Event.ENTER_FRAME,returnFood);
               }
            });
         }
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
         EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_0"));
      }
      
      private function foodInBag(evt:Event) : void
      {
         var timer:Timer = null;
         if(plierMC.currentLabel == "openPlier")
         {
            plierMC.removeEventListener(Event.ENTER_FRAME,foodInBag);
            plierMC.gotoAndStop("openPlier");
            if(dragedFood == null)
            {
               EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_0"));
               hide();
               return;
            }
            TweenLite.to(dragedFood,1,{"y":dragedFood.y + 20});
            timer = new Timer(1000,1);
            timer.addEventListener(TimerEvent.TIMER,function(evt:TimerEvent):void
            {
               timer.removeEventListener(TimerEvent.TIMER,arguments.callee);
               timer.stop();
               timer = null;
               DisplayUtil.removeForParent(dragedFood);
               hide();
            });
            timer.start();
            if(checkGetFood())
            {
               EventManager.dispatchEvent(new DynamicEvent("Training_Pet_Sucess","game_0"));
            }
            else
            {
               EventManager.dispatchEvent(new DynamicEvent("Training_Pet_False","game_0"));
            }
         }
      }
      
      private function moveLeft() : void
      {
         hand.x -= 5;
         if(hand.x < leftVerge)
         {
            hand.x = leftVerge;
         }
      }
   }
}

