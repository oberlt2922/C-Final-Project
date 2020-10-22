<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
            SelectCommand="SELECT DISTINCT [County] FROM [Properties]"></asp:SqlDataSource>
    </div>
    <br />
    <br />


    <div class="form-group">
        <div class="col-xs-12">
            <p><asp:Label ID="lblError" runat="server"  
                CssClass="text-danger" EnableViewState="false"></asp:Label></p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following errors:" CssClass="text-danger"
                 ValidationGroup="insert" DisplayMode="BulletList"/>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                HeaderText="Please correct the following errors:" CssClass="text-danger"
                 ValidationGroup="update" DisplayMode="BulletList"/>
        </div>
    </div>



    <div class="form-group">
        <div class="col-sm-12" style="overflow-x:auto;width:75%">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true"
                AutoGenerateColumns="false" DataKeyNames="Id" DataSourceID="SqlDataSource2"
                CssClass="table table-bordered" OnRowDeleted="GridView1_RowDeleted" 
                OnRowUpdated="GridView1_RowUpdated">
                <Columns>
                    <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ButtonType="Button"
                        ShowHeader="true" HeaderText="Update" CausesValidation="true" ValidationGroup="update" />
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ShowHeader="true"
                        HeaderText="Delete" CausesValidation="false" />
                    <asp:BoundField DataField="Id" ReadOnly="true" HeaderText="Id" SortExpression="Id" />
                    <asp:TemplateField HeaderText="County" SortExpression="County">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("County") %>' ID="lblCounty"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtCounty" Text='<%# Bind("County") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="County is required." Text="*" ControlToValidate="txtCounty"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Price") %>' ID="lblPrice"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtPrice" Text='<%# Bind("Price") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="Price is Required" Text="*" ControlToValidate="txtPrice"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bed" SortExpression="Bed">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Bed") %>' ID="lblBed"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtBed" Text='<%# Bind("Bed") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="Bed is Required" Text="*" ControlToValidate="txtBed"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bath" SortExpression="Bath">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Bath") %>' ID="lblBath"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtBath" Text='<%# Bind("Bath") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Bath is Required" Text="*" ControlToValidate="txtBath"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Square Feet" SortExpression="SquareFeet">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("SquareFeet") %>' ID="lblSqft"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtSqft" Text='<%# Bind("SquareFeet") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="Square feet is Required" Text="*" ControlToValidate="txtSqft"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Address") %>' ID="lblAddress"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtAddress" Text='<%# Bind("Address") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Address is Required" Text="*" ControlToValidate="txtPrice"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City" SortExpression="City">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("City") %>' ID="lblCity"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtCity" Text='<%# Bind("City") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ErrorMessage="City is Required" Text="*" ControlToValidate="txtCity"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State" SortExpression="State">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("State") %>' ID="lblState"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtState" Text='<%# Bind("State") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="State is Required" Text="*" ControlToValidate="txtState"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zip" SortExpression="Zip">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Zip") %>' ID="lblZip"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtZip" Text='<%# Bind("Zip") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage="Zip is Required" Text="*" ControlToValidate="txtZip"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Next open house" SortExpression="NextOpenHouse">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("NextOpenHouse") %>' ID="lblOpenHouse"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtOpenHouse" Text='<%# Bind("NextOpenHouse") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage="Next open house is Required" Text="*" ControlToValidate="txtOpenHouse"
                                CssClass="text-danger" ValidationGroup="update"></asp:RequiredFieldValidator>  
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Pic1" ReadOnly="true" HeaderText="Pic1" SortExpression="Pic1" />
                    <asp:BoundField DataField="Pic2" ReadOnly="true" HeaderText="Pic2" SortExpression="Pic2" />
                    <asp:BoundField DataField="Pic3" ReadOnly="true" HeaderText="Pic3" SortExpression="Pic3" />
                    <asp:BoundField DataField="Pic4" ReadOnly="true" HeaderText="Pic4" SortExpression="Pic4" />
                    <asp:BoundField DataField="Pic5" ReadOnly="true" HeaderText="Pic5" SortExpression="Pic5" />
                    <asp:BoundField DataField="Pic6" ReadOnly="true" HeaderText="Pic6" SortExpression="Pic6" />
                    <asp:BoundField DataField="Pic7" ReadOnly="true" HeaderText="Pic7" SortExpression="Pic7" />
                    <asp:BoundField DataField="Pic8" ReadOnly="true" HeaderText="Pic8" SortExpression="Pic8" />
                    <asp:BoundField DataField="Pic9" ReadOnly="true" HeaderText="Pic9" SortExpression="Pic9" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <br />
    <br />



    <label><b>Insert row</b></label><br />
    <div class="form-group">
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>County: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertCounty" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ErrorMessage="County is required." Text="*" ControlToValidate="txtInsertCounty"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Price: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertPrice" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ErrorMessage="Price is required" Text="*" ControlToValidate="txtInsertPrice"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ErrorMessage="Price must be a number" Text="*" ControlToValidate="txtInsertPrice"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert" Type="Double" 
                Operator="DataTypeCheck"></asp:CompareValidator>
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Bed: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertBed" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ErrorMessage="Bed field is required" Text="*" ControlToValidate="txtInsertBed"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ErrorMessage="Bed must be a number" Text="*" ControlToValidate="txtInsertBed"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert" Type="Integer"
                Operator="DataTypeCheck"></asp:CompareValidator>     
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Bath: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertBath" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                ErrorMessage="Bath field is required" Text="*" ControlToValidate="txtInsertBath"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                ErrorMessage="Bath must be a number" Text="*" ControlToValidate="txtInsertBath"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert" Type="Double"
                Operator="DataTypeCheck"></asp:CompareValidator>     
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Square feet: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertSqft" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ErrorMessage="Square feet field is required" Text="*" ControlToValidate="txtInsertSqft"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                ErrorMessage="Square feet must be a number" Text="*" ControlToValidate="txtInsertSqft"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert" Type="integer"
                Operator="DataTypeCheck"></asp:CompareValidator>     
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Address: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertAddress" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ErrorMessage="Address field is required" Text="*" ControlToValidate="txtInsertAddress"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>     
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>City: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertCity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                ErrorMessage="City field is required." Text="*" ControlToValidate="txtInsertCity"
                 CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>State: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertState" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                ErrorMessage="State field is required" Text="*" ControlToValidate="txtInsertCity"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="State must be two letter abbreviation." Text="*"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"
                ControlToValidate="txtInsertState" ValidationExpression="^(?i:A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$"></asp:RegularExpressionValidator>
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Zip: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertZip" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                ErrorMessage="Zip field is required" Text="*" ControlToValidate="txtInsertZip"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Zip field must be valid zip code" Text="*" CssClass="text-danger"
                Display="Dynamic" ValidationGroup="insert" ControlToValidate="txtInsertZip" 
                ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>   
        </div>
        <div class="col-sm-1"></div>
    </div>
    <div class="form-group">
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Next open house: </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:TextBox ID="txtInsertOpenHouse" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                ErrorMessage="Open house field is required" Text="*" ControlToValidate="txtInsertOpenHouse"
                CssClass="text-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
        </div>
        <div class="col-sm-1"></div>
        <div class="col-sm-1" style="padding-right:5px">
            <label><b>Add file(s): </b></label>
        </div>
        <div class="col-sm-2" style="padding-right:5px">
            <asp:FileUpload ID="filePics" runat="server" AllowMultiple="true"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ErrorMessage="Uploaded files can only be .jpg, .png, or .gif files"
                 Text="*" ControlToValidate="filePics" CssClass="text-danger" Display="Dynamic"
                 ValidationGroup="insert" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.jpeg)$"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-1" style="padding-right:5px">
            <asp:Button ID="btnAdd" runat="server" Text="Add" CausesValidation="true"
                CssClass="btn-primary" ValidationGroup="insert" OnClick="btnAdd_Click" OnCommand="btnAdd_Command" />
        </div>
    </div>




    <!--Data Source-->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
        SelectCommand="SELECT * FROM [Properties]" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Properties] WHERE [Id] = @original_Id AND [County] = @original_County AND [Price] = @original_Price AND [Bed] = @original_Bed AND [Bath] = @original_Bath AND [SquareFeet] = @original_SquareFeet AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND [NextOpenHouse] = @original_NextOpenHouse AND (([Pic1] = @original_Pic1) OR ([Pic1] IS NULL AND @original_Pic1 IS NULL)) AND (([Pic2] = @original_Pic2) OR ([Pic2] IS NULL AND @original_Pic2 IS NULL)) AND (([Pic3] = @original_Pic3) OR ([Pic3] IS NULL AND @original_Pic3 IS NULL)) AND (([Pic4] = @original_Pic4) OR ([Pic4] IS NULL AND @original_Pic4 IS NULL)) AND (([Pic5] = @original_Pic5) OR ([Pic5] IS NULL AND @original_Pic5 IS NULL)) AND (([Pic6] = @original_Pic6) OR ([Pic6] IS NULL AND @original_Pic6 IS NULL)) AND (([Pic7] = @original_Pic7) OR ([Pic7] IS NULL AND @original_Pic7 IS NULL)) AND (([Pic8] = @original_Pic8) OR ([Pic8] IS NULL AND @original_Pic8 IS NULL)) AND (([Pic9] = @original_Pic9) OR ([Pic9] IS NULL AND @original_Pic9 IS NULL))" 
        InsertCommand="INSERT INTO [Properties] ([County], [Price], [Bed], [Bath], [SquareFeet], [Address], [City], [State], [Zip], [NextOpenHouse], [Pic1], [Pic2], [Pic3], [Pic4], [Pic5], [Pic6], [Pic7], [Pic8], [Pic9]) VALUES (@County, @Price, @Bed, @Bath, @SquareFeet, @Address, @City, @State, @Zip, @NextOpenHouse, @Pic1, @Pic2, @Pic3, @Pic4, @Pic5, @Pic6, @Pic7, @Pic8, @Pic9)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [Properties] SET [County] = @County, [Price] = @Price, [Bed] = @Bed, [Bath] = @Bath, [SquareFeet] = @SquareFeet, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [NextOpenHouse] = @NextOpenHouse WHERE [Id] = @original_Id AND [County] = @original_County AND [Price] = @original_Price AND [Bed] = @original_Bed AND [Bath] = @original_Bath AND [SquareFeet] = @original_SquareFeet AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND [NextOpenHouse] = @original_NextOpenHouse">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_County" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Price" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Bed" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="original_Bath" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_SquareFeet" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Zip" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_NextOpenHouse" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic1" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic2" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic3" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic4" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic5" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic6" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic7" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic8" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic9" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="County" Type="String"></asp:Parameter>
            <asp:Parameter Name="Price" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Bed" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="Bath" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="SquareFeet" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="Zip" Type="String"></asp:Parameter>
            <asp:Parameter Name="NextOpenHouse" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic1" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic2" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic3" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic4" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic5" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic6" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic7" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic8" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic9" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="County" Type="String"></asp:Parameter>
            <asp:Parameter Name="Price" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Bed" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="Bath" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="SquareFeet" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="Zip" Type="String"></asp:Parameter>
            <asp:Parameter Name="NextOpenHouse" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic1" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic2" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic3" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic4" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic5" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic6" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic7" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic8" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pic9" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_County" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Price" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Bed" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="original_Bath" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_SquareFeet" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Zip" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_NextOpenHouse" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic1" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic2" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic3" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic4" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic5" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic6" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic7" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic8" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Pic9" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--End data source-->


</asp:Content>