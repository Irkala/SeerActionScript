package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import flash.display.MovieClip;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import org.taomee.utils.DisplayUtil;
   
   public class PlantsBgObserver extends GameObserver implements IGameObserver
   {
      
      private var c:SoundChannel;
      
      private var mc:MovieClip;
      
      private var sound:Sound;
      
      public function PlantsBgObserver(s:GameSubject)
      {
         super(s);
         mc = new plants_groud_bg();
         mc.cacheAsBitmap = true;
         mc.y = 83;
         subject.container.addChild(mc);
         sound = new plante_bg_sound();
      }
      
      override public function gameStart() : void
      {
         c = sound.play(0,99999999);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         DisplayUtil.removeForParent(mc);
         mc = null;
         c.stop();
         sound = null;
         c = null;
      }
   }
}

