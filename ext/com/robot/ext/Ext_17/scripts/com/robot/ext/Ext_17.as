package com.robot.ext
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.info.FitmentInfo;
   import com.robot.core.mode.IFunUnit;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.taomee.media.SoundPlayer;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_17 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var _playTime:uint;
      
      private var _info:FitmentInfo;
      
      private var _sp:SoundPlayer;
      
      private var _souPath:String = "";
      
      public function Ext_17()
      {
         super();
      }
      
      public function destroy() : void
      {
         clearTimeout(_playTime);
         if(_sp)
         {
            _sp.destroy();
            _sp = null;
         }
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         clearTimeout(_playTime);
         if(MovieClip(_sprite).currentFrame == 1)
         {
            MovieClip(_sprite).gotoAndStop(2);
            _playTime = setTimeout(onPlay,1500);
         }
         else
         {
            MovieClip(_sprite).gotoAndStop(1);
            if(_sp)
            {
               _sp.stop();
            }
         }
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         MovieClip(_sprite).gotoAndStop(1);
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as FitmentInfo;
      }
      
      private function onPlay() : void
      {
         if(_sp == null)
         {
            if(_souPath == "")
            {
               _souPath = ItemXMLInfo.getSound(_info.id);
            }
            if(_souPath != "" || _souPath != null)
            {
               _sp = new SoundPlayer();
               _sp.load(ClientConfig.getResPath("sound/" + _souPath + ".mp3"),true,true);
            }
         }
         else
         {
            _sp.play();
         }
      }
   }
}

