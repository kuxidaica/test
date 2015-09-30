<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax - XMLHttpRequest Powered Cascaded drop down list</title>
    
    <script type="text/javascript">
    var xmlHttp;
    
    function UpdateCountries()
    {
        //Let us create the XML http object
        xmlHttp = null;
        
        if(window.XMLHttpRequest)
        {
            //for new browsers
            xmlHttp = new XMLHttpRequest();
        }
        else if(window.ActiveXObject)
        {
            //for old ones
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
        }
        
        if(xmlHttp != null)
        {
            //eveyhthing so far is just fine, lets proceed
            
            //Retreive the value of the first drop down list
            var contName = document.getElementById('<%=drpContinent.ClientID %>').value; 
            
            //Handle the response of this async request we just made(subscribe to callback)
            xmlHttp.onreadystatechange=state_Change;
            
            //Pass the value to a web page on server as query string using XMLHttpObject.
            xmlHttp.open("GET", "frmForAjaxCalls.aspx?cont=" + contName, true);
            xmlHttp.send(null); 
        }
    }
    
    //Handle the response of this async request
    function state_Change() 
    {
        if (xmlHttp.readyState==4) 
        {
            // 4 = “loaded” 
            if (xmlHttp.status==200) 
            {
                //request was successful. so Retrieve the values in the response.
                var countries = xmlHttp.responseText.split(';');
                var length = countries.length;
                
                //Change the second dropdownlists items as per the new values foudn in response.
                //let us remove existing items
                document.getElementById('<%=drpCountry.ClientID %>').options.length = 0;
                
                //Now add the new items to the dropdown.
                var dropDown = document.getElementById('<%=drpCountry.ClientID %>');                                
                for(var i = 0; i < length - 1; ++i)
                {
                    var option = document.createElement("option");
                    option.text = countries[i];
                    option.value = countries[i];
                    
                    dropDown.options.add(option);
                }
            }
        }
    }
    
    </script>
    
    
</head>
<body>
    <form id="form1" runat="server">
        Select Continent:
            <asp:DropDownList ID="drpContinent" runat="server" onchange="UpdateCountries();">
            </asp:DropDownList><br />
            <br />
            Select Country: &nbsp;
            <asp:DropDownList ID="drpCountry" runat="server">
            </asp:DropDownList>
    </form>
</body>
</html>

