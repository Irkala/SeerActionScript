package game
{
   import com.robot.app.task.taskUtils.taskDialog.NpcTipDialog;
   import com.robot.core.manager.UIManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import org.taomee.utils.GeomUtil;
   
   public class GamePanel extends Sprite
   {
      
      private var oldR:Number = 0;
      
      private var mainMC:mainPanel;
      
      private var radian:Number;
      
      private var oldPoint:Point = new Point(237,413);
      
      private var xixi:MovieClip;
      
      private var thida:Number = 0;
      
      private var t1:Number = 0;
      
      private var t2:Number = 0;
      
      private var bSuccess:Boolean = false;
      
      private var changes:int = 3;
      
      private var lineArr:Array = new Array();
      
      private var bHit:Boolean = false;
      
      private var bMove:Boolean;
      
      private var gunMC:MovieClip;
      
      private var targetMC:MovieClip;
      
      private var seMC:MovieClip;
      
      private var hitMC:MovieClip;
      
      private var flag:uint = 2;
      
      private var v:Number = 67;
      
      private var bFall:Boolean;
      
      public function GamePanel()
      {
         super();
      }
      
      private function okFun() : void
      {
         bHit = false;
      }
      
      public function show() : void
      {
         mainMC = new mainPanel();
         mainMC.x = -503;
         mainMC.y = -4;
         addChild(mainMC);
         gunMC = mainMC.waterMC["gunMC"];
         targetMC = mainMC.targetMC;
         WaterGame.getRoot().addChild(this);
         hitMC = mainMC.hitMC;
         WaterGame.getStage().addEventListener(MouseEvent.MOUSE_MOVE,onMove);
         hitMC.addEventListener(MouseEvent.CLICK,onClick);
         mainMC.closeBtn.addEventListener(MouseEvent.CLICK,closeGame);
         mainMC.helpBtn.addEventListener(MouseEvent.CLICK,gameHelp);
         xixi = UIManager.getMovieClip("xixi");
      }
      
      public function destroy() : void
      {
         WaterGame.getStage().removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
         hitMC.removeEventListener(MouseEvent.CLICK,onClick);
         mainMC.closeBtn.removeEventListener(MouseEvent.CLICK,closeGame);
         mainMC.helpBtn.removeEventListener(MouseEvent.CLICK,gameHelp);
         hitMC = null;
         mainMC = null;
         xixi = null;
      }
      
      private function closeGame(e:MouseEvent) : void
      {
         WaterGame.gameOver(flag);
         WaterGame.getStage().removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
      }
      
      private function onEnter1(e:Event) : void
      {
         if(targetMC.currentFrame == 2)
         {
            seMC = targetMC["seMC"] as MovieClip;
            if(seMC)
            {
               targetMC.removeEventListener(Event.ENTER_FRAME,onEnter1);
               seMC.play();
               seMC.addEventListener(Event.ENTER_FRAME,onEnter2);
            }
         }
      }
      
      private function onEnter2(e:Event) : void
      {
         if(seMC.currentFrame == seMC.totalFrames)
         {
            seMC.stop();
            seMC.removeEventListener(Event.ENTER_FRAME,onEnter2);
            targetMC.gotoAndStop(3);
            WaterGame.gameOver(0);
            enabledCloseBtn();
            mainMC.helpBtn.mouseEnabled = false;
            WaterGame.getStage().removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
            flag = 0;
         }
      }
      
      private function showDottedLine() : void
      {
         var i:dottedLine = null;
         for each(i in lineArr)
         {
            i.visible = true;
         }
      }
      
      private function enabledCloseBtn() : void
      {
         mainMC.closeBtn.mouseEnabled = false;
      }
      
      private function openCloseBtn() : void
      {
         mainMC.closeBtn.mouseEnabled = true;
      }
      
      private function onEnter(e:Event) : void
      {
         var line:waterline = new waterline();
         addChild(line);
         var dLine:dottedLine = new dottedLine();
         addChild(dLine);
         t1 += 1;
         t2 = t1 / 2;
         line.x = 237 + 65 * Math.cos(thida) + v * Math.cos(thida) * t2;
         line.y = 402 - 65 * Math.sin(thida) - (v * Math.sin(thida) * t2 - 5 * t2 * t2);
         lineArr.push(dLine);
         dLine.visible = false;
         dLine.x = line.x;
         dLine.y = line.y;
         var newR:Number = Number(GeomUtil.pointAngle(new Point(line.x,line.y),oldPoint));
         line.rotation = newR;
         oldPoint = new Point(line.x,line.y);
         oldR = newR;
         var anlge3:Number = Math.atan(10 * t2 - v * Math.sin(thida));
         line.addEventListener(Event.ENTER_FRAME,onEnterLine);
         if(line.y > 405)
         {
            WaterGame.getRoot().removeEventListener(Event.ENTER_FRAME,onEnter);
            Mouse.show();
            if(line.hitTestObject(mainMC.hitTestMC) && 43 < radian && radian < 47)
            {
               targetMC.gotoAndStop(2);
               targetMC.addEventListener(Event.ENTER_FRAME,onEnter1);
               Mouse.show();
               WaterGame.getStage().removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
               hitMC.removeEventListener(MouseEvent.CLICK,onClick);
               trace("你成功啦。。。");
               bSuccess = true;
            }
            bFall = false;
            bMove = false;
            if(!bSuccess)
            {
               --changes;
               if(changes == 2)
               {
                  mainMC.l1.visible = false;
               }
               else if(changes == 1)
               {
                  mainMC.l1.visible = false;
                  mainMC.l2.visible = false;
               }
               else if(changes == 0)
               {
                  mainMC.l1.visible = false;
                  mainMC.l2.visible = false;
                  mainMC.l3.visible = false;
                  WaterGame.gameOver(1);
                  flag = 1;
                  enabledCloseBtn();
                  mainMC.helpBtn.mouseEnabled = false;
               }
               trace("你还有" + changes.toString() + "次机会");
               oldPoint = new Point(237,413);
            }
            showDottedLine();
         }
      }
      
      private function onEnterLine(e:Event) : void
      {
         var mc:MovieClip = e.target as MovieClip;
         if(mc.currentFrame == mc.totalFrames)
         {
            mc.removeEventListener(Event.ENTER_FRAME,onEnterLine);
            mc.stop();
            mc = null;
         }
      }
      
      private function openFun() : void
      {
         bMove = false;
         openCloseBtn();
      }
      
      private function onMove(e:MouseEvent) : void
      {
         if(changes == 0)
         {
            WaterGame.getStage().removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
            return;
         }
         if(bMove || bHit)
         {
            return;
         }
         if(mouseX < 158 || mouseY > 424)
         {
            return;
         }
         var dx:Number = mouseX - 158;
         var dy:Number = 424 - mouseY;
         var anlge:Number = Math.atan2(dy,dx);
         thida = anlge;
         radian = anlge * 180 / Math.PI;
         mainMC.angleTxt.text = int(radian).toString() + "度";
         gunMC.rotation = anlge * 180 / Math.PI * -1;
         var num:Number = anlge * 180 / Math.PI * -1;
      }
      
      private function gameHelp(e:MouseEvent) : void
      {
         enabledCloseBtn();
         bMove = true;
         NpcTipDialog.show("    移动鼠标，选择最佳角度，让水枪射出的水能够扑灭火焰。你只有三次机会哟！",openFun,xixi,-60,openFun);
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(changes == 0)
         {
            hitMC.removeEventListener(MouseEvent.CLICK,onClick);
            return;
         }
         if(bMove || bHit)
         {
            return;
         }
         bMove = true;
         Mouse.hide();
         WaterGame.getRoot().addEventListener(Event.ENTER_FRAME,onEnter);
         t2 = 0;
         t1 = 0;
      }
   }
}

