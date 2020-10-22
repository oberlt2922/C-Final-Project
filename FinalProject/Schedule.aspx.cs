using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

namespace FinalProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlCounties.DataBind();
                ddlCounties.SelectedValue = "Burke";
                Calendar1.SelectedDate = DateTime.Today;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            if(IsValid && lblCalValid.Visible == false)
            {
                string name;
                string address;
                string city;
                string state;
                DateTime selectedDate;

                RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

                name = txtName.Text;
                address = (item.FindControl("lblAddress") as Label).Text;
                city = (item.FindControl("lblCity") as Label).Text;
                state = (item.FindControl("lblState") as Label).Text;
                selectedDate = Calendar1.SelectedDate;

                lblSchedule.Text = name + ", you have scheduled a viewing of the house at " +
                    address + ", " + city + " " + state + " on " + selectedDate.ToShortDateString();
                lblSchedule.Visible = true;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate < DateTime.Today)
                lblCalValid.Visible = true;
            else
                lblCalValid.Visible = false;
        }
    }
}