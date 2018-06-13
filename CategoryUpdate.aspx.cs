using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pharmacy.Entities;
using Pharmacy.DAL;
using System.Data;

public partial class CategoryUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsValid"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        if (IsPostBack == false)
        {
            int categoryCode = Convert.ToInt32(Request.QueryString["c_c_p"]);
            BindCategoryDetail(categoryCode);
        }
    }

    public void BindCategoryDetail(int categoryCode)
    {
        DALCategory obj = new DALCategory();
        DataSet ds = obj.Category_GetDetail(categoryCode);

        txtCategoryName.Text = ds.Tables[0].Rows[0]["CategoryName"].ToString();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Categories c = new Categories();
        c.CategoryCode = Convert.ToInt32(Request.QueryString["c_c_p"]);
        c.CategoryName = txtCategoryName.Text;

        DALCategory obj = new DALCategory();
        obj.Category_Update(c);

        Response.Redirect("CategoryList.aspx");
    }
}