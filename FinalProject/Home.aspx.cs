using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AjaxControlToolkit;
using System.Drawing;




namespace FinalProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlCounties.DataBind();
                ddlCounties.SelectedValue = "Burke";
            }
            
            string countyName = (string)ddlCounties.SelectedItem.Text;
            string sql;
            sql = "SELECT Price, Bed, Bath, SquareFeet, Address, City, State, Zip, Pic1, NextOpenHouse FROM Properties WHERE County = '" + countyName + "'";//query string
            SqlConnection sqlConnection1 = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\RealEstateDB.mdf;Integrated Security=True");//connection string
            SqlCommand cmd = new SqlCommand(sql, sqlConnection1);//sql command
            sqlConnection1.Open();
            SqlDataReader reader = cmd.ExecuteReader();//used to read through returned rows
            object[] rowArray = new object[10];//object array for row values
            int houseCount = 0;
            while(reader.Read())//read through all returned rows
            {
                rowArray[0] = reader[0];//Price
                rowArray[1] = reader[1];//bed
                rowArray[2] = reader[2];//bath
                rowArray[3] = reader[3];//sqft
                rowArray[4] = reader[4];//addr
                rowArray[5] = reader[5];//city
                rowArray[6] = reader[6];//state
                rowArray[7] = reader[7];//zip
                rowArray[8] = reader[8];//pic1
                rowArray[9] = reader[9];//next open house
                houseCount++;


                HtmlGenericControl createDiv = new HtmlGenericControl("DIV");//create div element
                createDiv.ID = "createDiv" + houseCount;
                createDiv.Attributes["runat"] = "server";
                createDiv.Attributes["class"] = "col-sm-3 createDiv";
                
                
                ImageButton img = new ImageButton();//create imageButton
                if (Convert.IsDBNull(rowArray[8]))
                    rowArray[8] = "no-image-available-icon.jpg";
                img.ID = (string)rowArray[8];
                img.Click += imgBtn_Click;
                img.ImageUrl = "~/Images/" + rowArray[8];
                //img.PostBackUrl = "House.aspx";
                img.Width = 248;
                img.Height = 248;
                createDiv.Controls.Add(img);
                
                
                Panel popUpPanel = new Panel();//hidden pop up panel
                popUpPanel.ID = "popUpPanel" + houseCount;
                popUpPanel.Attributes["runat"] = "server";
                popUpPanel.Attributes["style"] = "display:none";
                popUpPanel.BackColor = Color.PowderBlue;
                popUpPanel.BorderStyle = BorderStyle.Solid;
                popUpPanel.Width = 248;
                

                
                HoverMenuExtender hoverMenuExtender = new HoverMenuExtender();//hover menu
                hoverMenuExtender.ID = "hoverMenuExtender" + houseCount;
                hoverMenuExtender.TargetControlID = (string)rowArray[8];
                hoverMenuExtender.PopupControlID = "popUpPanel" + houseCount;
                hoverMenuExtender.PopupPosition = AjaxControlToolkit.HoverMenuPopupPosition.Top;
                                
                                

                HtmlGenericControl priceLbl = new HtmlGenericControl("LABEL");//create price label
                priceLbl.InnerHtml = "Price: " + string.Format("{0:C}", rowArray[0]) + "</br>";
                createDiv.Controls.Add(priceLbl);
                
                
                HtmlGenericControl sqft = new HtmlGenericControl("LABEL");// create sqft label
                sqft.InnerHtml = "Square feet: " + rowArray[3].ToString() + "</br>";
                createDiv.Controls.Add(sqft);
                
                
                HtmlGenericControl bed = new HtmlGenericControl("LABEL");//create bed label
                bed.InnerHtml = "Bed: " + rowArray[1].ToString() + "</br>";
                popUpPanel.Controls.Add(bed);
                
                
                HtmlGenericControl bath = new HtmlGenericControl("LABEL");//create bath label
                bath.InnerHtml = "Bath: " + rowArray[2].ToString() + "</br>";
                popUpPanel.Controls.Add(bath);
                
                
                HtmlGenericControl address = new HtmlGenericControl("LABEL");//address
                address.InnerHtml = rowArray[4].ToString() + ", ";
                popUpPanel.Controls.Add(address);
                
                
                HtmlGenericControl city = new HtmlGenericControl("LABEL");//city
                city.InnerHtml = rowArray[5].ToString();
                popUpPanel.Controls.Add(city);
                
                
                HtmlGenericControl state = new HtmlGenericControl("LABEL");//state
                state.InnerHtml = rowArray[6].ToString() + "</br>";
                popUpPanel.Controls.Add(state);
                
                
                HtmlGenericControl zip = new HtmlGenericControl("LABEL");//zip
                zip.InnerHtml = rowArray[7].ToString() + "</br></br>";
                popUpPanel.Controls.Add(zip);


                HtmlGenericControl openHouse = new HtmlGenericControl("LABEL");//open house
                openHouse.InnerHtml = "Next open house:</br>" + rowArray[9].ToString() + "</br></br>";
                popUpPanel.Controls.Add(openHouse);

                ContentArea.Controls.Add(hoverMenuExtender);
                ContentArea.Controls.Add(popUpPanel);
                ContentArea.Controls.Add(createDiv);//add div to panel on page
                
            }
            reader.Close();
            sqlConnection1.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        private void imgBtn_Click(object sender, EventArgs e)
        {
            ImageButton img = sender as ImageButton;
            Session["imgId"] = img.ID;
            Server.Transfer("House.aspx");
        }
    }
}