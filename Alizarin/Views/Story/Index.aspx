<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ScrumTime.Models.Story>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                StoryId
            </th>
            <th>
                Narrative
            </th>
            <th>
                Points
            </th>
            <th>
                UserDefinedId
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.StoryId }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.StoryId })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.StoryId })%>
            </td>
            <td>
                <%: item.StoryId %>
            </td>
            <td>
                <%: item.Narrative %>
            </td>
            <td>
                <%: item.Points %>
            </td>
            <td>
                <%: item.UserDefinedId %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

