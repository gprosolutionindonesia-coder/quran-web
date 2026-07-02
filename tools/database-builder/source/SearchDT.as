package com.qf3.desktop
{
   import com.riadvice.qurani.*;
   
   public class SearchDT
   {
      
      private var mg:ManagerDT;
      
      public function SearchDT()
      {
         super();
         this.mg = ManagerDT.getInstance();
      }
      
      public function search(param1:*, param2:*, param3:*, param4:*) : void
      {
         var _loc9_:* = undefined;
         var _loc5_:Quran = new Quran();
         var _loc6_:* = _loc5_.search(this.removeDiacritics(param1),param3,param2);
         param3 = _loc5_.searchCount(this.removeDiacritics(param1));
         var _loc7_:* = <results></results>;
         if(!_loc6_)
         {
            _loc6_ = [];
         }
         _loc7_.@count = param3;
         var _loc8_:* = 0;
         while(_loc8_ < _loc6_.length)
         {
            _loc9_ = <verse></verse>;
            _loc9_.@verse = _loc6_[_loc8_].verseID;
            _loc9_.@sura = _loc6_[_loc8_].suraID;
            _loc9_.@text = _loc6_[_loc8_].imlai;
            _loc9_.@norm = _loc6_[_loc8_].rawText;
            _loc7_.appendChild(_loc9_);
            _loc8_++;
         }
         if(param4)
         {
            param4({"currentTarget":{"data":_loc7_}});
         }
      }
      
      private function removeDiacritics(param1:*) : *
      {
         param1 = param1.replace("َ","");
         param1 = param1.replace("ً","");
         param1 = param1.replace("ُ","");
         param1 = param1.replace("ٌ","");
         param1 = param1.replace("ِ","");
         param1 = param1.replace("ٍ","");
         param1 = param1.replace("ْ","");
         return param1.replace("ّ","");
      }
   }
}

