package com.riadvice.qurani
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   use namespace quran_internal;
   
   public class Sura implements IEventDispatcher
   {
      
      private var _3373707name:String;
      
      private var _1713722389basmalah:Aya;
      
      private var _1081514484makkia:Boolean;
      
      private var _1289968085orderInMushaf:int;
      
      private var _3009131ayat:Array;
      
      quran_internal var startingAyaId:int;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function Sura()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get name() : String
      {
         return this._3373707name;
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:Object = this._3373707name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
            }
         }
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
      
      [Bindable(event="propertyChange")]
      public function get makkia() : Boolean
      {
         return this._1081514484makkia;
      }
      
      public function set makkia(param1:Boolean) : void
      {
         var _loc2_:Object = this._1081514484makkia;
         if(_loc2_ !== param1)
         {
            this._1081514484makkia = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"makkia",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get orderInMushaf() : int
      {
         return this._1289968085orderInMushaf;
      }
      
      public function set orderInMushaf(param1:int) : void
      {
         var _loc2_:Object = this._1289968085orderInMushaf;
         if(_loc2_ !== param1)
         {
            this._1289968085orderInMushaf = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"orderInMushaf",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ayat() : Array
      {
         return this._3009131ayat;
      }
      
      public function set ayat(param1:Array) : void
      {
         var _loc2_:Object = this._3009131ayat;
         if(_loc2_ !== param1)
         {
            this._3009131ayat = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ayat",_loc2_,param1));
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

