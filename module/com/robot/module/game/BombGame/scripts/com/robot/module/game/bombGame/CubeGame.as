package com.robot.module.game.bombGame
{
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.*;
   import org.taomee.utils.DisplayUtil;
   
   public class CubeGame
   {
      
      private var n1:uint = 0;
      
      private var n2:uint = 0;
      
      private var j1:uint = 0;
      
      private const correct_a:Array = [[null,null,0],[2,0,1],[3,1,null]];
      
      private var downIndex_obj:Object;
      
      private const first_a:Array = [[0,1,3],[2,0,null],[2,3,1]];
      
      private var down_mc:*;
      
      private var rightIndex_obj:Object;
      
      private var right_mc:*;
      
      private var leftIndex_obj:Object;
      
      private var left_mc:*;
      
      private var compleHandler:Function;
      
      private const correct_a1:Array = [[0,2,0],[1,3,1],[null,null,null]];
      
      private var i1:uint = 0;
      
      private var run_a:Array;
      
      private var upIndex_obj:Object;
      
      private var allNameA:Array;
      
      private var containerMc:DisplayObjectContainer;
      
      private var up_mc:*;
      
      private var null_obj:Object;
      
      public function CubeGame()
      {
         super();
      }
      
      public function destroy() : void
      {
         for(i1 = 0; i1 < allNameA.length; ++i1)
         {
            allNameA[i1].removeEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         }
         DisplayUtil.removeAllChild(containerMc);
         allNameA = null;
         downIndex_obj = null;
         upIndex_obj = null;
         rightIndex_obj = null;
         leftIndex_obj = null;
         down_mc = null;
         up_mc = null;
         right_mc = null;
         left_mc = null;
         run_a = null;
      }
      
      private function searchMoveSquare() : void
      {
         null_obj = new Object();
         for(i1 = 0; i1 < 3; ++i1)
         {
            for(j1 = 0; j1 < 3; ++j1)
            {
               if(run_a[i1][j1] == null)
               {
                  null_obj.hang = i1;
                  null_obj.lie = j1;
                  break;
               }
            }
         }
         downIndex_obj = new Object();
         --null_obj.hang;
         downIndex_obj.lie = null_obj.lie;
         if(downIndex_obj.hang >= 0)
         {
            down_mc = containerMc.getChildByName(String(downIndex_obj.hang) + String(downIndex_obj.lie) + "mc");
         }
         else
         {
            down_mc = null;
         }
         upIndex_obj = new Object();
         upIndex_obj.hang = null_obj.hang + 1;
         upIndex_obj.lie = null_obj.lie;
         if(upIndex_obj.hang < 3)
         {
            up_mc = containerMc.getChildByName(String(upIndex_obj.hang) + String(upIndex_obj.lie) + "mc");
         }
         else
         {
            up_mc = null;
         }
         rightIndex_obj = new Object();
         rightIndex_obj.hang = null_obj.hang;
         --null_obj.lie;
         if(rightIndex_obj.lie >= 0)
         {
            right_mc = containerMc.getChildByName(String(rightIndex_obj.hang) + String(rightIndex_obj.lie) + "mc");
         }
         else
         {
            right_mc = null;
         }
         leftIndex_obj = new Object();
         leftIndex_obj.hang = null_obj.hang;
         leftIndex_obj.lie = null_obj.lie + 1;
         if(leftIndex_obj.lie < 3)
         {
            left_mc = containerMc.getChildByName(String(leftIndex_obj.hang) + String(leftIndex_obj.lie) + "mc");
         }
         else
         {
            left_mc = null;
         }
      }
      
      private function onUpHandler(event:MouseEvent) : void
      {
         event.currentTarget.removeEventListener(MouseEvent.MOUSE_UP,onUpHandler);
         if(down_mc != null && down_mc == event.currentTarget)
         {
            down_mc.y += down_mc.height;
            swapSuqare(null_obj,downIndex_obj);
         }
         if(up_mc != null && up_mc == event.currentTarget)
         {
            up_mc.y -= up_mc.height;
            swapSuqare(null_obj,upIndex_obj);
         }
         if(right_mc != null && right_mc == event.currentTarget)
         {
            right_mc.x += right_mc.width;
            swapSuqare(null_obj,rightIndex_obj);
         }
         if(left_mc != null && left_mc == event.currentTarget)
         {
            left_mc.x -= left_mc.width;
            swapSuqare(null_obj,leftIndex_obj);
         }
         if(checkComplete())
         {
            containerMc.mouseChildren = false;
            compleHandler();
            return;
         }
         if(checkStatus())
         {
            containerMc.mouseChildren = false;
            compleHandler();
         }
      }
      
      private function addSquareToContainer() : void
      {
         var sp:MovieClip = null;
         for(i1 = 0; i1 < 3; ++i1)
         {
            for(j1 = 0; j1 < 3; ++j1)
            {
               switch(first_a[i1][j1])
               {
                  case 0:
                     sp = new UI_BombMc0();
                     break;
                  case 1:
                     sp = new UI_BombMc1();
                     break;
                  case 2:
                     sp = new UI_BombMc2();
                     break;
                  case 3:
                     sp = new UI_BombMc3();
                     break;
                  case null:
                     sp = null;
               }
               if(sp != null)
               {
                  sp.name = String(i1) + String(j1) + "mc";
                  allNameA.push(sp);
                  sp.x = n2 * sp.width;
                  sp.y = n1 * sp.height;
                  sp.addEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
                  containerMc.addChild(sp);
               }
               if(n2 >= 2)
               {
                  n2 = 0;
                  ++n1;
               }
               else
               {
                  ++n2;
               }
            }
         }
         n1 = 0;
         n2 = 0;
      }
      
      private function checkComplete() : Boolean
      {
         var b1:Boolean = true;
         if(run_a[0][2] != correct_a[0][2])
         {
            return false;
         }
         for(j1 = 0; j1 < 3; ++j1)
         {
            if(run_a[1][j1] != correct_a[1][j1])
            {
               return false;
            }
         }
         for(j1 = 0; j1 < 2; ++j1)
         {
            if(run_a[2][j1] != correct_a[2][j1])
            {
               return false;
            }
         }
         return b1;
      }
      
      private function swapSuqare(obj1:Object, obj2:Object) : void
      {
         var power:* = run_a[obj1.hang][obj1.lie];
         run_a[obj1.hang][obj1.lie] = run_a[obj2.hang][obj2.lie];
         run_a[obj2.hang][obj2.lie] = power;
         containerMc.getChildByName(String(obj2.hang) + String(obj2.lie) + "mc").name = String(obj1.hang) + String(obj1.lie) + "mc";
      }
      
      private function onDownHandler(event:MouseEvent) : void
      {
         searchMoveSquare();
         event.currentTarget.addEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function checkStatus() : Boolean
      {
         loop0:
         for(i1 = 0; i1 < 2; )
         {
            j1 = 0;
            while(true)
            {
               if(j1 >= 3)
               {
                  ++i1;
                  continue loop0;
               }
               if(run_a[i1][j1] != correct_a1[i1][j1])
               {
                  break;
               }
               ++j1;
            }
            return false;
         }
         return true;
      }
      
      public function show(cc:DisplayObjectContainer, fun:Function) : void
      {
         containerMc = cc;
         compleHandler = fun;
         allNameA = new Array();
         run_a = first_a;
         addSquareToContainer();
      }
   }
}

