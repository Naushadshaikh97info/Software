using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Form : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    static int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
            return;

        if (Request.QueryString["activation"] != null)
        {
            var id = (from a in linq_obj.regist_details
                      where a.intglcode == Convert.ToInt32(Request.QueryString["activation"].ToString())
                      select a).Single();
            if (id.status == "Deactive")
            {
                id.status = "Active";
                linq_obj.SubmitChanges();
            }
            activation_modal.Show();
        }

        this.Form.DefaultButton = btn_submit.UniqueID;
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var id = (from a in linq_obj.regist_details
                      select a).ToList();

            for (int i = 0; i < id.Count; i++)
            {
                if (id[i].email == txt_email.Text && id[i].password == txt_password.Text && id[i].status == "Active")
                {
                        Session["username"] = txt_email.Text;
                        var id2 = (from a in linq_obj.regist_details
                                   where a.email == txt_email.Text
                                   select a).Single();
                        Session["userid"] = id2.intglcode;
                        Session["login"] = "yes";

                        var id4 = (from a in linq_obj.user_login_counts
                                   where a.short_date == System.DateTime.Now.ToShortDateString()
                                   orderby a.intglcode descending
                                   select a).ToList();

                        if (Request.QueryString["id"] != null)
                        {
                            Response.Redirect("checkout.aspx");
                        }
                        else
                        {
                            Response.Redirect("Default.aspx");
                        }
                }
                else if (id[i].email == txt_email.Text && id[i].password == txt_password.Text && id[i].status == "Deactive")
                {
                    Page.RegisterStartupScript("onload", "<script language='javascript'>alert('**Your Account is Deactivate by Admin**')</script>");
                }
                else if (id[i].email != txt_email.Text || id[i].password != txt_password.Text)
                {
                    Page.RegisterStartupScript("onload", "<script language='javascript'>alert('**Incorrect UserName or Password**')</script>");
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btn_forgot_submit_Click(object sender, EventArgs e)
    {
        var id = (from a in linq_obj.regist_details
                  where a.email == txt_email_id.Text
                  select a).ToList();

        if (id.Count() == 1)
        {
            try
            {
                SmtpClient smtpclient;
                MailMessage message;
                string str23 = "Username is: " + id[0].email + " and Password is: " + id[0].password;
                smtpclient = new SmtpClient();
                message = new MailMessage();
                try
                {
                    var id1 = (from a in linq_obj.emails
                               select a).Single();
                    message.From = new MailAddress("noreply@highchoices.com");
                    message.To.Add(id[0].email);   //send email to yahoo
                    message.Subject = "Forgot Password";
                    message.IsBodyHtml = true;
                    message.Body = str23;
                    smtpclient.Host = "mail.highchoices.com";
                    smtpclient.EnableSsl = false;
                    smtpclient.UseDefaultCredentials = true;
                    System.Net.NetworkCredential network = new System.Net.NetworkCredential();
                    network.UserName = "noreply@highchoices.com";//email
                    network.Password = "2k8#Gzd5"; //password
                    smtpclient.UseDefaultCredentials = true;
                    smtpclient.Credentials = network;
                    smtpclient.Port = 25;
                    smtpclient.Send(message);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Your Password is Successfully Send to Your Email **')</script>");
            }
            catch (Exception ex)
            {


            }
        }
        else
        {
            Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Enter Your right Email **')</script>");
        }
    }

    protected void btn_continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registraion_Form.aspx" + "?id=1");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Login_Form.aspx");
    }
}