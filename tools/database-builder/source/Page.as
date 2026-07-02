package com.riadvice.qurani
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class Page implements IEventDispatcher
   {
      
      private var _1034364087number:int;
      
      private var _2129312877startSura:int;
      
      private var _1316768615startAya:int;
      
      private var _3009131ayat:Array;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function Page()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get number() : int
      {
         return this._1034364087number;
      }
      
      public function set number(param1:int) : void
      {
         var _loc2_:Object = this._1034364087number;
         if(_loc2_ !== param1)
         {
            this._1034364087number = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"number",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startSura() : int
      {
         return this._2129312877startSura;
      }
      
      public function set startSura(param1:int) : void
      {
         var _loc2_:Object = this._2129312877startSura;
         if(_loc2_ !== param1)
         {
            this._2129312877startSura = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startSura",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startAya() : int
      {
         return this._1316768615startAya;
      }
      
      public function set startAya(param1:int) : void
      {
         var _loc2_:Object = this._1316768615startAya;
         if(_loc2_ !== param1)
         {
            this._1316768615startAya = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startAya",_loc2_,param1));
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

