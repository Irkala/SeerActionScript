package com.robot.ext
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.info.FitmentInfo;
   import com.robot.core.info.pet.PetShowInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.mode.IFunUnit;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.media.SoundPlayer;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_18 extends Sprite implements IFunUnit
   {
      
      private var soundUrl:String = "resource/sound/";
      
      private var _sprite:Sprite;
      
      private var _sp:SoundPlayer;
      
      private var _info:FitmentInfo;
      
      private var _petInfo:PetShowInfo;
      
      private const DIS:Number = 100;
      
      private var _icon:MovieClip;
      
      public function Ext_18()
      {
         super();
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         if(_sp)
         {
            _sp.pause();
            _sp.destroy();
            _sp = null;
         }
         if(_petInfo)
         {
            MainManager.actorModel.showPet(_petInfo);
            ResourceManager.cancelURL(ClientConfig.getPetSwfPath(_petInfo.petID));
            _petInfo = null;
         }
         if(_icon)
         {
            DisplayUtil.removeForParent(_icon);
            _icon = null;
            return;
         }
         if(MainManager.actorModel.pet)
         {
            if(MainManager.actorModel.pet.info.petID == 201 || MainManager.actorModel.pet.info.petID == 202)
            {
               _petInfo = MainManager.actorModel.pet.info;
               MainManager.actorModel.hidePet();
               ResourceManager.getResource(ClientConfig.getPetSwfPath(_petInfo.petID),onConHandler);
            }
         }
      }
      
      public function destroy() : void
      {
         _info = null;
         if(_sp)
         {
            _sp.destroy();
            _sp = null;
         }
         if(_sprite)
         {
            _sprite.removeEventListener(MouseEvent.CLICK,onClickHandler);
            _sprite = null;
         }
         if(_petInfo)
         {
            MainManager.actorModel.showPet(_petInfo);
            _petInfo = null;
         }
         if(_icon)
         {
            DisplayUtil.removeForParent(_icon);
            _icon = null;
         }
      }
      
      private function onConHandler(mc:MovieClip) : void
      {
         _icon = mc as MovieClip;
         _sprite.addChild(_icon);
         _icon.y = -15;
         _sp = new SoundPlayer();
         _sp.load(soundUrl,true,true);
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as FitmentInfo;
         soundUrl += _info.id.toString() + ".mp3";
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         MovieClip(_sprite).gotoAndStop(1);
         _sprite.addEventListener(MouseEvent.CLICK,onClickHandler);
      }
   }
}

