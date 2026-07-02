package com.riadvice.qurani
{
   import com.riadvice.qurani.converters.*;
   import com.riadvice.qurani.exceptions.*;
   import flash.data.SQLConnection;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.SQLEvent;
   import flash.utils.*;
   import mx.events.PropertyChangeEvent;
   import mx.resources.*;
   
   use namespace quran_internal;
   
   public class Quran implements IEventDispatcher
   {
      
      private static var connection:SQLConnection;
      
      private static var suraIdByName:Dictionary;
      
      private static var suraInfoById:Dictionary;
      
      private var _1713722389basmalah:Aya;
      
      private var selectedSurNumber:int;
      
      private var ayaConverter:AyaConverter;
      
      private var pageConverter:PageConverter;
      
      private var hizbConverter:HizbConverter;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function Quran()
      {
         super();
         if(connection == null)
         {
            suraIdByName = new Dictionary(true);
            suraInfoById = new Dictionary(true);
            connection = QuranHelper.getConnection();
            QuranHelper.executeQuery(Queries.GET_SUWAR_INFO,onSuwarQueryResult);
         }
      }
      
      public static function getSuwarCount() : int
      {
         return QuranConstants.QURAN_SUWAR_NUMBER;
      }
      
      public static function getAyatCount() : int
      {
         return QuranConstants.QURAN_AYAT_NUMBER;
      }
      
      private static function onSuwarQueryResult(param1:SQLEvent) : void
      {
         var _loc2_:SuraConverter = new SuraConverter();
         var _loc3_:Array = _loc2_.convertArray(param1.target.getResult().data);
         suraIdByName = _loc3_[0];
         suraInfoById = _loc3_[1];
         _loc2_ = null;
      }
      
      public function getBasmalah() : Aya
      {
         if(this.basmalah == null)
         {
            this.basmalah = this.getAya(1,1);
            this.basmalah.othmani = this.basmalah.othmani.substr(0,this.basmalah.othmani.length - 2);
         }
         return this.basmalah;
      }
      
      public function getAya(param1:int, param2:int) : Aya
      {
         var result:Aya = null;
         var suraNumber:int = param1;
         var ayaNumber:int = param2;
         this.validateSura(suraNumber);
         QuranHelper.executeQuery(Queries.GET_AYA_SQL,function(param1:SQLEvent):void
         {
            result = getAyaConverter().convert(param1.target.getResult().data[0]);
         },[":ayaId",":ayatLength"],[this.getInternalAyaNumber(suraNumber,ayaNumber),1]);
         return result;
      }
      
      public function getAllAyat() : Array
      {
         var result:Array = null;
         QuranHelper.executeQuery(Queries.GET_AYA_SQL,function(param1:SQLEvent):void
         {
            result = getAyaConverter().convertArray(param1.target.getResult().data);
         },[":ayaId",":ayatLength"],[1,QuranConstants.QURAN_AYAT_NUMBER]);
         return result;
      }
      
      public function searchCount(param1:*) : int
      {
         var result:Array = null;
         var keyword:* = param1;
         QuranHelper.executeQuery(Queries.SEARCHCOUNT,function(param1:SQLEvent):void
         {
            result = param1.target.getResult().data;
         },[":keyword"],["%" + keyword + "%"]);
         if(result)
         {
            return result.length;
         }
         return 0;
      }
      
      public function search(param1:*, param2:*, param3:*) : Array
      {
         var result:Array = null;
         var keyword:* = param1;
         var resultCount:* = param2;
         var resultStart:* = param3;
         QuranHelper.executeQuery(Queries.SEARCH,function(param1:SQLEvent):void
         {
            result = addSuraAndVerseOffset(param1.target.getResult().data);
         },[":keyword",":resultCount",":resultStart"],["%" + keyword + "%",resultCount,resultStart]);
         return result;
      }
      
      private function addSuraAndVerseOffset(param1:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(!param1)
         {
            return;
         }
         var _loc2_:* = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = 1;
            while(Sura(suraInfoById[_loc4_]).startingAyaId < _loc3_.id)
            {
               _loc4_++;
            }
            _loc3_.verseID = _loc3_.id + 1;
            if(_loc4_ > 1)
            {
               _loc3_.verseID = _loc3_.id - Sura(suraInfoById[_loc4_ - 1]).startingAyaId + 1;
            }
            _loc3_.suraID = _loc4_ - 1;
            _loc2_++;
         }
         return param1;
      }
      
      public function getSura(param1:int) : Sura
      {
         var resultSura:Sura = null;
         var suraNumber:int = param1;
         this.validateSura(suraNumber);
         this.selectedSurNumber = suraNumber;
         QuranHelper.executeQuery(Queries.GET_AYA_SQL,function(param1:SQLEvent):void
         {
            resultSura = Sura(suraInfoById[selectedSurNumber]);
            if(!resultSura.ayat)
            {
               resultSura.ayat = getAyaConverter().convertArray(param1.target.getResult().data);
            }
         },[":ayaId",":ayatLength"],[Sura(suraInfoById[suraNumber]).startingAyaId,this.getSuraLength(suraNumber)]);
         if(suraNumber != 1 && suraNumber != 9)
         {
            resultSura.basmalah = this.getBasmalah();
         }
         return resultSura;
      }
      
      public function getSuraByName(param1:String) : Sura
      {
         var sura:Sura = null;
         var suraName:String = param1;
         try
         {
            sura = this.getSura(suraIdByName[suraName].orderInMushaf);
         }
         catch(e:Error)
         {
            throw new QuranException(ResourceManager.getInstance().getString("quran","suraNameError",[suraName]));
         }
         return sura;
      }
      
      public function getSuwarNames() : Array
      {
         var _loc1_:Sura = null;
         var _loc2_:Array = [];
         for each(_loc1_ in suraInfoById)
         {
            _loc2_.push(_loc1_.name);
         }
         return _loc2_;
      }
      
      public function getPage(param1:int) : Page
      {
         var result:Page = null;
         var nextPage:Page = null;
         var pageAyatLength:int = 0;
         var currentPageStartAyaNumber:int = 0;
         var pageNumber:int = param1;
         this.validatePage(pageNumber);
         QuranHelper.executeQuery(Queries.GET_PAGE,function(param1:SQLEvent):void
         {
            result = getPageConverter().convert(param1.target.getResult().data[0]);
         },[":pageId"],[pageNumber]);
         if(result.number < QuranConstants.QURAN_PAGE_NUMBER)
         {
            QuranHelper.executeQuery(Queries.GET_PAGE,function(param1:SQLEvent):void
            {
               nextPage = getPageConverter().convert(param1.target.getResult().data[0]);
            },[":pageId"],[pageNumber + 1]);
         }
         currentPageStartAyaNumber = int(this.getInternalAyaNumber(result.startSura,result.startAya));
         try
         {
            pageAyatLength = this.getInternalAyaNumber(nextPage.startSura,nextPage.startAya) - currentPageStartAyaNumber;
         }
         catch(e:Error)
         {
            pageAyatLength = QuranConstants.QURAN_AYAT_NUMBER - currentPageStartAyaNumber + 1;
         }
         QuranHelper.executeQuery(Queries.GET_AYA_SQL,function(param1:SQLEvent):void
         {
            result.ayat = getAyaConverter().convertArray(param1.target.getResult().data);
         },[":ayaId",":ayatLength"],[currentPageStartAyaNumber,pageAyatLength]);
         return result;
      }
      
      public function getHizb(param1:int) : Hizb
      {
         var hizbStartIndex:int;
         var result:Hizb = null;
         var hizbNumber:int = param1;
         this.validateHizb(hizbNumber);
         hizbStartIndex = (hizbNumber - 1) * 4;
         QuranHelper.executeQuery(Queries.GET_HIZB,function(param1:SQLEvent):void
         {
            result = getHizbConverter().convert(param1.target.getResult().data);
         },[":hizbStartIndex"],[hizbStartIndex]);
         return result;
      }
      
      private function validateSura(param1:int) : void
      {
         if(param1 < 1 || param1 > QuranConstants.QURAN_SUWAR_NUMBER)
         {
            throw new QuranException(ResourceManager.getInstance().getString("quran","suraNumberError",[param1]));
         }
      }
      
      private function validatePage(param1:int) : void
      {
         if(param1 < 1 || param1 > QuranConstants.QURAN_PAGE_NUMBER)
         {
            throw new QuranException(ResourceManager.getInstance().getString("quran","pageNumberError",[param1]));
         }
      }
      
      private function validateHizb(param1:int) : void
      {
         if(param1 < 1 || param1 > QuranConstants.QURAN_HIZB_NUMBER)
         {
            throw new QuranException(ResourceManager.getInstance().getString("quran","hizbNumberError",[param1]));
         }
      }
      
      public function getSuraLength(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Sura = suraInfoById[param1];
         if(_loc2_.ayat)
         {
            return _loc2_.ayat.length;
         }
         _loc3_ = int(Sura(suraInfoById[param1]).startingAyaId);
         _loc4_ = param1 != QuranConstants.QURAN_SUWAR_NUMBER ? int(Sura(suraInfoById[param1 + 1]).startingAyaId) : int(QuranConstants.QURAN_AYAT_NUMBER + 1);
         return _loc4_ - _loc3_;
      }
      
      private function getInternalAyaNumber(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = this.getSuraLength(param1);
         if(_loc4_ >= param2)
         {
            return int(Sura(suraInfoById[param1]).startingAyaId + param2 - 1);
         }
         throw new QuranException(ResourceManager.getInstance().getString("quran","ayaNumberError",[suraInfoById[param1].name,_loc4_,param2]));
      }
      
      private function getAyaConverter() : AyaConverter
      {
         if(!this.ayaConverter)
         {
            this.ayaConverter = new AyaConverter();
         }
         return this.ayaConverter;
      }
      
      private function getPageConverter() : PageConverter
      {
         if(!this.pageConverter)
         {
            this.pageConverter = new PageConverter();
         }
         return this.pageConverter;
      }
      
      private function getHizbConverter() : HizbConverter
      {
         if(!this.hizbConverter)
         {
            this.hizbConverter = new HizbConverter();
         }
         return this.hizbConverter;
      }
      
      [Bindable(event="propertyChange")]
      public function get basmalah() : Aya
      {
         return this._1713722389basmalah;
      }
      
      public function set basmalah(param1:Aya) : void
      {
         var _loc2_:Object = this._1713722389basmalah;
         if(_loc2_ !== param1)
         {
            this._1713722389basmalah = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"basmalah",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}

