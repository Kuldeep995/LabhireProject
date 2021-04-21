package checkandacess;
    import java.util.*;
	import java.sql.*;
	public class check{
		 Connection con;
	      Statement st;
	      ResultSet rs,rs1;
		
		public check(){
			 try {
		    	 Class.forName("com.ibm.db2.jcc.DB2Driver");
		     con = DriverManager.getConnection("jdbc:db2://dashdb-txn-sbox-yp-lon02-07.services.eu-gb.bluemix.net:50001/BLUDB:user=qtn98877;password=5g+cbr9xbd63s7w3;sslConnection=true;");
					st = con.createStatement();
					
		     }
		     catch(Exception e)
		     {
		    	 e.printStackTrace();
		     }
		}
		 public long  getcheck(String name,String password)
		 {
			
			  long  b=0;
			 try
			 {
			
			 rs=st.executeQuery("select * from QTN98877.EMPLOYER where EMAIL='"+name+"' AND PASSWORD='"+password+"'");
			 
				 while(rs.next())
				 {
					 b=Long.parseLong(rs.getString(1));
				 }
			
				return b;
				
		
			 }
			 catch (Exception e)
			 {
				 e.printStackTrace();
			 }
			  return b;
		 }
		 public boolean setuser(String name,String password,String email,long aadhar,long phone)
		 {
			 boolean b=true;
		
			 try
			 {
				 
				 
			
			int m= st.executeUpdate("INSERT INTO QTN98877.EMPLOYER VALUES('"+phone+"','"+name+"','"+password+"','"+aadhar+"','"+email+"')");
			    	if(m>=1)
				{
				 return true;
				}
				else
				{
					return false;
				}
				
		
			 }
			 catch (Exception e)
			 {
				 e.printStackTrace();
			 }
			 return true;
		 }
		 public boolean  addjob(long id,String service,String city,long  pay,String more)
		 {
			
				
			 try
			 {
				 rs=st.executeQuery("select SERVICE from QTN98877.JOB where EMPLOYERID='"+id+"'");
				 while(rs.next())
				 {
					if(service.equals(rs.getString(1)))
					{
						return false;
					}
					 
				 }
			
				 Twilio_Messagw m=new Twilio_Messagw();
				 
				 rs=st.executeQuery("select * from QTN98877.JOB");
				 int jid=0;
				 while(rs.next())
				 {
					 jid=rs.getInt(1);
					 
				 }
				 jid++;
				 rs=st.executeQuery("select PHONENUMBER from QTN98877.EMPLOYEE where TYPE='"+service+"'");
				 while(rs.next())
				 {
					 m.main1(rs.getString(1),service,city,pay,more,jid);
					 
				 }
				
				 String j="job"+jid;
			        st.executeUpdate("CREATE TABLE "+j+ " ( EMPLOYEEID LONG VARCHAR NOT NULL)");
			st.executeUpdate("INSERT INTO QTN98877.JOB VALUES("+jid+",'"+id+"','"+city+"',"+pay+",'"+service+"','"+more+"')");
			    	
				
		
			 }
			 catch (Exception e)
			 {
				 e.printStackTrace(); 
			 }
			 return true;
			
		 }
		public ArrayList<String> getCategory(long id)
		{
			 ArrayList<String> service = new ArrayList<String>();
			try
			 {
				
				 
				 rs=st.executeQuery("select SERVICE from QTN98877.JOB where EMPLOYERID='"+id+"'");
				
				 while(rs.next())
				 {
					service.add(rs.getString(1));
					 
				 }
			
				return service;
			    	
				
		
			 }
			 catch (Exception e)
			 {
				 e.printStackTrace(); 
			 }
		return service;		
		}
	 public ArrayList<ArrayList<String>> getEmployee(String t,long eid)
	 {
		 ArrayList<ArrayList<String>> employee = new ArrayList<ArrayList<String>>();
		 try
		 {
			
	
			 rs=st.executeQuery("select * from QTN98877.JOB where EMPLOYERID='"+eid+"'");
			int a=0;
	
			 while(rs.next())
			 {
				  a=rs.getInt(1); 
				  if(rs.getString(5).equals(t))
					  break;
			 }
			 if(a==0)
				 return employee;
			 rs=st.executeQuery("select * from  QTN98877.JOB"+a);
			 System.out.println(a);
			 while(rs.next())
			 {
				 System.out.println(rs.getString(1));
				 rs1=st.executeQuery("Select NAME,CITY,PHONENUMBER from QTN98877.EMPLOYEE where PHONENUMBER='"+rs.getString(1)+"'");
				 ArrayList<String> b=new ArrayList<String>();
				 rs1.next();
                 b.add(rs1.getString(1));
				 b.add(rs1.getString(2));
				 b.add(rs1.getString(3));
				 employee.add(b);
			
				 
			 }
			
		
			return employee;
		    	
			
	
		 }
		 catch (Exception e)
		 {
			 e.printStackTrace(); 
		 }
	return employee;	
	 }
	 public void remove(String t,long eid)
	 {
		 ArrayList<ArrayList<String>> employee = new ArrayList<ArrayList<String>>();
		 try
		 {
			
			 
			 rs=st.executeQuery("select * from QTN98877.JOB where EMPLOYERID='"+eid+"'");
			int a=0;
			 while(rs.next())
			 {
				  a=rs.getInt(1); 
				  if(rs.getString(5).equals(t))
					  break;
			 }
			 
			 st.executeUpdate("DROP TABLE QTN98877.JOB"+a);
			 st.executeUpdate("DELETE FROM QTN98877.JOB where JOBID="+a);
			
		    	
			
	
		 }
		 catch (Exception e)
		 {
			 e.printStackTrace(); 
		 }
	
	 }
		
		}
	 


