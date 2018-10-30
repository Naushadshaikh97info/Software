using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Change_Password : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int flag = 0;
            var id = (from a in linq_obj.regist_details
                      select a).ToList();
            for (int i = 0; i < id.Count(); i++)
            {
                if ((id[i].password) == txt_oldpassword.Text)
                {
                    flag = 1;
                    id[i].password = (txt_newpassword.Text);
                    linq_obj.SubmitChanges();
                    Session.Clear();
                    Session.Abandon();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Your Pasword Succesfully Change **');window.location='Login_Form.aspx';</script>'");
                    //break;
                }
            }
            if (flag == 0)
            {
                Page.RegisterStartupScript("onload", "<script language='javascript'>alert('**Please Enter Correct Old Password**')</script> ");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
        }
    }
}