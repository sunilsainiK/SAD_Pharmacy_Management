using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pharmacy.Entities;
using Pharmacy.DAL;

public partial class CategoryAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsValid"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Categories c = new Categories();
        c.CategoryName = txtCategoryName.Text;

        DALCategory obj = new DALCategory();
        obj.Category_Add(c);
    }
}