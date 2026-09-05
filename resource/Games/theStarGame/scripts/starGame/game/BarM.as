package starGame.game
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class BarM extends MovieClip
   {
      
      private var _level:int;
      
      private var _jianDao:MovieClip;
      
      private var time:Timer;
      
      private var _music_mc:MovieClip;
      
      private var _mask_mc:MovieClip;
      
      private var _jianBtn:SimpleButton;
      
      private var _time_txt:TextField;
      
      private var barM:MovieClip;
      
      private var starname:String;
      
      private var game:MovieClip;
      
      private var secondi:int = 60;
      
      private var _stop_mc:MovieClip;
      
      private var _again_btn:SimpleButton;
      
      public function BarM(l:int, s:String, mb:MovieClip, j:MovieClip, g:MovieClip)
      {
         super();
         game = g;
         _jianDao = j;
         _level = l;
         starname = s;
         _mask_mc = mb;
         initBar();
      }
      
      public function removeThis() : void
      {
         if(time)
         {
            time.stop();
            time = null;
         }
         removeChild(barM);
         barM = null;
      }
      
      private function playDownHandler(e:MouseEvent) : void
      {
         time.start();
         _mask_mc.visible = false;
      }
      
      private function overAgain(e:MouseEvent) : void
      {
         barM.aagain_mc.gotoAndPlay(1);
      }
      
      public function addEventS() : void
      {
         _stop_mc.addEventListener(MouseEvent.MOUSE_DOWN,stopDownHandler);
         _stop_mc.addEventListener(MouseEvent.MOUSE_OVER,overStop);
         _stop_mc.addEventListener(MouseEvent.MOUSE_OUT,outStop);
         _music_mc.addEventListener(MouseEvent.MOUSE_OVER,overMusic);
         _music_mc.addEventListener(MouseEvent.MOUSE_OUT,outMusic);
         _mask_mc.play_btn.addEventListener(MouseEvent.MOUSE_DOWN,playDownHandler);
         _jianBtn.addEventListener(MouseEvent.CLICK,jiandaoHandler);
         _jianBtn.addEventListener(MouseEvent.MOUSE_OVER,overJian);
         _jianBtn.addEventListener(MouseEvent.MOUSE_OUT,outJian);
         _again_btn.addEventListener(MouseEvent.CLICK,againClickHandler);
         _again_btn.addEventListener(MouseEvent.MOUSE_OVER,overAgain);
         _again_btn.addEventListener(MouseEvent.MOUSE_OUT,outAgain);
      }
      
      private function jiandaoHandler(e:MouseEvent) : void
      {
         if(!_jianDao.visible)
         {
            _jianDao.visible = true;
            this.dispatchEvent(new Event("showjiandao"));
         }
      }
      
      private function timerHandler(e:TimerEvent) : void
      {
         var strs:String = null;
         --secondi;
         if(secondi < 0)
         {
            secondi = 59;
            time.stop();
            time = null;
            this.dispatchEvent(new Event("timeisover"));
            return;
         }
         if(secondi < 10)
         {
            strs = "0" + String(secondi);
         }
         else
         {
            strs = String(secondi);
         }
         _time_txt.text = strs;
      }
      
      private function musicDownHandler(e:MouseEvent) : void
      {
         if(_music_mc.currentFrame == 1)
         {
            _music_mc.gotoAndStop(3);
         }
         else if(_music_mc.currentFrame == 3)
         {
            _music_mc.gotoAndStop(1);
         }
         game.soundChange();
      }
      
      public function startTime() : void
      {
         time.start();
      }
      
      private function againClickHandler(e:MouseEvent) : void
      {
         this.dispatchEvent(new Event("againgame"));
      }
      
      private function overJian(e:MouseEvent) : void
      {
         barM.jjiandao_mc.gotoAndPlay(1);
      }
      
      private function initBar() : void
      {
         time = new Timer(1000,300);
         time.addEventListener(TimerEvent.TIMER,timerHandler);
         barM = new BoardUI_StarGame();
         _stop_mc = barM.stop_mc;
         _music_mc = barM.music_mc;
         _time_txt = barM.time_txt;
         _time_txt.text = "60";
         _time_txt.filters = [new ColorMatrixFilter()];
         _again_btn = barM.tagain_btn;
         _jianBtn = barM.jiandao_btn;
         _stop_mc.gotoAndStop(3);
         _music_mc.gotoAndStop(3);
         barM.ssound_mc.gotoAndStop(1);
         barM.jjiandao_mc.gotoAndStop(1);
         barM.sstop_mc.gotoAndStop(1);
         barM.aagain_mc.gotoAndStop(1);
         barM.x = -25;
         addChild(barM);
         var le:int = int(_level + 1);
         barM.level_mc.gotoAndStop(le);
         barM.star_txt.text = starname;
         barM.star_txt.filters = [new ColorMatrixFilter()];
         _music_mc.addEventListener(MouseEvent.MOUSE_DOWN,musicDownHandler);
      }
      
      private function stopDownHandler(e:MouseEvent) : void
      {
         time.stop();
         _mask_mc.visible = true;
      }
      
      private function outJian(e:MouseEvent) : void
      {
         barM.jjiandao_mc.gotoAndStop(1);
      }
      
      private function outStop(e:MouseEvent) : void
      {
         barM.sstop_mc.gotoAndStop(1);
      }
      
      private function overMusic(e:MouseEvent) : void
      {
         barM.ssound_mc.gotoAndPlay(1);
      }
      
      private function overStop(e:MouseEvent) : void
      {
         barM.sstop_mc.gotoAndPlay(1);
      }
      
      private function outMusic(e:MouseEvent) : void
      {
         barM.ssound_mc.gotoAndStop(1);
      }
      
      private function outAgain(e:MouseEvent) : void
      {
         barM.aagain_mc.gotoAndStop(1);
      }
      
      public function removeAdd() : void
      {
         if(time)
         {
            time.stop();
         }
         _stop_mc.removeEventListener(MouseEvent.MOUSE_DOWN,stopDownHandler);
         _stop_mc.removeEventListener(MouseEvent.MOUSE_OVER,overStop);
         _stop_mc.removeEventListener(MouseEvent.MOUSE_OUT,outStop);
         _music_mc.removeEventListener(MouseEvent.MOUSE_DOWN,musicDownHandler);
         _mask_mc.play_btn.removeEventListener(MouseEvent.MOUSE_DOWN,playDownHandler);
         _jianBtn.removeEventListener(MouseEvent.CLICK,jiandaoHandler);
         _again_btn.removeEventListener(MouseEvent.CLICK,againClickHandler);
         _music_mc.removeEventListener(MouseEvent.MOUSE_OVER,overMusic);
         _music_mc.removeEventListener(MouseEvent.MOUSE_OUT,outMusic);
         _jianBtn.removeEventListener(MouseEvent.MOUSE_OVER,overJian);
         _jianBtn.removeEventListener(MouseEvent.MOUSE_OUT,outJian);
         _again_btn.removeEventListener(MouseEvent.MOUSE_OVER,overAgain);
         _again_btn.removeEventListener(MouseEvent.MOUSE_OUT,outAgain);
      }
   }
}

