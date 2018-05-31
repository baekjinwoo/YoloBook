<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<script src="resources/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<script src="resources/js/bootstrap.js"></script>

<%@page session="true" import="java.util.*" %>
<%
// JSP Calendar:--
// Created by Jason Benassi
// jbenassi@lime-light.com
// http://www.wakeboardutah.com
// 7-2002
%>
<%
// Global Vars
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year
String boxSize = "70";  // how big to make the box for the calendar
//build 2 calendars
Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();
	if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
	{
		currMonth = c.get(c.MONTH);
		currYear = c.get(c.YEAR);
		cal.set(currYear, currMonth,1);
	}
	else
	{
		if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
		{
			currMonth = Integer.parseInt(request.getParameter("month"));
			currYear = Integer.parseInt(request.getParameter("year"));
	
				if (Integer.parseInt( request.getParameter("action")) == 1 )
				{
					cal.set(currYear, currMonth, 1);
					cal.add(cal.MONTH, 1);
					currMonth = cal.get(cal.MONTH);
					currYear = cal.get(cal.YEAR);
				}
				else
				{
					cal.set(currYear, currMonth ,1);
					cal.add(cal.MONTH, -1);
					currMonth = cal.get(cal.MONTH);
					currYear = cal.get(cal.YEAR);
				}
		}
	} 
%>

<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);
        try
        {
                c.set(y,m,d);
                Date dt = c.getTime();
        }
          catch (IllegalArgumentException e)
        {
                return false;
        }
                return true;
    }
%>
<%!
   public String getDateName (int monthNumber) // This method is used to quickly return the proper name of a month
   {
		String strReturn = "";
		switch (monthNumber)
		{ 
	case 0:
		strReturn = "01";
		break;
	case 1:
		strReturn = "02";
		break;
	case 2:
		strReturn = "03";
		break;
	case 3:
		strReturn = "04";
		break;
	case 4:
		strReturn = "05";
		break;
	case 5:
		strReturn = "06";
		break;
	case 6:
		strReturn = "07";
		break;
	case 7:
		strReturn = "08";
		break;
	case 8:
		strReturn = "09";
		break;
	case 9:
		strReturn = "10";
		break;
	case 10:
		strReturn = "11";
		break;
	case 11:
		strReturn = "12";
		break;
	}
	return strReturn;
    }
%>
<html>

<head>
</body bgcolor='white'>
<table border='1' width='519' celpadding='0' cellspacing='0'>
  <tr>
	<td width='150' align='right' valign='middle'><a href="mainPage?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="2">이전달</font></a></td>
	<td width='260' align='center' valign='middle'><b><%=cal.get(cal.YEAR) + "-" +getDateName(cal.get(cal.MONTH))%></b></td>
	<td width='173' align='left' valign='middle'><a href="mainPage?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="2">다음달</font></a></td>
  </tr>
	</table>
<table id="calTable" border="0" width="520" bordercolorlight="#C0C0C0" bordercolordark="#808080" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
  <td width="100%">
    <table border="2" width="519" bordercolorlight="#C0C0C0" bordercolordark="#000000" style="border-collapse: collapse" bordercolor="#000000" cellpadding="0" cellspacing="0" bgcolor="#DFDCD8">
  	<tr>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    		<font color="#FFFFFF"><b>일</b></font></td>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    		<font color="#FFFFFF"><b>월</b></font></td>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    		<font color="#FFFFFF"><b>화</b></font></td>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
   		<font color="#FFFFFF"><b>수</b></font></td>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    		<font color="#FFFFFF"><b>목</b></font></td>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    		<font color="#FFFFFF"><b>금</b></font></td>
    		<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    		<font color="#FFFFFF"><b>토</b></font></td>
  	</tr>
<%
//'Calendar loop
	int currDay;
	String todayColor;
	int count = 1;
	int dispDay = 1;
	for (int w = 1; w < 7; w++)
	{
%>
  	<tr>
<% 
  		for (int d = 1; d < 8; d++)
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK)))
			{ 
%>
		<td width="<%=boxSize%>" height="<%=boxSize%>" valign="top" align="left">&nbsp;</td>
<%
				count += 1;
			} 
			else
			{
				if (isDate ( currMonth + 1, dispDay, currYear) ) // use the isDate method
				{ 
					if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
        				{
							todayColor = "#6C7EAA";
						}
						else
						{
							todayColor = "#ffffff";
						}
%> 
		<td bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top"><a id="datelink" href="<%=dispDay%>"><%=dispDay%></a><br>
		</td>
<%
					count += 1;
					dispDay += 1;
				}
				else
				{
%>
		<td width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top">&nbsp;</td>
<%
				} 
			}
       } 
%>
  	</tr> 
<% 
}
%>
</table>
</td>
<tr><td>
</table>


<div id="result"> ${vo.mnumber}  </div>
<script>
$('#calTable').on('click', "#datelink", function() {
	var day=$(this).attr("href");
	var month=<%=currMonth+1%>;
	var year=<%=currYear%>;
		
	$.ajax({
		type: 'post',
		data: {"day":day, "month":month, "year":year},
		url: 'getProgram',
		
		success: function(server_out) {
					$("#showPrograms").html("");
			for(var i=0; i<server_out.length; i++) {
				if(server_out[i].pnumber)
		result +=  "<table id = resulttable><h4><tr><td>"
		          + server_out[i].pnumber +"<td>"
			   	  + server_out[i].pname +"<td>"
		    	  + server_out[i].starttime +"<td>"
			      + server_out[i].endtime +"<td>"
			      + server_out[i].day +"<td>"
			      + server_out[i].price +"원<td>"
			      + server_out[i].limit+"명"
			      + "<button type='button' onclick='location.href=  \"  book?mnumber="+${vo.mnumber}+" &pnumber="+ server_out[i].pnumber+"  \"'>예약하기</button><td><tr></h4></table>";
						          				
			}
			
			$("#showPrograms").append(result);
		}
	});//ajax-end
	return false;
})//on-end
</script>
</body>
</html>