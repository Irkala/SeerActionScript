package _fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol86")]
   public dynamic class Timeline_29 extends MovieClip
   {
      
      public var txt3:TextField;
      
      public var info2:Object;
      
      public function Timeline_29()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         try
         {
            info2 = getDefinitionByName("com.robot.core.manager.MainManager");
            if(info2)
            {
               this["txt3"].text = String(info2.actorInfo.fightBadge);
            }
         }
         catch(e:Error)
         {
         }
      }
   }
}

