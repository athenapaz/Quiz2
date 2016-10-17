using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_Products_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetProducts();
        }
    }

    void GetProducts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Products.ProductID, Products.Name, Categories.Category, " +
            "Products.Code, Products.Description, Products.Image, Products.Price, " +
            "Products.IsFeatured, Products.DateAdded, Products.DateModified, Products.Status " +
            "FROM Products INNER JOIN Categories ON Products.CatID = Categories.CatID ";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();
    }
    protected void ddlTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtSearch.Text = string.Empty;

        if (ddlTypes.SelectedIndex == 0)
        {
            keyword.Visible = true;
            isfeatured.Visible = false;
        }
        else
        {
            keyword.Visible = false;
            isfeatured.Visible = true;
        }
    }
    void GetProducts(string keyword)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Products.ProductID, Products.Name, Categories.Category, " +
            "Products.Code, Products.Description, Products.Image, Products.Price, " +
            "Products.IsFeatured, Products.DateAdded, Products.DateModified, Products.Status " +
            "FROM Products INNER JOIN Categories ON Products.CatID = Categories.CatID" +
            "WHERE Products.ProductID LIKE '%" + keyword + "%' OR Products.Name LIKE '%" + keyword + "%' OR " +
            "Categories.Category LIKE '%" + keyword + "%' OR Products.Code LIKE '%" + keyword + "%' OR " +
            "Products.Description LIKE '%" + keyword + "%' OR Products.Image LIKE '%" + keyword + "%' OR " +
            "Products.Price LIKE '%" + keyword + "%' OR Products.IsFeatured LIKE '%" + keyword + "%'";

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        if (txtSearch.Text.Trim() == "")
            GetProducts();
        else
            GetProducts(txtSearch.Text);
    }
    void GetProductsByIsFeatured()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Products.ProductID, Products.Name, Categories.Category, " +
            "Products.Code, Products.Description, Products.Image, Products.Price, " +
            "Products.IsFeatured, Products.DateAdded, Products.DateModified, Products.Status " +
            "FROM Products INNER JOIN Categories ON Products.CatID = Categories.CatID" +
            "WHERE Products.IsFeatured=@IsFeatured";

        cmd.Parameters.AddWithValue("@IsFeatured", ddlIsFeatured.SelectedValue);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();
    }
    protected void ddlIsFeatured_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetProductsByIsFeatured();
    }
    protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProducts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetProducts();
    }
    protected void lvProducts_DataBound(object sender, EventArgs e)
    {
        dpProducts.Visible = dpProducts.PageSize < dpProducts.TotalRowCount;
    }
}
