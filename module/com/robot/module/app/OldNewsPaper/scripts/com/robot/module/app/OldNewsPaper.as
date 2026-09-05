package com.robot.module.app
{
   import com.robot.app.oldPaper.PaperController;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.MCLoadEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.newloader.MCLoader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.component.containers.Canvas;
   import org.taomee.component.control.UIMovieClip;
   import org.taomee.component.layout.FlowWarpLayout;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class OldNewsPaper extends Sprite implements IModule
   {
      
      private var container:Canvas;
      
      private var total:uint;
      
      private var closeBtn:SimpleButton;
      
      private var perPage:uint = 30;
      
      private var mainMC:MovieClip;
      
      private var currentPage:uint = 0;
      
      private var prevBtn:SimpleButton;
      
      private var nextBtn:SimpleButton;
      
      private var currentIndex:uint;
      
      private var totalPage:uint;
      
      public function OldNewsPaper()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainMC);
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         mainMC = new ui_oldPaperMC();
         container = new Canvas();
         container.x = 62;
         container.y = 88;
         container.setSizeWH(562,256);
         container.layout = new FlowWarpLayout(FlowWarpLayout.LEFT,FlowWarpLayout.MIDLLE,20,-3);
         mainMC.addChild(container);
         total = ClientConfig.newsVersion - 1;
         totalPage = Math.ceil(total / perPage);
         showContent();
         prevBtn = mainMC["prevBtn"];
         nextBtn = mainMC["nextBtn"];
         prevBtn.addEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,nextHandler);
         closeBtn = mainMC["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      private function overHandler(event:MouseEvent) : void
      {
         var mc:MovieClip = event.currentTarget as MovieClip;
         mc.gotoAndStop(2);
         mc["num_txt"].visible = false;
      }
      
      private function onLoadOld(event:MCLoadEvent) : void
      {
         PaperController.setup(event.getApplicationDomain(),currentIndex);
      }
      
      public function destroy() : void
      {
         hide();
         prevBtn.removeEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.removeEventListener(MouseEvent.CLICK,nextHandler);
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         prevBtn = null;
         nextBtn = null;
         closeBtn = null;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function clickHandler(event:MouseEvent) : void
      {
         closeHandler(null);
         var mc:MovieClip = event.currentTarget as MovieClip;
         currentIndex = mc["tempi"];
         var str:String = "resource/module/oldPaper/swf/" + (currentIndex + 1).toString() + ".swf";
         var loader:MCLoader = new MCLoader(str,LevelManager.appLevel,1,"正在打开以往日志");
         loader.addEventListener(MCLoadEvent.SUCCESS,onLoadOld);
         loader.doLoad();
      }
      
      private function outHandler(event:MouseEvent) : void
      {
         var mc:MovieClip = event.currentTarget as MovieClip;
         mc.gotoAndStop(1);
         mc["num_txt"].visible = true;
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainMC,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainMC);
         mainMC["pageTxt"].text = (currentPage + 1).toString();
      }
      
      private function prevHandler(event:MouseEvent) : void
      {
         if(currentPage > 0)
         {
            --currentPage;
            showContent();
         }
         mainMC["pageTxt"].text = (currentPage + 1).toString();
      }
      
      private function nextHandler(event:MouseEvent) : void
      {
         if(currentPage < totalPage - 1)
         {
            ++currentPage;
            showContent();
         }
         mainMC["pageTxt"].text = (currentPage + 1).toString();
      }
      
      private function showContent() : void
      {
         var mc:MovieClip = null;
         var str:String = null;
         container.removeAll();
         var begin:uint = currentPage * perPage;
         var end:uint = (currentPage + 1) * perPage;
         end = end > total ? total : end;
         for(var i:uint = begin; i < end; i++)
         {
            mc = new ui_mc();
            mc.gotoAndStop(1);
            mc.buttonMode = true;
            mc.mouseChildren = false;
            str = (i + 1).toString();
            if(str.length == 1)
            {
               str = "0" + str;
            }
            mc["num_txt"].text = str;
            mc.tempi = i;
            container.append(new UIMovieClip(mc));
            mc.addEventListener(MouseEvent.CLICK,clickHandler);
            mc.addEventListener(MouseEvent.ROLL_OVER,overHandler);
            mc.addEventListener(MouseEvent.ROLL_OUT,outHandler);
         }
      }
   }
}

