package checkandacess;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Twilio_Messagw {
 
  private static final String ACCOUNT_SID = "AC3c7b3dd4a8e06c3ace6a6917b96b62a8";
  private static final String AUTH_TOKEN = "6b2fda3d3b8a19382eabd6b0679b7229";

  public  void main1(String number,String Service,String city,Long pay,String more,int jid) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Message message = Message.creator( new com.twilio.type.PhoneNumber("whatsapp:+91"+number),
            new com.twilio.type.PhoneNumber("whatsapp:+14155238886"),
        "||NEW JOB POSTED||\nJOBID: "+jid+"\nType: "+Service+"\nCity: "+city+"\nPay: "+pay+"\nMore: "+more+"\nIf you want to apply type YES \nIf you dont want to apply Type NO").create();

    System.out.println(message.getSid());
  }
}