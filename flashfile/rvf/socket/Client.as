package rvf.socket
{
	import flash.display.Sprite;
	
	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	
	import rvf.events.UserEvent;

	public class Client extends Sprite
	{
		private var client:Socket;
		
		public function Client()
		{
			client = new Socket("172.23.237.190",4500);
			client.addEventListener(Event.CONNECT, clientConnectHandler);
			client.addEventListener(IOErrorEvent.IO_ERROR, clientErrorHandler);
		}
		
		protected function clientConnectHandler(event:Event):void {
			client.addEventListener(ProgressEvent.SOCKET_DATA, ClientDataHandler);
		}
		
		protected function clientErrorHandler(event:IOErrorEvent):void {
			trace(event.toString());
		}
		
		protected function ClientDataHandler(event:ProgressEvent):void {
			var client:Socket =  event.target as Socket;
			var sData:String = client.readUTFBytes(client.bytesAvailable);
			
			try {
				var oData:Object = com.adobe.serialization.json.JSON.decode(sData);
				
				switch(oData.type) {
					case 'login_success':
						var lse:UserEvent = new UserEvent("userLogedInSuccess", oData);
						dispatchEvent(lse);
						break;
					case 'login_failed':
						var lfe:UserEvent = new UserEvent("userLogedInFailed", oData);
						dispatchEvent(lfe);
						break;
				}
			} catch(err:Error) {
				trace(err);
			}
		}
		
		public function SendData(data:String) {
			try {
				if(client != null && client.connected) {
					client.writeUTFBytes(data);
					client.flush(); 
					trace("Sent message to " + client.remoteAddress + ":" + client.remotePort);
				} else {
					trace("No socket connection.");
				}
			} catch (error:Error) {
				trace(error.message);
			}
		}
	}
}