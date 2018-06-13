using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pharmacy.Entities;
using Pharmacy.DAL;
using System.Data;

public partial class ProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsValid"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (this.IsPostBack == false)
        {
            DALProduct obj = new DALProduct();
            DataSet ds = obj.ProductList_Load();

            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryCode";
            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataBind();

            BindProducts();
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindProducts();
    }

    public void BindProducts()
    {
        int categoryCode = Convert.ToInt32(ddlCategory.SelectedValue);
        DALProduct obj = new DALProduct();
        DataSet ds = obj.Product_GetList(categoryCode);

        rptProducts.DataSource = ds.Tables[0];
        rptProducts.DataBind();
    }
    protected void btnGetProductList_Click(object sender, EventArgs e)
    {
        BindProducts();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptProducts.Items)
        {
            CheckBox chbSelect = (CheckBox)item.FindControl("chbSelect");
            if (chbSelect.Checked)
            {
                Label lblProductCode = (Label)item.FindControl("lblProductCode");

                DALProduct obj = new DALProduct();
                obj.Product_Delete(Convert.ToInt32(lblProductCode.Text));
            }
        }

        BindProducts();
    }
}