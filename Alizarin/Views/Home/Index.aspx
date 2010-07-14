<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="IndexTitle" ContentPlaceHolderID="TitleContent" runat="server">
	Alizarin
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/Home/HomeAjax.js") %>" type="text/javascript"></script>  
    <script type="text/javascript">
        loadJSON();
        setClickEvent_Narrative(2);
    </script>    
    <style type="text/css">
        td {padding-top:4px;padding-bottom:4px}
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="background-color:#E32636">Alizarin</h2>

    <input type="text" id="url" />
    <button id="load" type="button">Load</button>
    <%--<div id="output" 
        style="position:absolute;left:10px;top:116px; height:234px; width:633px; background-color:#E32636"></div>--%>

    <div>
        <div id="Div3" style="height:30px;width:724px;margin-top:20px;background-color:#aaa;
            font-family:Verdana;font-size:12px;padding-top:6px">
            <div style="position:absolute;left:26px;font-size:14px;font-weight:bold">Stories</div>
            <div style="position:absolute;left:90px;width:70px;color:#00a;margin-top:2px">( New )</div>
        </div>
        <div style="width:720px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;">
            <table style="width:720px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">
                <thead style="height:30px;width:100%; margin-left:6px;
                        background-color:#4682b4;font-size:14px;color:#eee;" >
                    <tr>
                        <th style="text-align:center;width:80px;">Priority</th>
                        <th style="text-align:center;width:80px;">ID</th>
                        <th style="width:286px">Narrative</th>
                        <th style="text-align:center;width:80px">Points</th>
                        <th style="text-align:center;width:194px">Actions</th>
                    </tr>
                </thead>
                <tbody style="font-size:12px;">
                    <tr style="background-color:#eee;">
                        <td class="story_1" style="vertical-align:middle;text-align:center;width:80px;">1</td>
                        <td style="vertical-align:middle;text-align:center;width:80px;">10</td>
                        <td class="story_1">As the author, I want to see the text in multiple fonts.</td>
                        <td class="story_1" style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">Delete | <span id="task_1">Tasks</span></td>
                    </tr>
                    <tr>
                        <td class="story_2" style="vertical-align:middle;text-align:center;width:80px">2</td>
                        <td style="vertical-align:middle;text-align:center;width:80px">12</td>
                        <td class="story_2">As the author, I want to see the top of the table of contents prior to opening a full book. (* Please also take note of the fonts for the table of contents. *)</td>
                        <td class="story_2" style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">Delete | Tasks</td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>

    <div>
        <div id="Div2" style="height:30px;width:724px;margin-top:20px;background-color:#aaa;
            font-family:Verdana;font-size:12px;padding-top:6px">
            <div style="position:absolute;left:26px;font-size:14px;font-weight:bold">Stories</div>
            <div style="position:absolute;left:646px;width:70px;color:#00a">New Story</div>
        </div>
        <div style="width:720px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;">
            <table style="width:720px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">
                <thead style="height:30px;width:100%; margin-left:6px;
                        background-color:#47c;font-size:14px;color:White;" >
                    <tr>
                        <th style="text-align:center;width:80px;">ID</th>
                        <th>Narrative</th>
                        <th style="text-align:center;width:80px">Points</th>
                        <th style="text-align:center;width:194px">Actions</th>
                    </tr>
                </thead>
                <tbody style="font-size:12px;">
                    <tr style="background-color:#eee;">
                        <td style="vertical-align:middle;text-align:center;width:80px;">10</td>
                        <td>As the author, I want to see the text in multiple fonts.</td>
                        <td style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">
                            <div style="color:Red">
                                <div>Delete Story, are you sure?</div>
                                <div style="font-weight:bold;">Yes | No</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:middle;text-align:center;width:80px">12</td>
                        <td>As the author, I want to see the top of the table of contents prior to opening a full book. (* Please also take note of the fonts for the table of contents. *)</td>
                        <td style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">Delete | Tasks</td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>
  
   <div>
        <div id="Div6" style="height:30px;width:724px;margin-top:20px;background-color:#aaa;
            font-family:Verdana;font-size:12px;padding-top:6px">
            <div style="position:absolute;left:26px;font-size:14px;font-weight:bold">Stories</div>
            <div style="position:absolute;left:646px;width:70px;color:#00a">New Story</div>
        </div>
        <div style="width:720px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;">
            <table style="width:720px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">
                <thead style="height:30px;width:100%; margin-left:6px;
                        background-color:#47c;font-size:14px;color:White;" >
                    <tr>
                        <th style="text-align:center;width:80px;">ID</th>
                        <th>Narrative</th>
                        <th style="text-align:center;width:80px">Points</th>
                        <th style="text-align:center;width:194px">Actions</th>
                    </tr>
                </thead>
                <tbody style="font-size:12px;">
                    <tr style="background-color:#eee;">
                        <td style="vertical-align:middle;text-align:center;width:80px;">10</td>
                        <td>As the author, I want to see the text in multiple fonts.</td>
                        <td style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">Delete | Tasks</td>
                    </tr>
                    <tr>
                        <td style="vertical-align:middle;text-align:center;width:80px">12</td>
                        <td>As the author, I want to see the top of the table of contents prior to opening a full book. (* Please also take note of the fonts for the table of contents. *)</td>
                        <td style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">Delete | Tasks</td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>


    <div>
        <div id="Div1" style="height:30px;width:724px;margin-top:20px;background-color:#aaa;
            font-family:Verdana;font-size:12px;padding-top:6px">
            <div style="position:absolute;left:26px;font-size:14px;font-weight:bold">Stories</div>
            <div style="position:absolute;left:646px;width:70px;color:#00a">New Story</div>
        </div>
        <div style="width:720px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;">
            <table style="width:720px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">
                <thead style="height:30px;width:100%; margin-left:6px;
                        background-color:#47c;font-size:14px;color:White;" >
                    <tr>
                        <th style="text-align:center;width:80px;">ID</th>
                        <th>Narrative</th>
                        <th style="text-align:center;width:80px">Points</th>
                        <th style="text-align:center;width:194px">Actions</th>
                    </tr>
                </thead>
                <tbody style="font-size:12px;">
                    <tr style="background-color:#eee;padding-top:4px;padding-bottom:4px">
                        <td style="vertical-align:middle;text-align:center;width:80px;">10</td>
                        <td>As the author, I want to see the text in multiple fonts.</td>
                        <td style="vertical-align:middle;text-align:center;width:80px">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px">Delete | Tasks</td>
                    </tr>
                    <tr style="padding-top:4px;padding-bottom:4px">
                        <td style="vertical-align:middle;text-align:center;width:80px">12</td>
                        <td><textarea rows="3" style="width:100%;font-family:Verdana">As the author, I want to see the top of the table of contents prior to opening a full book. (* Please also take note of the fonts for the table of contents. *)</textarea></td>
                        <td style="vertical-align:middle;text-align:center;width:80px">
                            <select style="text-align:center;width:50px;font-family:Verdana">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="3">3</option>
                                <option value="5">5</option>
                                <option value="8" selected="selected">8</option>
                                <option value="100">100</option>
                            </select></td>
                        <td style="vertical-align:middle;text-align:center;width:194px;font-weight:bold;color:#444">Save | Cancel</td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>

</asp:Content>
