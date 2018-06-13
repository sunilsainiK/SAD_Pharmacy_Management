using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pharmacy.Entities;
using Pharmacy.DAL;
using System.Data;
using System.IO;

public partial class ProductAdd : System.Web.UI.Page
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
            DataSet ds = obj.Product_Add_Load();

            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryCode";
            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Products p = new Products();
            p.CategoryCode = Convert.ToInt32(ddlCategory.SelectedValue);
            p.ProductName = txtProductName.Text;
            p.PurchaseRate = Convert.ToDecimal(txtPurchaseRate.Text);
            p.SaleRate = Convert.ToDecimal(txtSaleRate.Text);
            p.ExpiryDate = Convert.ToDateTime(txtExpiryDate.Text);
            p.ImageURL = UploadImage();

            DALProduct obj = new DALProduct();
            obj.Product_Add(p);
        }
        catch (Exception ex)
        {
            DALUser obj = new DALUser();
            obj.ErrorLog_Add("Add Product | " + ex.Message);
            lblMessage.Text = "Some invalid Data, check again";
        }
    }

    public string UploadImage()
    {
        string fileName = string.Empty;
        if (upImage.PostedFile.ContentType == "image/png" || upImage.PostedFile.ContentType == "image/jpeg")
        {
            string finalURL = string.Empty;
            fileName = Guid.NewGuid().ToString() + Path.GetExtension(upImage.FileName);
            string serverURL = Server.MapPath("../Images/Uploads");
            finalURL = serverURL + "\\" + fileName;
            upImage.SaveAs(finalURL);
            lblMessage.Visible = false;
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "plz select appropriate file type.";
        }
        return fileName;
    }
}