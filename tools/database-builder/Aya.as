package com.riadvice.qurani
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class Aya implements IEventDispatcher
   {
      
      private var _1034364087number:String;
      
      private var _1145934862othmani:String;
      
      private var _100323824imlai:String;
      
      private var _bindingEventDispatcher:EventDispatcher = new EventDispatcher(IEventDispatcher(this));
      
      public function Aya()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get number() : String
      {
         return this._1034364087number;
      }
      
      public function set number(param1:String) : void
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
      public function get othmani() : String
      {
         return this._1145934862othmani;
      }
      
      public function set othmani(param1:String) : void
      {
         var _loc2_:Object = this._1145934862othmani;
         if(_loc2_ !== param1)
         {
            this._1145934862othmani = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"othmani",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imlai() : String
      {
         return this._100323824imlai;
      }
      
      public function set imlai(param1:String) : void
      {
         var _loc2_:Object = this._100323824imlai;
         if(_loc2_ !== param1)
         {
            this._100323824imlai = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imlai",_loc2_,param1));
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

