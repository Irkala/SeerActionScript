package com.robot.module.app.cutBmp.cutWithChat
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.module.app.cutBmp.ICutBmpCategory;
   import flash.geom.Point;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class CutWithChatCategory implements ICutBmpCategory
   {
      
      private var panel:CutWithChatPanel;
      
      private var isDown:Boolean = false;
      
      public function CutWithChatCategory()
      {
         super();
         LevelManager.closeMouseEvent();
         panel = new CutWithChatPanel();
         MainManager.getStage().addChild(panel);
         initEvent();
      }
      
      private function initEvent() : void
      {
         panel.startPoint = new Point();
         panel.endPoint = new Point(300,200);
         DisplayUtil.align(panel,null,AlignType.MIDDLE_CENTER);
         panel.mouseUp();
      }
      
      public function destroy() : void
      {
         LevelManager.openMouseEvent();
         panel.destroy();
         DisplayUtil.removeForParent(panel);
         panel = null;
      }
   }
}

