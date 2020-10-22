using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "A database error has occurred.  Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Another user may have updated that category.  Please try again.";
            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "A database error has occurred.  Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Another user may have updated that category.  Please try again.";
            }
        }

        

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                //insert row
                var parameters = SqlDataSource2.InsertParameters;
                parameters["County"].DefaultValue = txtInsertCounty.Text;
                parameters["Price"].DefaultValue = txtInsertPrice.Text;
                parameters["Bed"].DefaultValue = txtInsertBed.Text;
                parameters["Bath"].DefaultValue = txtInsertBath.Text;
                parameters["SquareFeet"].DefaultValue = txtInsertSqft.Text;
                parameters["Address"].DefaultValue = txtInsertAddress.Text;
                parameters["City"].DefaultValue = txtInsertCity.Text;
                parameters["State"].DefaultValue = txtInsertState.Text;
                parameters["Zip"].DefaultValue = txtInsertZip.Text;
                parameters["NextOpenHouse"].DefaultValue = txtInsertOpenHouse.Text;
                if (filePics.HasFiles)
                {
                    int i = 1;
                    foreach (HttpPostedFile uploadedFile in filePics.PostedFiles)
                    {
                        string name = "Pic" + i;
                        i++;
                        try
                        {
                            parameters[name].DefaultValue = uploadedFile.FileName;
                        }
                        catch(Exception ex)
                        {
                            lblError.Text = "Each row can only contain 9 images.";
                        }
                    }
                }
                try
                {
                    SqlDataSource2.Insert();
                }
                catch (Exception ex)
                {
                    lblError.Text = "A database error has occurred. Message: " + ex.Message;
                }
                if (filePics.HasFiles)
                {
                    foreach (HttpPostedFile uploadFile in filePics.PostedFiles)
                    {
                        uploadFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Images/"), uploadFile.FileName));
                    }
                }
            }
        }




        protected void btnAdd_Command(object sender, CommandEventArgs e)
        {
            Page.Validate("insert");
            if(IsValid)
            {

                txtInsertCounty.Text = "";
                txtInsertPrice.Text = "";
                txtInsertBed.Text = "";
                txtInsertBath.Text = "";
                txtInsertSqft.Text = "";
                txtInsertAddress.Text = "";
                txtInsertCity.Text = "";
                txtInsertState.Text = "";
                txtInsertZip.Text = "";
                txtInsertOpenHouse.Text = "";
            }
        }
    }
}