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

public partial class ProductUpdate : System.Web.UI.Page
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

            int productCode = Convert.ToInt32(Request.QueryString["p_c_z"]);
            BindProductDetail(productCode);
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Products p = new Products();
        p.ProductCode = Convert.ToInt32(Request.QueryString["p_c_z"]);
        p.CategoryCode = Convert.ToInt32(ddlCategory.SelectedValue);
        p.ProductName = txtProductName.Text;
        p.PurchaseRate = Convert.ToDecimal(txtPurchaseRate.Text);
        p.SaleRate = Convert.ToDecimal(txtSaleRate.Text);
        p.ExpiryDate = Convert.ToDateTime(txtExpiryDate.Text);

        DALProduct obj = new DALProduct();
        obj.Product_Update(p);

        Response.Redirect("ProductList.aspx");
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

    public void BindProductDetail(int productCode)
    {
        DALProduct obj = new DALProduct();
        DataSet ds = obj.Product_GetDetail(productCode);

        ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryCode"].ToString();
        txtProductName.Text = ds.Tables[0].Rows[0]["ProductName"].ToString();
        txtPurchaseRate.Text = ds.Tables[0].Rows[0]["PurchaseRate"].ToString();
        txtSaleRate.Text = ds.Tables[0].Rows[0]["SaleRate"].ToString();
        txtExpiryDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["ExpiryDate"]).ToString("dd-MM-yyyy");

    }
}