package com.robot.module.app.petStorage
{
   import com.robot.core.config.xml.SkillXMLInfo;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import org.taomee.ds.HashMap;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.ToolTipManager;
   
   public class TypeBtnPanel extends EventDispatcher
   {
      
      private var _glow:GlowFilter = new GlowFilter(16776960,1,4,4,10);
      
      private const length:uint = 16;
      
      private var _btnMap:HashMap = new HashMap();
      
      public function TypeBtnPanel(ui:Sprite, df:uint)
      {
         var id:int = 0;
         var btn:SimpleButton = null;
         super();
         _btnMap = new HashMap();
         for(var i:int = 1; i <= length; i++)
         {
            id = i;
            btn = ui.getChildByName("tBtn_" + id.toString()) as SimpleButton;
            ToolTipManager.add(btn,SkillXMLInfo.petTypeName(id) + "系");
            btn.addEventListener(MouseEvent.CLICK,onClick);
            btn.filters = [];
            _btnMap.add(btn,id);
         }
         var btn2:SimpleButton = _btnMap.getKey(df) as SimpleButton;
         if(btn2)
         {
            btn2.filters = [_glow];
         }
      }
      
      public function destroy() : void
      {
         _btnMap.eachKey(function(o:SimpleButton):void
         {
            ToolTipManager.remove(o);
         });
         _btnMap = null;
         _glow = null;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         _btnMap.eachKey(function(o:SimpleButton):void
         {
            o.filters = [];
         });
         (e.currentTarget as SimpleButton).filters = [_glow];
         dispatchEvent(new DynamicEvent(MouseEvent.CLICK,_btnMap.getValue(e.currentTarget)));
      }
   }
}

