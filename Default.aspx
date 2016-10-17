<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Products_Default" %>

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
            <br />
            <h1><i class="fa fa-cutlery"></i>View Products</h1>
            <hr />
            <br />
            <div class="col-lg-12">
                <table class="table table-hover">
                    <thead>
                        <th>#</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Is Featured?</th>
                        <th>Date Added</th>
                        <th>Date Modified</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvProducts" runat="server"
                            OnPagePropertiesChanging="lvProducts_PagePropertiesChanging"
                            OnDataBound="lvProducts_DataBound" >
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ProductID") %></td>
                                    <td><%# Eval("Name") %> (<%# Eval("Code") %>)</td>
                                    <td><%# Eval("Category") %></td>
                                    <td><%# Eval("Description") %></td>
                                    <td>
                                        <img runat="server" src='<%# string.Concat("~/img/products/", Eval("Image")) %>'
                                            class="img-responsive" width="100" />
                                    </td>
                                    <td><%# Eval("Price", "{0: #,###.00}") %></td>
                                    <td><%# Eval("IsFeatured") %></td>
                                    <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                    <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}") %></td>
                                    <td>
                                        <a href='Details.aspx?ID=<%# Eval("ProductID") %>'><i class="fa fa-search"></i></a>
                                        <a href='Delete.aspx?ID=<%# Eval("ProductID") %>' onclick='return confirm("Delete record?")'>
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="10">
                                        <h2 class="text-center">No records found.</h2>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>

                    <div class="col-lg-4">
                        <div class="input-group">
                            <span class="input-group-addon">Search By:</span>
                            <asp:DropDownList ID="ddlTypes" runat="server" class="form-control"
                                OnSelectedIndexChanged="ddlTypes_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>Keyword</asp:ListItem>
                                <asp:ListItem>Is Featured?</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="keyword" runat="server" class="col-lg-4" visible="true">
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Keyword..."
                                OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" />
                            <span class="input-group-addon"><i class="fa fa-serach"></i></span>
                        </div>
                    </div>
                    <div id="isfeatured" runat="server" class="col-lg-4" visible="false">
                        <asp:DropDownList ID="ddlIsFeatured" runat="server" class="form-control"
                            OnSelectedIndexChanged="ddlIsFeatured_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />

                </table>
                <center>
                    <asp:DataPager ID="dpProducts" runat="server" PagedControlID="lvProducts" PageSize="5">
                        <Fields>
                        <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn btn-success"
                            CurrentPageLabelCssClass="btn btn-default"
                            NextPreviousButtonCssClass="btn btn-default" />
                        </Fields>
                    </asp:DataPager>
                </center>
            </div>
        </div>
    </form>
</body>
</html>
