package rvf.events
{
	import com.adobe.fileformats.vcard.Email;
	
	import flash.events.Event;
	import flash.net.Socket;

	public class UserEvent extends Event
	{
		public static const USER_LOGED_IN_SUCCESS:String = "userLogedInSuccess";
		public static const USER_LOGED_IN_FAILED:String = "userLogedInFailed";
		
		private var oData:Object;
		
		public function UserEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type,bubbles,cancelable);
			this.oData = data;
		}
		
		public function getData():Object {return oData;}
	}
}