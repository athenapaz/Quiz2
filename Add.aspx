<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Products_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Products</title>
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <form runat="server" class="form-horizontal">
        <div class="container">
            <br /><h1><i class="fa fa-plus"></i> Add a Product</h1> <hr /><br />
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="control-label col-lg-4">Name</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtName" runat="server" class="form-control" MaxLength="50" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Category</label>
                    <div class="col-lg-8">
                        <asp:DropDownList ID="ddlCategories" runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Code</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtCode" runat="server" class="form-control" MaxLength="10" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Description</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine"
                            MaxLength="300" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Image</label>
                    <div class="col-lg-8">
                        <asp:FileUpload ID="fuImage" runat="server" class="form-control" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Price</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtPrice" runat="server" class="form-control" type="number"
                            min="0.01" max="500000.00" step="0.01" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Is Featured?</label>
                    <div class="col-lg-8">
                        <asp:DropDownList ID="ddlFeatured" runat="server" class="form-control">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label class="control-label col-lg-4">Critical Level</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtCritical" runat="server" class="form-control" type="number"
                            min="1" max="100" required />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Maximum</label>
                    <div class="col-lg-8">
                        <asp:TextBox ID="txtMax" runat="server" class="form-control" type="number"
                            min="1" max="1000" required />
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <span class="pull-right">
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
                </span>
            </div>
        </div>
    </form>

</body>
</html>
