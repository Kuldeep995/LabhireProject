//"DATABASE=BLUDB;HOSTNAME=dashdb-txn-sbox-yp-lon02-13.services.eu-gb.bluemix.net;PORT=50000;PROTOCOL=TCPIP;UID=jls21200;PWD=4dhkdp+37p0dff6g;"
//JLS21200
var express = require('express');
var async=require('async');
var _ = require('lodash');
const bodyParser = require('body-parser')
const ibmdb = require('ibm_db');
var c = 0, ch=1, it=0, j;
var arr2=[];
arr2[it++]='Construction';
arr2[it++]='Farming';
let map1 = new Map();
const MessagingResponse = require('twilio').twiml.MessagingResponse;
const AssistantV2 = require('ibm-watson/assistant/v2');
const {
  IamAuthenticator
} = require('ibm-watson/auth');
const dsn = "DATABASE=BLUDB;HOSTNAME=dashdb-txn-sbox-yp-lon02-07.services.eu-gb.bluemix.net;PORT=50000;PROTOCOL=TCPIP;UID=qtn98877;PWD=5g+cbr9xbd63s7w3;"
const assistant = new AssistantV2({
  version: '2020-09-24',
  authenticator: new IamAuthenticator({
    apikey: 'wGWBeA6QdgeLbFy42y4S0eK4LvUJmxdHMAdROjRsEmjg',
  }),
  serviceUrl: 'https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/dfc60a1c-4a00-4a81-96de-08930575aefe',
  disableSslVerification: true,
});

let map=new Map();

var app = express();

  function db2Setup(dsn, number) {
  try {

    const conn=ibmdb.openSync(dsn);
    var str="Select PHONENUMBER from QTN98877.EMPLOYEE WHERE PHONENUMBER='"+number+"';";
    var data = conn.querySync(str);
    conn.close();
    return data;

  } catch (e) {
    console.log(e);
    return {
      dberror: e
    }
  }
}
 var client = require('twilio')(
          'AC3c7b3dd4a8e06c3ace6a6917b96b62a8',
          ''
        );
app.use(bodyParser.urlencoded({
  extended: false
}));
function all(message,number,twilioNumber,waid,req,res,arr)
{

	console.log('Recieved message from ' + number + ' saying \'' + message + '\'');
   assistant
    .message({
      assistantId: 'f0fc1e9d-a09a-4be7-9cbc-293f3a82232c',
      sessionId: map1.get(number).result.session_id,
      input: {
        'message_type': 'text',
        'text': message,
      }
    }).then(response =>{
                    if(response.result.output.generic[0].text=='checkuser')
                  {

                    var eid=  db2Setup(dsn,number.substring(12));
                    console.log(eid.length);
                   if(eid.length!=0)
                     {
assistant
    .message({
      assistantId: 'f0fc1e9d-a09a-4be7-9cbc-293f3a82232c',
      sessionId:map1.get(number).result.session_id,
      input: {
        'message_type': 'text',
        'text': 'old employee',
      }
    }).then(response1 =>{
      client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response1.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');
  });
}

  else{


assistant
    .message({
      assistantId: 'f0fc1e9d-a09a-4be7-9cbc-293f3a82232c',
      sessionId:map1.get(number).result.session_id,
      input: {
        'message_type': 'text',
        'text': 'not',
      }
    }).then(response1 =>{
      client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response1.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response1.result.output.generic[0].text);
        res.send('');



  });
 }
}

        else  if (response.result.output.generic[0].text == 'Employer will Contact you.')
         {
           ibmdb.open(dsn, function(err, conn) {
               if (err) {
                 console.log("cant open");
                 console.log(err);
               }


               var str4 = "INSERT INTO QTN98877.JOB"+message+" (EMPLOYEEID) VALUES('"+number.substring(12)+"')";
               conn.query(str4, function(err, data) {
                 if (err) {
                 console.log(err);
                 } else {
                   conn.close(function() {
                     console.log("success job table created");
                   });
                 }
               });

});
client.messages.create({
from: 'whatsapp:+14155238886',
to: number,
body: response.result.output.generic[0].text
}, function(err, message) {
if (err) {
 console.error(err.message);
}

});
console.log(response.result.output.generic[0].text);
res.send('');

         }
        else
        if (response.result.output.generic[0].text == 'Oh! you seem to be new. Welcome to LabHire the world where we say, Lets Get Hired. Send 1 to register as an employee or Send 2 to register as an employer.') {

           client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');

        }
        else if (response.result.output.generic[0].text == 'Please enter your AADHAR Number') {
          arr[0]=message;
          arr[1]=number.substring(12);
           client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');

        }
        else if(response.result.output.generic[0].text == 'Please enter your City'){
            arr[2]=message;
            client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');
        }
        else if(response.result.output.generic[0].text == 'What kind of work do you prefer?'){
            arr[3]=message;
            var str1=response.result.output.generic[0].text+" type one of the following or type the category if it is new: Construction";

            for( j=1;j<arr2.length;++j)
            {
              str1=str1+" ,"+arr2[j];
            }
            client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: str1
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');

        }
        else if(response.result.output.generic[0].text == 'Thank You For Registering. You will be notified when any job in your category is posted.'){
            arr[4]=message;
            var flag=0;
            for(j=0;j<arr2.length;++j)
            {
              if(arr2[j]==message)
              {
                flag=1; break;
              }
            }
            if(flag==0)
            arr2[it++]=message;
            console.log(arr2);
            arr[5]=number.substring(12);
            ibmdb.open(dsn, function(err, conn) {
                if (err) {
                  console.log("cant open");
                  console.log(err);
                }


                var str4 = "INSERT INTO  QTN98877.EMPLOYEE (NAME,AADHAR,CITY,TYPE,PHONENUMBER) VALUES('"+arr[0]+"','"+arr[2]+"','"+arr[3]+"','"+arr[4]+"','"+arr[5]+"')";
                conn.query(str4, function(err, data) {
                  if (err) {
                  console.log(err);
                  } else {
                    conn.close(function() {
                      console.log("success");
                    });
                  }
                });

                // conn.close(function() {
                //   return response.json({
                //     success: 1,
                //     message: 'Data Edited!'
                //   });
                // });
            });

            console.log(arr);
            client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');

        }
         else {

            client.messages.create({
          from: 'whatsapp:+14155238886',
          to: number,
          body: response.result.output.generic[0].text
        }, function(err, message) {
          if (err) {
            console.error(err.message);
          }

        });
        console.log(response.result.output.generic[0].text);
        res.send('');

        }




      },
      err => {
        console.log(err);
      }
    );
}

app.post('/smssent', function(req, res) {

  var message = req.body.Body;
  var number = req.body.From;
  var twilioNumber = req.body.To;
  var waid = req.body.WaId;

if(!map1.has(number))
{

  assistant.createSession({
      assistantId: 'f0fc1e9d-a09a-4be7-9cbc-293f3a82232c'
    })
    .then(res1 => {
         map1.set(number,res1);
        var arr=[];
         map.set(number,arr);
         all(message,number,twilioNumber,waid,req,res,map.get(number));
    })
    .catch(err => {
      console.log(err);
    });


}

else
{

   all(message,number,twilioNumber,waid,req,res,map.get(number));
}

});
app.listen(3000, function() {
  console.log('Example app listening on port 3000!');
});
