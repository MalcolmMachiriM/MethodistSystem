<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="member-details.aspx.cs" Inherits="MethodistSubscription.Admin.member_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content" class="">
    <section class="wrapper">

        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <header class="panel-heading">
                        Project Members
                    </header>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" runat="server">
                                <div class="row">
                                    <asp:HiddenField ID="txtid" runat="server" />
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtFirstName"> Name</label>
                                            <asp:TextBox ID="txtName" runat="server" ReadOnly="true" class="form-control" Style="color: black; font-weight: bold;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtLastName">Surname</label>
                                            <asp:TextBox ID="txtSurname" runat="server" ReadOnly="true" class="form-control" Style="color: black; font-weight: bold;"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtEmail">Email Address</label>
                                            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true" class="form-control" Style="color: black; font-weight: bold;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtEmail">Mobile Number</label>
                                            <asp:TextBox ID="txtMobile" runat="server" ReadOnly="true" class="form-control" Style="color: black; font-weight: bold;"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <%--<div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtEmail">Team Members</label>
                                            <asp:DropDownList ID="drpTeamMember" CssClass="form-control dropdown" runat="server" Style="color: black; font-weight: bold;"></asp:DropDownList>
                                        </div>
                                    </div>

                                </div>--%>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="btnSave" runat="server" Text="Add Member" class="btn btn-success" OnClick="btnSave_Click" />
                                    </div>
                                </div>

                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Subscriptions
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="12">
                                            <asp:GridView ID="grdSubs" ClientIDMode="Static" Width="100%" runat="server"
                                                AutoGenerateColumns="False" AutoGenerateSelectButton="false"
                                                DataKeyNames="ID" OnPageIndexChanging="grdSubs_PageIndexChanging"
                                                CssClass="table table-condensed" GridLines="None" role="grid" aria-describedby="DataTables_Table_0_info"
                                                Style="border-collapse: collapse !important"
                                                AllowPaging="true" AllowSorting="True" OnRowCommand="grdSubs_RowCommand">
                                                <Columns>

                                                    <asp:BoundField DataField="ID" HeaderText="ID"></asp:BoundField>
                                                    <asp:BoundField DataField="UserId" HeaderText="User"></asp:BoundField>
                                                    <asp:BoundField DataField="ModeID" HeaderText="Mode"></asp:BoundField>
                                                    <asp:BoundField DataField="TotalAmount" HeaderText="Amount"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Remove">
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="btnReject" runat="server" CssClass="btn btn-danger btn-icon btn-sm" CommandName="deleterecord" OnClientClick="return confirm('Are you sure want you want to remove member from project?');" CommandArgument='<%#Eval("ID")%>'>
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


                    </div>
                </section>

            </div>

        </div>


        <!-- page end-->
    </section>
</section>
</asp:Content>
