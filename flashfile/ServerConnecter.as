package
{
	import com.adobe.crypto.MD5;
	import com.adobe.serialization.json.JSON;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import rvf.socket.Client;
	
	public class ServerConnecter extends MovieClip
	{
		private var client:Client;
		
		public function ServerConnecter(c:Client)
		{
			this.client = c;
			
			this.x = this.y = 12;
			
			this.BtnConnect.addEventListener(MouseEvent.CLICK, ConnectHandler);
		}
		
		protected function ConnectHandler(event:MouseEvent) {
			var oData:Object = new Object();
			oData.servercode = Main.trim(TxtServercode.Textbox.text);
			oData.username = Main.trim(TxtUsername.Textbox.text);
			oData.password = Main.trim(MD5.hash(TxtPassword.Textbox.text));
			
			var oJson:Object = {type:"login", data:oData};
			client.SendData(com.adobe.serialization.json.JSON.encode(oJson));
		}
	}
}