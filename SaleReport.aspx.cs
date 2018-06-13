using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pharmacy.Entities;
using Pharmacy.DAL;
using System.Data;

public partial class SaleReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsValid"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (IsPostBack == false)
        {
            BindSaleReport();
        }
    }

    public void BindSaleReport()
    {
        DALReport obj = new DALReport();
        DataSet ds = obj.Sale_Get();
        Session.Add("dtSaleReport", ds.Tables[0]);

        rptSaleReport.DataSource = ds.Tables[0];
        rptSaleReport.DataBind();
    }
    protected void rptSaleReport_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label lblGrandTotal = e.Item.FindControl("lblGrandTotal") as Label;

            DataTable dtSaleReport= Session["dtSaleReport"] as DataTable;
            lblGrandTotal.Text = dtSaleReport.Compute("SUM(GrandTotal)", string.Empty).ToString();
        }
    }
}