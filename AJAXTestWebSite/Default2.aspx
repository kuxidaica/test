<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax - jQuery AJAX Powered Cascaded drop down list</title>
    <script type="text/javascript" src="JS/jquery-1.7.2.js"></script>
    
    <script type="text/javascript">
    
    //When the socument is ready call the function OnReady
    $(document).ready(OnReady);
    
    function OnReady() 
    {  
        //Handle the change event for the drop down list
        $("#drpContinent").change(onChange);        
    }    
        
    function onChange()
    { 
        //create the ajax request
        $.ajax
        ( 
            {
                type: "POST", //HTTP method
                url: "Default2.aspx/OnContinentChange", //page/method name
                data: "{'continentName':'"+$('#drpContinent').val() +"'}", //json to represent argument
                contentType: "application/json; charset=utf-8", 
                dataType: "json",
                success: callback,
                error: onError
            }
        );
    
    }
    
    //Handle the callback on success
    function callback(msg)
    { 
        //handle the callback to handle response                
        //request was successful. so Retrieve the values in the response.
        var countries = msg.split(';');
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
    
    //Handle the callback on error
    function onError()
    {
        alert('something went wrong');
    }
    
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            Select Continent:
            <asp:DropDownList ID="drpContinent" runat="server">
            </asp:DropDownList><br />
            <br />
            Select Country: &nbsp;
            <asp:DropDownList ID="drpCountry" runat="server">
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
