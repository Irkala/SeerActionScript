package com.robot.module.app.answer
{
   public class AnswerQuestionModel
   {
      
      private static var xmlClass:Class = AnswerQuestionModel_xmlClass;
      
      private static var xml:XML = XML(new xmlClass());
      
      public function AnswerQuestionModel()
      {
         super();
      }
      
      public static function getAnswers() : Array
      {
         var obj:Object = null;
         var obj1:Array = null;
         var info_a:Array = new Array();
         for(var i1:int = 0; i1 < xml.answer.length(); i1++)
         {
            obj = new Object();
            obj.index = String(xml.answer[i1].@index);
            obj.title = String(xml.answer[i1].@title);
            obj.correct = String(xml.answer[i1].@correct);
            obj1 = new Array();
            obj1.push(String(xml.answer[i1].@que1));
            obj1.push(String(xml.answer[i1].@que2));
            obj1.push(String(xml.answer[i1].@que3));
            obj.que = obj1;
            info_a.push(obj);
         }
         return info_a;
      }
   }
}

