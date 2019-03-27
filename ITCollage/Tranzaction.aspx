<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tranzaction.aspx.cs" Inherits="ITCollage.Tranzaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="LName" DataValueField="Id"></asp:DropDownList>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITCollage %>" SelectCommand="SELECT [Id], [LName] FROM [Students]"></asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Start transaction" />
                <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
            </td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="IdStudent" HeaderText="IdStudent" SortExpression="IdStudent" />
                        <asp:BoundField DataField="PayDate" HeaderText="PayDate" SortExpression="PayDate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ITCollage %>" SelectCommand="SELECT * FROM [PaymentsDate]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="IdStudent" HeaderText="IdStudent" SortExpression="IdStudent" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ITCollage %>" SelectCommand="SELECT * FROM [Payments]"></asp:SqlDataSource>
            </td>
        </tr>
       
    </table>
</asp:Content>
