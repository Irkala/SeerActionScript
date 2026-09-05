package com.robot.app.spacesurvey
{
   import com.robot.app.task.control.TaskController_37;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.MCLoadEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.newloader.MCLoader;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class SpaceSurveyResult extends Sprite
   {
      
      private var sprite:Sprite;
      
      private var namestr:String = "";
      
      private var iconContainer:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var mainMC:MovieClip;
      
      private var iconMC:MovieClip;
      
      private var introlTxt:TextField;
      
      private var petContainer:MovieClip;
      
      private const PATH:String = "module/surveyPole/surveyResultPanel.swf";
      
      private const SPACE:uint = 80;
      
      private var energyContainer:MovieClip;
      
      private var bgCls:Class;
      
      private var spaceNameTxt:TextField;
      
      public function SpaceSurveyResult()
      {
         super();
      }
      
      private function onLoadPet(index:uint, petsArr:Array) : Function
      {
         var func:Function = function(o:DisplayObject):void
         {
            var rect:Rectangle;
            var bmp:Bitmap;
            var bmpData:BitmapData;
            var ma:Matrix;
            var _showMc:MovieClip = null;
            _showMc = o as MovieClip;
            var bg:MovieClip = new bgCls() as MovieClip;
            bg.x = SPACE * index;
            if(_showMc)
            {
               _showMc.gotoAndStop("rightdown");
               _showMc.addEventListener(Event.ENTER_FRAME,function():void
               {
                  var mc:MovieClip = _showMc.getChildAt(0) as MovieClip;
                  if(mc)
                  {
                     mc.gotoAndStop(1);
                     _showMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
                  }
               });
               DisplayUtil.stopAllMovieClip(_showMc);
            }
            bmpData = new BitmapData(_showMc.width,_showMc.height,true,0);
            ma = new Matrix();
            rect = _showMc.getRect(_showMc);
            ma.translate(-rect.x,-rect.y);
            bmpData.draw(_showMc,ma);
            bmp = new Bitmap(bmpData);
            DisplayUtil.align(bmp,bg.getRect(bg),AlignType.MIDDLE_CENTER);
            bg.addChild(bmp);
            ToolTipManager.add(bg,PetXMLInfo.getName(petsArr[index]));
            petContainer.addChild(bg);
         };
         return func;
      }
      
      private function init() : void
      {
         this.addChild(mainMC);
         iconContainer.addChild(iconMC);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(this);
         introlTxt.text = SurveyResultXMLInfo.getIntrolInfo(namestr);
         spaceNameTxt.text = namestr;
         loadPet();
         loadItem();
      }
      
      private function onLoadItem(index:uint, energysArr:Array) : Function
      {
         var func:Function = function(o:DisplayObject):void
         {
            var _showMc:MovieClip = o as MovieClip;
            _showMc.gotoAndStop(1);
            var bg:MovieClip = new bgCls() as MovieClip;
            bg.x = SPACE * index;
            _showMc.x = _showMc.x - bg.width / 2 + 10;
            _showMc.y = _showMc.y - bg.height + 10;
            bg.addChild(_showMc);
            ToolTipManager.add(bg,ItemXMLInfo.getName(energysArr[index]));
            energyContainer.addChild(bg);
            DisplayUtil.align(_showMc,bg.getRect(bg),AlignType.MIDDLE_CENTER);
         };
         return func;
      }
      
      private function loadPet() : void
      {
         var i:uint = 0;
         var petsS:String = SurveyResultXMLInfo.getPetsByName(namestr);
         var petsArr:Array = petsS.split("|");
         if(petsArr.length > 0)
         {
            for(i = 0; i < petsArr.length; i++)
            {
               ResourceManager.getResource(ClientConfig.getPetSwfPath(uint(petsArr[i])),onLoadPet(i,petsArr),"pet");
            }
         }
      }
      
      private function onLoadSuccess(event:MCLoadEvent) : void
      {
         var mcloader:MCLoader = event.currentTarget as MCLoader;
         mcloader.removeEventListener(MCLoadEvent.SUCCESS,onLoadSuccess);
         bgCls = event.getApplicationDomain().getDefinition("bg") as Class;
         var cls:Class = event.getApplicationDomain().getDefinition("mainMC") as Class;
         mainMC = new cls() as MovieClip;
         sprite = mainMC["ttMC"];
         var iconCls:Class = event.getApplicationDomain().getDefinition(SurveyResultXMLInfo.getIconName(namestr)) as Class;
         iconMC = new iconCls() as MovieClip;
         closeBtn = mainMC["close_btn"];
         closeBtn.addEventListener(MouseEvent.CLICK,close);
         petContainer = mainMC["petContainer"];
         energyContainer = mainMC["energyContainer"];
         iconContainer = mainMC["iconContainer"];
         introlTxt = mainMC["introl_txt"];
         spaceNameTxt = mainMC["spaceName_txt"];
         mcloader.clear();
         init();
      }
      
      private function close(event:MouseEvent) : void
      {
         DisplayUtil.removeAllChild(petContainer);
         DisplayUtil.removeAllChild(this.iconContainer);
         DisplayUtil.removeAllChild(this.energyContainer);
         DisplayUtil.removeForParent(this);
         if(TasksManager.getTaskStatus(TaskController_37.TASK_ID) == TasksManager.ALR_ACCEPT)
         {
            TasksManager.getProStatusList(TaskController_37.TASK_ID,function(arr:Array):void
            {
               if((Boolean(arr[0]) || Boolean(arr[1]) || Boolean(arr[2]) || Boolean(arr[3]) || Boolean(arr[4]) || Boolean(arr[5]) || Boolean(arr[6]) || Boolean(arr[7]) || Boolean(arr[8])) && Boolean(arr[9]) && !arr[10])
               {
                  TaskController_37.showTaskPanel();
               }
            });
         }
      }
      
      private function loadUI() : void
      {
         var url:String = ClientConfig.getResPath(PATH);
         var mcloader:MCLoader = new MCLoader(url,LevelManager.appLevel,1,"正在加载测绘报告");
         mcloader.addEventListener(MCLoadEvent.SUCCESS,onLoadSuccess);
         mcloader.doLoad();
      }
      
      private function loadItem() : void
      {
         var i:uint = 0;
         var energysS:String = SurveyResultXMLInfo.getEnergysByName(namestr);
         var energysArr:Array = energysS.split("|");
         if(energysArr.length >= 1 && energysArr[0] != "")
         {
            for(i = 0; i < energysArr.length; i++)
            {
               ResourceManager.getResource(ItemXMLInfo.getIconURL(uint(energysArr[i])),onLoadItem(i,energysArr),"item");
            }
            sprite.visible = true;
         }
         else
         {
            sprite.visible = false;
         }
      }
      
      public function show(str:String) : void
      {
         namestr = str;
         loadUI();
      }
   }
}

