using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            //Let us populate the list of continents in the first drop down
            drpContinent.DataSource = DBHelper.GetContinentList();
            drpContinent.DataTextField = "continentName";
            drpContinent.DataValueField = "continentName";
            drpContinent.DataBind();

            //Set the second dropdown as the list of all countries of selected continent
            drpCountry.DataSource = DBHelper.GetCountriesList(drpContinent.SelectedValue);
            drpCountry.DataTextField = "countryName";
            drpCountry.DataValueField = "countryName";
            drpCountry.DataBind();
        }
    }

    [System.Web.Services.WebMethod]
    public static string OnContinentChange(string continentName)
    {
        DataTable table = DBHelper.GetCountriesList(continentName.Trim());

        string result = string.Empty;

        foreach (DataRow r in table.Rows)
        {
            result += r["countryName"].ToString() + ";";
        }

        return result;
    }
}
