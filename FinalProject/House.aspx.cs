using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;

namespace FinalProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {


        //global variables
        object[] rowArray;//object array for row values
        string[] imgArray;//array for images
        int currentImg;
        int picCount;



        //page load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                currentImg = 0;
                picCount = 0;
                Session["currentImg"] = currentImg;
            }
            //set up connection string and query string
            string imgId = (string)Session["imgId"];
            string sql = "SELECT * FROM Properties WHERE Pic1 = '" + imgId + "'";
            SqlConnection sqlConnection1 = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\RealEstateDB.mdf;Integrated Security=True");//connection string
            SqlCommand cmd = new SqlCommand(sql, sqlConnection1);
            sqlConnection1.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                //slide show
                int size = reader.FieldCount;
                rowArray = new object[size];
                //first 11 fields are not pics
                //id, county, price, bed, bath, squareFeet, Address, City, State, Zip, openHouse
                for (int i = 0; i < size; i++)
                {
                    rowArray[i] = reader[i];
                }
                for (int i = 11; i < size; i++)
                {
                    if (!Convert.IsDBNull(rowArray[i]))
                         picCount++;
                }
                //IF HOUSE HAS LESS THAN 9 IMAGES PREVIOUS AND NEXT BUTTON DOES NOT LOOP
                //CHECK TO SEE PIC COUNT IS MORE THAN THE AMOUNT OF ACTUAL PICS
                imgArray = new string[picCount];
                for (int i = 0, y = 11; i < picCount; i++, y++)
                {
                    if(!Convert.IsDBNull(rowArray[y]))
                        imgArray[i] = (string)rowArray[y];
                }
                Image1.ImageUrl = "~/Images/" + imgArray[currentImg];
                //end slide show



                //create and fill price
                HtmlGenericControl price = new HtmlGenericControl("LABEL");
                price.InnerHtml = string.Format(" {0:C}", rowArray[2]) + "</br></br>";
                ContentArea.Controls.Add(price);


                //create and fill square feet
                HtmlGenericControl sqft = new HtmlGenericControl("LABEL");
                sqft.InnerHtml = rowArray[5] + " square feet</br></br>";
                ContentArea.Controls.Add(sqft);


                //create and fill bed
                HtmlGenericControl bed = new HtmlGenericControl("LABEL");
                bed.InnerHtml = rowArray[3] + " bedrooms</br></br>";
                ContentArea.Controls.Add(bed);


                //create and fill bath
                HtmlGenericControl bath = new HtmlGenericControl("LABEL");
                bath.InnerHtml = rowArray[4] + " bathrooms</br></br>";
                ContentArea.Controls.Add(bath);


                //create address
                HtmlGenericControl address = new HtmlGenericControl("LABEL");
                address.InnerHtml = rowArray[6] + "</br>";
                ContentArea.Controls.Add(address);


                //city state zip
                HtmlGenericControl city = new HtmlGenericControl("LABEL");
                city.InnerHtml = rowArray[7] + ", " + rowArray[8] + " " + rowArray[9] + "</br></br>";
                ContentArea.Controls.Add(city);


                //next open house
                HtmlGenericControl openHouse = new HtmlGenericControl("LABEL");
                openHouse.InnerHtml = "Next open house is " + rowArray[10];
                ContentArea.Controls.Add(openHouse);


            }
                reader.Close();
                sqlConnection1.Close(); 
            


        }// end page load



        //click event
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            currentImg = (int)Session["currentImg"];
            if (btn.ID == "btnNext")
            {
                if (currentImg == picCount - 1)
                    currentImg = 0;
                else
                    currentImg++;
            }
            else
            {
                if (currentImg == 0)
                    currentImg = picCount - 1;
                else
                    currentImg--;
            }
            if (imgArray[currentImg] != null)
            {
                Image1.ImageUrl = "~/Images/" + imgArray[currentImg];
                Session["currentImg"] = currentImg;
            }
        }//end click event
    }
}