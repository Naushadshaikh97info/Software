using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        if (Session["total_qty"] != null)
        {
            lblitem.Text = Session["total_qty"].ToString();

        }
        if (Session["total_amt"] != null)
        {
            lbl_totalamt.Text = Session["total_amt"].ToString();
        }
        if (Session["username"] != null)
        {
            lbl_login.Visible = false;
            lbl_createaccount.Visible = false;
            lbl_logout.Visible = true;
            lbl_order_history.Visible = true;
            lbl_shopping.Visible = true;
            lbl_Order_Status.Visible = true;
            lbl_checkout.Visible = true;
            lbl_myaccount.Visible = true;
            lbl_changepassword.Visible = true;
        }
        else
        {

        } 
        fill_category();
        fill_category1();
        fill_latest_items();
    }
    private void fill_category()
    {
        try
        {
            var id = (from a in linq_obj.main_category_msts

                      select new
                      {
                          code = a.intglcode,
                          menuname = a.main_cate
                      }).ToList();
            Repeater1.DataSource = id;
            Repeater1.DataBind();

            for (int i = 0; i < id.Count(); i++)
            {
                Repeater data = (Repeater)Repeater1.Items[i].FindControl("Repeater2");
                var id2 = (from a in linq_obj.category_masters
                           where a.main_cate_id == id[i].code
                           select new
                           {
                               code1 = a.intGlCode,
                               code = id[i].code,
                               submenu = a.category_name
                           }).ToList();
                data.DataSource = id2;
                data.DataBind();

                for (int i2 = 0; i2 < id2.Count(); i2++)
                {
                    Repeater data2 = (Repeater)data.Items[i2].FindControl("Repeater3");
                    var id4 = (from a in linq_obj.third_sub_cetegories
                               where a.sub_category == id2[i2].code1
                               select new
                               {
                                   code2 = a.intglcode,
                                   code1 = id[i2].code,
                                   thirdsubmenu = a.third_sub_category
                               }).ToList();
                    data2.DataSource = id4;
                    data2.DataBind();
                }
            }
        }
        catch (Exception ex) { }
    }
    private void fill_category1()
    {
        try
        {
            var id = (from a in linq_obj.main_category_msts

                      select new
                      {
                          code = a.intglcode,
                          menuname = a.main_cate
                      }).ToList();
            Repeater3.DataSource = id;
            Repeater3.DataBind();

            for (int i = 0; i < id.Count(); i++)
            {
                Repeater data = (Repeater)Repeater3.Items[i].FindControl("Repeater4");
                var id2 = (from a in linq_obj.category_masters
                           where a.main_cate_id == id[i].code
                           select new
                           {
                               code1 = a.intGlCode,
                               code = id[i].code,
                               submenu = a.category_name
                           }).ToList();
                data.DataSource = id2;
                data.DataBind();

                for (int i2 = 0; i2 < id2.Count(); i2++)
                {
                    Repeater data2 = (Repeater)data.Items[i2].FindControl("Repeater10");
                    var id4 = (from a in linq_obj.third_sub_cetegories
                               where a.sub_category == id2[i2].code1
                               select new
                               {
                                   code2 = a.intglcode,
                                   code1 = id[i2].code,
                                   thirdsubmenu = a.third_sub_category
                               }).ToList();
                    data2.DataSource = id4;
                    data2.DataBind();
                }
            }
        }
        catch (Exception ex) { }
    }
    private void fill_latest_items()
    {
        try
        {
            var id = (from a in linq_obj.product_masters
                      orderby a.intGlCode descending
                      select new
                      {
                          code = a.intGlCode,
                          p_img = "./upload/" + a.main_images,
                          p_name = a.product_name,
                          p_price = a.actual_price

                      }).Take(6).ToList();

            Repeater5.DataSource = id;
            Repeater5.DataBind();

        }
        catch (Exception ex)
        {


        }
    }
    protected void lbl_logout_Click(object sender, EventArgs e)
    {
        Session["total_qty"] = null;
        Session["total_amt"] = null;
        Session["username"] = "";
        Session["MemberID"] = "";
        Session["referense"] = "";
        Session["id"] = "";
        Session["account"] = "";
        Session["userid"] = "";
        Session["login"] = "";
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Default.aspx", false);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("search_product.aspx?id=" + txt_search.Text);
    }
    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("search_product.aspx?id=" + txt_search.Text);
    }
}
