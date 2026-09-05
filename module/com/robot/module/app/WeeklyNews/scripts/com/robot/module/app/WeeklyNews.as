package com.robot.module.app
{
   import com.robot.core.config.UpdateConfig;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class WeeklyNews extends Sprite implements IModule
   {
      
      private var panel:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn3:SimpleButton;
      
      public function WeeklyNews()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(panel);
      }
      
      public function show() : void
      {
         DisplayUtil.align(panel,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(panel);
      }
      
      private function fun1(event:MouseEvent) : void
      {
         MapManager.changeMap(uint(UpdateConfig.niuChangeMapArray[0]));
      }
      
      private function fun2(event:MouseEvent) : void
      {
         MapManager.changeMap(uint(UpdateConfig.niuChangeMapArray[1]));
      }
      
      private function fun3(event:MouseEvent) : void
      {
         MapManager.changeMap(uint(UpdateConfig.niuChangeMapArray[2]));
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function fun4(event:MouseEvent) : void
      {
         MapManager.changeMap(uint(UpdateConfig.niuChangeMapArray[3]));
      }
      
      public function setup() : void
      {
         panel = new News_Panel();
         btn1 = panel["btn1"];
         btn2 = panel["btn2"];
         btn3 = panel["btn3"];
         btn4 = panel["btn4"];
         if(btn1)
         {
            btn1.addEventListener(MouseEvent.CLICK,fun1);
         }
         if(btn2)
         {
            btn2.addEventListener(MouseEvent.CLICK,fun2);
         }
         if(btn3)
         {
            btn3.addEventListener(MouseEvent.CLICK,fun3);
         }
         if(btn4)
         {
            btn4.addEventListener(MouseEvent.CLICK,fun4);
         }
         closeBtn = panel["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      private function closeHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         btn1.removeEventListener(MouseEvent.CLICK,fun1);
         btn2.removeEventListener(MouseEvent.CLICK,fun2);
         btn3.removeEventListener(MouseEvent.CLICK,fun3);
         btn4.removeEventListener(MouseEvent.CLICK,fun4);
         btn1 = null;
         btn2 = null;
         btn3 = null;
         btn4 = null;
         panel = null;
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         closeBtn = null;
      }
   }
}

