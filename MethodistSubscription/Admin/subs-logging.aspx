<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="subs-logging.aspx.cs" Inherits="MethodistSubscription.Admin.subs_logging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content" class="">
        <section class="wrapper">

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Add Subscription
                        </header>
                        <div class="panel-body">
                            <form runat="server">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtName">Name</label>
                                            <asp:TextBox ID="txtName" runat="server" ReadOnly="true" class="form-control" Style="color: black; font-weight: bold;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="txtMode">Mode of Payment</label>
                                            <asp:DropDownList ID="drpMode" CssClass="form-control dropdown" runat="server" Enabled="false" Style="color: black; font-weight: bold;"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="btnSave"></label>
                                        <asp:Button ID="btnSave" runat="server" Text="Save Details" class="btn btn-success" OnClick="btnSave_Click" />
                                        </div>
                                    </div>
                                </div>
                                <table style="width: 100%">

                                    <tr>
                                        <td colspan="12">
                                            <asp:GridView ID="grdSubs" ClientIDMode="Static" Width="100%" runat="server"
                                                AutoGenerateColumns="False" AutoGenerateSelectButton="false"
                                                DataKeyNames="UserID" OnPageIndexChanging="grdSubs_PageIndexChanging"
                                                CssClass="table table-condensed" GridLines="None" role="grid" aria-describedby="DataTables_Table_0_info"
                                                Style="border-collapse: collapse !important"
                                                AllowPaging="true" AllowSorting="True" OnRowCommand="grdSubs_RowCommand">
                                                <Columns>

                                                    <asp:BoundField DataField="UserId" HeaderText="ID" Visible="false"></asp:BoundField>
                                                    <asp:BoundField DataField="ModeId" HeaderText="First Name"></asp:BoundField>
                                                    <asp:BoundField DataField="Date" HeaderText="Date Added"></asp:BoundField>
                                                    <asp:BoundField DataField="TotalAmount" HeaderText="Amount"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Assign">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnAssign" runat="server" CssClass="btn btn-primary btn-icon btn-sm " CommandName="assignrecord" CommandArgument='<%#Eval("UserID")%>'>
                                                    <i class="fa fa-share-square-o"></i>
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Discard">
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="btnReject" runat="server" CssClass="btn btn-danger btn-icon btn-sm" CommandName="deleterecord" OnClientClick="return confirm('Are you sure want you want to delete project?');" CommandArgument='<%#Eval("UserID")%>'>
                                                    <i class="fa fa-archive"></i>
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </td>

                                    </tr>

                                </table>
                            </form>


                        </div>
                    </section>

                </div>

            </div>

        </section>
    </section>

</asp:Content>
