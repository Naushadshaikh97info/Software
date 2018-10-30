using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about_us : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        fill_data();
    }
    private void fill_data()
    {
        var id = (from a in linq_obj.cms_msts
                  where a.intglcode == 1
                  select a).Single();
        Literal1.Text = id.about.ToString();
    }
}