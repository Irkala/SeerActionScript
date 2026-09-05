package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.map.mg.MgManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class MgMap extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var mainUI:MovieClip;
      
      private var seerMC:MovieClip;
      
      public function MgMap()
      {
         super();
      }
      
      public function destroy() : void
      {
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI,false);
      }
      
      public function setup() : void
      {
         mainUI = new ui_mg_panel();
         seerMC = mainUI["seerMC"];
         mainUI.addChild(seerMC);
         closeBtn = mainUI["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function show() : void
      {
         var mc:MovieClip = null;
         var id:uint = 0;
         var currentMC:MovieClip = null;
         var ct:ColorTransform = null;
         seerMC.visible = MainManager.actorInfo.superNono;
         seerMC.x = seerMC.y = 0;
         for(var i:uint = 1; i < 13; i++)
         {
            mc = mainUI.getChildByName("mc_" + i) as MovieClip;
            mc.gotoAndStop(1);
            DisplayUtil.FillColor(mc,0);
         }
         for each(id in MgManager.getMaps())
         {
            mc = mainUI.getChildByName("mc_" + (id - 301)) as MovieClip;
            ct = new ColorTransform();
            mc.transform.colorTransform = ct;
         }
         currentMC = mainUI.getChildByName("mc_" + (MainManager.actorInfo.mapID - 301)) as MovieClip;
         currentMC.addChild(seerMC);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}

