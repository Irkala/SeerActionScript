package com.robot.module.app.petStorage
{
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetEffectXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import flash.display.Sprite;
   import flash.text.TextField;
   import org.taomee.utils.StringUtil;
   
   public class InfoTxtPanel
   {
      
      private var _sdTxt:TextField;
      
      private var _infoTxt:TextField;
      
      private var _speedTxt:TextField;
      
      private var _attackTxt:TextField;
      
      private var _saTxt:TextField;
      
      private var _info:PetInfo;
      
      private var _hpTxt:TextField;
      
      private var _defenceTxt:TextField;
      
      private var des2:String = "</font>";
      
      public function InfoTxtPanel(param1:Sprite)
      {
         super();
         this._infoTxt = param1["infoTxt"];
         this._attackTxt = param1["attackTxt"];
         this._defenceTxt = param1["defenceTxt"];
         this._saTxt = param1["saTxt"];
         this._sdTxt = param1["sdTxt"];
         this._speedTxt = param1["speedTxt"];
         this._hpTxt = param1["hpTxt"];
      }
      
      public function clear() : void
      {
         this._infoTxt.text = "";
         this._attackTxt.text = "";
         this._defenceTxt.text = "";
         this._saTxt.text = "";
         this._sdTxt.text = "";
         this._speedTxt.text = "";
         this._hpTxt.text = "";
      }
      
      public function get info() : PetInfo
      {
         return this._info;
      }
      
      public function set info(param1:PetInfo) : void
      {
         var _loc2_:String = "";
         var _loc3_:Array = ["<font color=\'#00ff00\' size=\'12.5\'>","<font color=\'#0000ff\' size=\'12.5\'>","<font color=\'#800080\' size=\'12.5\'>","<font color=\'#ffd700\' size=\'12.5\'>","<font color=\'#ff0000\' size=\'12.5\'>"];
         this._info = param1;
         var _loc4_:* = 4;
         while(_loc4_ >= 0)
         {
            if(this._info.dv >> _loc4_ & 1)
            {
               _loc2_ += _loc3_[_loc4_] + "◆" + this.des2;
            }
            else
            {
               _loc2_ += "<font color=\'#000000\' size=\'12.5\'>" + "◇" + this.des2;
            }
            _loc4_--;
         }
         this._infoTxt.text = "";
         this._infoTxt.htmlText = "";
         this._infoTxt.htmlText += "序号:" + StringUtil.renewZero(this._info.id.toString(),3) + " " + _loc2_ + "\n";
         this._infoTxt.htmlText += "名字:" + PetXMLInfo.getName(this._info.id) + "\n";
         this._infoTxt.htmlText += "等级:" + this._info.level.toString() + "  " + "个体:" + this._info.dv.toString() + "\n";
         if(this._info.effectList[0])
         {
            if(this._info.effectList[0].itemId > 1005 && this._info.effectList[0].itemId <= 1045)
            {
               this._infoTxt.htmlText += "<font size=\'12.5\'>性格:" + NatureXMLInfo.getName(this._info.nature) + " 特性:" + PetEffectXMLInfo.getEffect(this._info.effectList[0].itemId) + "</font>\n";
            }
            else
            {
               this._infoTxt.htmlText += "性格:" + NatureXMLInfo.getName(this._info.nature) + "\n";
            }
         }
         else
         {
            this._infoTxt.htmlText += "性格:" + NatureXMLInfo.getName(this._info.nature) + "\n";
         }
         this._infoTxt.htmlText += "<font size=\'13\'>获得时间:" + StringUtil.timeFormat(this._info.catchTime) + "</font>\n";
         this._attackTxt.text = "攻击:" + this._info.attack.toString();
         this._defenceTxt.text = "防御:" + this._info.defence.toString();
         this._saTxt.text = "特攻:" + this._info.s_a.toString();
         this._sdTxt.text = "特防:" + this._info.s_d.toString();
         this._speedTxt.text = "速度:" + this._info.speed.toString();
         this._hpTxt.text = "体力:" + this._info.hp.toString();
      }
   }
}

