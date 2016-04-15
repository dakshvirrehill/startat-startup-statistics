<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Company" %>
<%@ page import="model.BusinessModelData" %>
<%@ page import="model.DBOperations" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<%
if(session.getAttribute("username")==null)
{
String message="Kindly login before accessing this page";
request.setAttribute("msg",message);
response.sendRedirect("login.jsp");
}
%>
<title>Business Model Creation | <%=session.getAttribute("username") %></title>

<style>
.empty {
clear:both;
padding-bottom:70px;
}
.top {
clear:both;
padding-top:50px;
}
.bord {
border: medium solid;
}
</style>
</head>
<body>
<nav class="navbar navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><img src="images/startat-logo-navbar.png"></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="page.jsp?name=about">About</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="addcomp.jsp">Add a Company</a>
          <li><a href="profile.jsp">Profile</a></li>
          <li><a href="settings.jsp">Settings</a></li>
          <li><a href="logout">Logout</a></li> 
        </ul>
      </li>
    </ul>
  </div>
</nav>
<div class="empty top"></div>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="dashboard.jsp">Dashboard</a></li>
		<li class="active">Business Model Creation</li>
	</ol>
</div>
<div class="empty"></div>
<div class="container-fluid">
<%
if(request.getParameter("name")==null)
{
	Vector<Company> company=DBOperations.getAllCompanyDetails((String) session.getAttribute("username"));
	Iterator i=company.iterator();
	if(!i.hasNext())
		{
			%>
			<div class="alert alert-info">No Companies added yet. <a href="addcomp.jsp">Add Now</a></div>
			<%
		}
		else {
			%>
			<div class="row">
				<div class="col-sm-2 col-md-2 col-lg-2">SNo.</div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-lg-2">Name</div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-lg-2">Domain</div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-3 col-md-3 col-lg-3">Verified</div>
			</div>
			<%
			Company c=new Company();
			int j=0;
			while(i.hasNext()) {
				c=(Company)i.next();
				j++;
			%>
			<div class="row">
				<div class="col-sm-2 col-md-2 col-lg-2"><%=j %></div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<%if(c.getVerification().equals("Yes")) { %><a href="bmc.jsp?name=<%=c.getCId() %>"><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div></a><%} else { %><div class="col-sm-2 col-md-2 col-lg-2"><%=c.getName() %></div><%} %>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-2 col-md-2 col-lg-2"><%=c.getField_of_interest() %></div>
				<div class="col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-sm-3 col-md-3 col-lg-3"><%=c.getVerification() %><%if(c.getVerification().equals("No")){%><a class="btn btn-primary" href="addveri.jsp?name=<%=c.getCId()%>">Get Verified</a><%} %></div>
			</div>
			<%	
			}
		}
}
else {
	String cid=request.getParameter("name");
	Company c=DBOperations.getCompanyDetails(Integer.parseInt(cid));
%>
<div class="jumbotron">
 <div align="right"><img src="<%=c.getLogo_path()%>"></div><h1><%=c.getName() %></h1><h3><a href="<%=c.getWebsite() %>"><%=c.getWebsite()%></a></h3><h3><a href="mailto:<%=c.getEmail() %>"><%=c.getEmail()%></a></h3>
<h2 align="center">Business Model Creation</h2> 
 </div>
 <div class="empty"></div>
 <% if(DBOperations.checkBmVsCompanyId(Integer.parseInt(cid))) {
	 Vector<String> bmname=DBOperations.getBMName(Integer.parseInt(cid));
	 Iterator ib=bmname.iterator();
	 String bmn="";
	 while(ib.hasNext()) {
		 bmn=(String)ib.next();
%>
&nbsp;&nbsp;&nbsp;<a href="bmc.jsp?name=<%=cid %>&bmname=<%=bmn %>"><%=bmn %></a>
<%		 
	 }	 
 }
 %>
 <form action="BMC" method="post" role="form" class="form-horizontal">
	<div class="form-group">
		<label for="bmname" class="control-label">New Business Model:</label>
		<input type="text" id="bmname" name="bmname" class="form-control" placeholder="Type business model name">
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary" name="BMN">Add new Business Model</button>
	</div>
</form>
<% if(request.getParameter("bmname")!=null) {
	String bmname=request.getParameter("bmname");
	Vector<BusinessModelData> bmd=DBOperations.getBMData(Integer.parseInt(cid), bmname);
	BusinessModelData b=new BusinessModelData();
	Iterator i=bmd.iterator();
	String keyp="",keya="",keyr="",valp="",cusr="",chan="",cuss="",coss="",revs="";
	while(i.hasNext()) {
		b=(BusinessModelData)i.next();
		if(b.getBMTag().equals("Key Partners")){keyp=b.getBMData();}
		else if(b.getBMTag().equals("Key Activities")){keya=b.getBMData();}
		else if(b.getBMTag().equals("Key Resources")){keyr=b.getBMData();}
		else if(b.getBMTag().equals("Value Propositions")){valp=b.getBMData();}
		else if(b.getBMTag().equals("Channels")){chan=b.getBMData();}
		else if(b.getBMTag().equals("Customer Segments")){cuss=b.getBMData();}
		else if(b.getBMTag().equals("Customer Relationships")){cusr=b.getBMData();}
		else if(b.getBMTag().equals("Cost Structure")){coss=b.getBMData();}
		else if(b.getBMTag().equals("Revenue Streams")){revs=b.getBMData();}
	}
%>
<div class="row"> 
 <div class="col-sm-1 col-md-1 col-lg-1"></div>
 <div class="col-sm-2 col-md-2 col-lg-2 bord">
 <a href="#kp" id="keyp" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the eighth position among others"><div class="row"><h2>Key Partners</h2></div>
 	<div class="empty"></div>
 	<div class="empty"></div>
<%if(keyp.equals("")) {%>
 	<div class="row">What partnerships are necessary for survival?</div>
 	<div class="empty"></div>
 	<div class="empty"></div>
 	<div class="empty"></div>
 <%}else { %>
 	<div class="row">
 <%String k[]=keyp.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
 	<div class="empty"></div>
 </a>
 </div>
 <div class="col-sm-2 col-md-2 col-lg-2 bord">
 	<a href="#ka" id="keya"  data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the seventh position among others"><div class="row"><h2>Key Activities</h2></div>
 	<div class="empty"></div>
 <% if(keya.equals("")) {%>	
 	<div style="padding-top:17px"></div>
 	<div class="row">What are the activities that are essential to your brand?</div>
 <%}else { %>
 	<div class="row">
 <%String k[]=keya.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
 </a>
 <a href="#kr" id="keyr" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the sixth position among others"><div class="row"><h2>Key Resources</h2></div>
 	<div class="empty"></div>
<% if(keyr.equals("")) {%>
 	<div class="row">What are the resources that are essential to your brand?</div>
 	<div class="empty"></div>
<%}else { %>
 	<div class="row">
 <%String k[]=keyr.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
 	<div style="padding-top:20px"></div>
 </a>
 </div>
 <div class="col-sm-2 col-md-2 col-lg-2 bord">
 	<a href="#vp" id="valuep" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the second position among others"><div class="row"><h2>Value Propositions</h2></div>
 	<div class="empty"></div>
 	<div class="empty"></div>
<% if(valp.equals("")) {%>
 	<div class="row">What makes you different and unique?</div>
 	<div class="empty"></div>
 	<div class="empty"></div>
<%}else { %>
 	<div class="row">
 <%String k[]=valp.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
    <div class="empty"></div>
    <div style="padding-top:37px"></div>
</a>
</div>
 <div class="col-sm-2 col-md-2 col-lg-2 bord">
 	<a href="#cr" id="customerr" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the forth position among others"><div class="row"><h2>Customer Relationships</h2></div>	
 	<div class="empty"></div>
 <%if(cusr.equals("")) {%>	
 	<div style="padding-top:4px"></div>
 	<div class="row">What are you doing to maintain customer relationships?</div>
 <%}else { %>
 	<div class="row">
 <%String k[]=cusr.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
 </a>
 <a href="#c" id="channels" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the third position among others"> <div class="row"><h2>Channels</h2></div>

 	<div class="empty"></div>
 <%if(chan.equals("")) {%>
 	<div class="row">What are your distribution and other channels?</div>
 	<div class="empty"></div>
 <%}else { %>
 	<div class="row">
 <%String k[]=chan.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
 </a>
 </div>
 <div class="col-sm-2 col-md-2 col-lg-2 bord">
  	<a href="#cs" id="customers" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the first position among others"><div class="row"><h2>Customer Segments</h2></div>
 	<div class="empty"></div>
 	<div class="empty"></div>
 <%if(cuss.equals("")) {%>
 	<div class="row">What is your Target Audience?</div>
 	<div class="empty"></div>
 	<div class="empty"></div>
 <%}else { %>
 	<div class="row">
 <%String k[]=cuss.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
 	<div class="empty"></div>
 	<div class="empty"></div>
 	<div style="padding-top:57px"></div>
 </a>
 </div>
 <div class="col-sm-1 col-md-1 col-lg-1"></div>
</div>
<div class="row">
	<div class="col-sm-1 col-md-1 col-lg-1"></div>
	<div class="col-sm-5 col-md-5 col-lg-5 bord">
		<a href="#cos" id="costs" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the nineth position among others"><div class="row"><h2>Cost Structure</h2></div>
		<div class="empty"></div>
<% if(coss.equals("")) {%>		
		<div class="row">Your expenditure details</div>
<%}else { %>
 	<div class="row">
 <%String k[]=coss.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
		<div class="empty"></div>
	</a>
	</div>
	<div class="col-sm-5 col-md-5 col-lg-5 bord">
		<a href="#rs" id="revenues" data-toggle="tooltip" title="Click here to fill this segment or change current values. By convention, it is filled at the fifth position among others"><div class="row"><h2>Revenue Streams</h2></div>
		<div class="empty"></div>
<%if(revs.equals("")) {%>
		<div class="row">Your benefits/earning details</div>
<%}else { %>
 	<div class="row">
 <%String k[]=revs.split(";");
 int index=0;
 for(index=0;index<k.length;index++) {
	 if(index%3==0) {
	 %>
	 </div><div class="row">
	 <%
	 }
	 %>
	<div class="col-sm-4 col-md-4 col-lg-4"><%=k[index] %></div> 	 
	 <%
 }
 %>
 </div>
 <%} %>
		<div class="empty"></div>
	</a>		
	</div>
	<div class="col-sm-1 col-md-1 col-lg-1"></div>
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="cs">
	<h3>Customer Segments</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about your target audience. For example, if your company produces Video Games which are violent and PG-18. You would be targeting audience in the demographic of 18-30 age group,etc.<small> Kindly input all possible customer segments for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="CustomerSegments" class="control-label">Customer Segments:</label>
			<textarea rows="4" id="CustomerSegments" class="form-control" name="CustomerSegments" placeholder="Enter ';' seperated values"><%if(!cuss.equals("")) {%><%=cuss %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="cs" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="csmseg">Update</button>
		</div>
	</form>
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="vp">
	<h3>Value Propositions</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about your value i.e. what makes your company different from other companies in your domain and what value are you providing your customers. For example, The psychotic villains of DC Comics makes it different from other comics<small> Kindly input all possible value propositions for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="ValuePropositions" class="control-label">ValuePropositions:</label>
			<textarea rows="4" id="ValuePropositions" class="form-control" name="ValuePropostions" placeholder="Enter ';' seperated values"><%if(!valp.equals("")) {%><%=valp %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="vp" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="valprop">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="c">
	<h3>Channels</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about your transmission mediums. How your product is reaching your target audience is the question that needs to be answered here. Channels need not be specific. For example, for a retail store channels could be the store directly or courier services.<small> Kindly input all possible channels for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="ChannelsVal" class="control-label">Channels:</label>
			<textarea rows="4" id="ChannelsVal" class="form-control" name="ChannelsVal" placeholder="Enter ';' seperated values"><%if(!chan.equals("")) {%><%=chan %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="c" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="chanval">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="cr">
	<h3>Customer Relationships</h3>
		<p class="text-justify bg-primary">In this part of business model you explain about all the steps that are being taken by your company to maintain your customer base. These could be offers, discounts or any kind of schemes that are released to keep the customer satisfied and interested and not move to some other company.<small> Kindly input all possible Customer Relationships for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="CustomerRelationships" class="control-label">Customer Relationships:</label>
			<textarea rows="4" id="CustomerRelationships" class="form-control" name="CustomerRelationships" placeholder="Enter ';' seperated values"><%if(!cusr.equals("")) {%><%=cusr %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="cr" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="custrel">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="rs">
	<h3>Revenue Streams</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about your company's profit source i.e. all the products and services that your company earns from. For example for a vehicle manufacturing company, all vehicles that earn the company profit<small> Kindly input all possible Revenue Streams for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="RevenueStreams" class="control-label">Revenue Streams:</label>
			<textarea rows="4" id="RevenueStreams" class="form-control" name="RevenueStreams" placeholder="Enter ';' seperated values"><%if(!revs.equals("")) {%><%=revs %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="rs" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="revstream">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="kr">
	<h3>Key Resources</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about your resources that are essential for the development and management of the product. For example for a food processing company that makes chocolates, resources would be factories, raw materials, machines and workers.<small> Kindly input all possible key resources for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="KeyResources" class="control-label">Key Resources:</label>
			<textarea rows="4" id="KeyResources" class="form-control" name="KeyResources" placeholder="Enter ';' seperated values"><%if(!keyr.equals("")) {%><%=keyr %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="kr" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="keyres">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="ka">
	<h3>Key Activities</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about what are the essential functional requirements for developing the product. For example for landscaping company, scoping  the complete property is a key activity<small> Kindly input all possible key activities for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="KeyActivities" class="control-label">Key Activities:</label>
			<textarea rows="4" id="KeyActivities" class="form-control" name="KeyActivities" placeholder="Enter ';' seperated values"><%if(!keya.equals("")) {%><%=keya %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="ka" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="keyact">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="kp">
	<h3>Key Partners</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about the key partnerships and collaborations that are integral to the company's survival. For example when Hero Honda established in India, Hero had most of the key resources and Honda had the experience and funding which made it a key partnership in India.<small> Kindly input all possible key partnerships for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="KeyPartners" class="control-label">Key Partners:</label>
			<textarea rows="4" id="KeyPartners" class="form-control" name="KeyPartners" placeholder="Enter ';' seperated values"><%if(!keyp.equals("")) {%><%=keyp %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="kp" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="keypart">Update</button>
		</div>
	</form>	
</div>
<div class="empty"></div>
<div class="empty"></div>
<div id="cos">
	<h3>Cost Structure</h3>
	<p class="text-justify bg-primary">In this part of business model you explain about the expenses of the company. This part includes all possible expenditures including hiring and firing costs as per your company's set up. For example, The cost structure for a wooden desk maker would be the cost of wood, equipment,nails and glue.<small> Kindly input all possible cost structure for your company. (Separate them with ;)</small></p>
	<form action="BMC" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<label for="CostStructure" class="control-label">Cost Structure:</label>
			<textarea rows="4" id="CostStructure" class="form-control" name="CostStructure" placeholder="Enter ';' seperated values"><%if(!coss.equals("")) {%><%=coss %><%} %></textarea>
		</div>
		<div class="form-group"><input type="text" name="id" value="cos" hidden><input type="text" name="bmname" value="<%=bmname %>" hidden><input type="text" name="cid" value="<%=cid %>" hidden><button type="submit" class="btn btn-primary" name="coststruct">Update</button>
		</div>
	</form>
</div>
<div class="empty"></div>
<div class="empty"></div>
<%
}
}
%>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>   
<% if(request.getParameter("name")!=null) {%>
<script type="text/javascript">
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
<% if(request.getParameter("bmname")!=null) {%>
	$('#keyp').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#keya').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#keyr').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#valuep').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#customerr').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#channels').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#customers').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#costs').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
	$('#revenues').on('click',function(event){
		// Prevent default anchor click behavior
	    event.preventDefault();
	    // Store hash
	    var hash = this.hash;
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 800, function(){
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	});
<% } %>
});
</script>
<% } %>
</body>
</html>