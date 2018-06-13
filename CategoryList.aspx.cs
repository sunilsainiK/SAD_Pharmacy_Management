using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pharmacy.Entities;
using Pharmacy.DAL;
using System.Data;

public partial class CategoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsValid"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (IsPostBack == false)
        {
            BindCategories();
        }
    }

    public void BindCategories()
    {
        DALCategory obj = new DALCategory();
        DataSet ds = obj.Category_GetList();

        rptCategories.DataSource = ds.Tables[0];
        rptCategories.DataBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptCategories.Items)
        {
            CheckBox chbSelect = (CheckBox)item.FindControl("chbSelect");
            if (chbSelect.Checked)
            {
                Label lblCategoryCode = (Label)item.FindControl("lblCategoryCode");
                DALCategory obj = new DALCategory();
                obj.Category_Delete(Convert.ToInt32(lblCategoryCode.Text));
            }
        }

        BindCategories();
    }
}