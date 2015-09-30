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

public partial class frmForAjaxCalls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string continentName = Request.QueryString["cont"] as string;

        if (continentName != null)
        {
            DataTable table = DBHelper.GetCountriesList(continentName.Trim());

            string result = string.Empty;
            
            foreach (DataRow r in table.Rows)
            {
                result += r["countryName"].ToString() + ";";
            }

            Response.Clear();
            Response.Write(result);
            Response.End();
        }
    }
}
