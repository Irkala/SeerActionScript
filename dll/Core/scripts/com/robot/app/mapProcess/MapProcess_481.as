package com.robot.app.mapProcess
{
   import com.robot.core.manager.map.config.BaseMapProcess;
   import flash.display.MovieClip;
   
   public class MapProcess_481 extends BaseMapProcess
   {
      
      public function MapProcess_481()
      {
         super();
      }
      
      override protected function init() : void
      {
         if("adMC" in topLevel && topLevel["adMC"])
         {
            MovieClip(topLevel["adMC"]).visible = false;
         }
         hideIfExists(conLevel,"sprite_mc");
         hideIfExists(conLevel,"resetMC");
         hideIfExists(conLevel,"part_0");
         hideIfExists(conLevel,"part_1");
         hideIfExists(conLevel,"part_2");
         hideIfExists(conLevel,"flyCanvas");
         hideIfExists(conLevel,"stoneMC");
         hideIfExists(conLevel,"comMC");
         hideIfExists(conLevel,"petIdo");
      }
      
      private function hideIfExists(container:*, name:String) : void
      {
         if(container && name in container && container[name])
         {
            var mc:MovieClip = container[name] as MovieClip;
            if(mc)
            {
               mc.visible = false;
               mc.mouseEnabled = false;
               mc.mouseChildren = false;
            }
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

