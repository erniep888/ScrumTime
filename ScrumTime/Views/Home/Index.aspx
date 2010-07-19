<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Authenticating.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--Left News--%>
    <div style="width:456px;height:300px;border: 2px solid #aaa; position:relative;float:left;">
        <div style="width:100%;height:25px;background-color:#93A8C8;border-bottom: 2px solid #999">
            <div style="margin-left: 19px; font-size: 15px;color:#fff; padding-top:2px; font-weight:bold">News</div>
        </div>
        <div style="text-align:left;padding:0;margin:0">
            <div style="padding:0;margin:0">
                <img style="position:relative;float:left;margin-top:5px;margin-left:5px;" src="/Content/Images/news_paper.gif" alt="News"/>
                <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;color:#999;margin-top:12px;margin-left:5px;">06-10-2010</p>
                <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:15px;">Version 0.6 Available</p>
                <p style="position:relative;float:right;margin:0;padding:0;margin-left:60px;">This is a simple PowerPoint presentation of the current features and when they were implemented.</p>
            </div>           
        </div>
    </div>

    <%--Right Release Schedule--%>
    <div style="width:456px;height:300px;border: 2px solid #aaa;position:relative; float:right;">
        <div style="width:100%;height:25px;background-color:#93A8C8;border-bottom: 2px solid #999">
            <div style="margin-left: 19px; font-size: 15px;color:#fff; padding-top:2px; font-weight:bold">Release Schedule</div>
        </div>
        <div style="overflow-y: scroll;overflow-x:hidden;height:273px;">
            <div style="text-align:left;padding:0;margin:0;position:relative;float:left;width:450px">
                <div style="padding:0;margin:0">
                    <img style="position:relative;float:left;margin-top:5px;margin-left:2px;width:45px;height:45px;" src="/Content/Images/disk.png" alt="Release"/>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;width:130px;">Release 0.7</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#f84;font-size:12px;width:104px;text-align:center;">To Be Released</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#999;text-align:right;">07-30-2010</p>
                    <p style="position:absolute;margin:0;padding:0;top:40px;left:60px"><a href="#">Information</a></p>
                </div>           
            </div>
            <div style="text-align:left;padding:0;margin:0;position:relative;float:left;margin-top:16px;width:450px"">
                <div style="padding:0;margin:0">
                    <img style="position:relative;float:left;margin-top:5px;margin-left:2px;width:45px;height:45px;" src="/Content/Images/disk.png" alt="Release"/>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;width:130px">Release 0.6</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#4c4;font-size:12px;width:104px;text-align:center;">Stable</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#999;text-align:right;">06-20-2010</p>
                    <p style="position:absolute;margin:0;padding:0;top:40px;left:60px"><a href="#">Information</a></p>
                </div>           
            </div>
            <div style="text-align:left;padding:0;margin:0;position:relative;float:left;margin-top:16px;width:450px"">
                <div style="padding:0;margin:0">
                    <img style="position:relative;float:left;margin-top:5px;margin-left:2px;width:45px;height:45px;" src="/Content/Images/disk.png" alt="Release"/>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;width:130px">Release 0.6 Beta1</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#c44;font-size:12px;width:104px;text-align:center;">Unsupported</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#999;text-align:right;">04-24-2009</p>
                    <p style="position:absolute;margin:0;padding:0;top:40px;left:60px"><a href="#">Information</a></p>
                </div>           
            </div>
            <div style="text-align:left;padding:0;margin:0;position:relative;float:left;margin-top:16px;width:450px"">
                <div style="padding:0;margin:0">
                    <img style="position:relative;float:left;margin-top:5px;margin-left:2px;width:45px;height:45px;" src="/Content/Images/disk.png" alt="Release"/>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;width:130px">Release 0.5</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#c44;font-size:12px;width:104px;text-align:center;">Non-public</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#999;text-align:right;">03-03-2009</p>
                    <p style="position:absolute;margin:0;padding:0;top:40px;left:60px"><a href="#">Information</a></p>
                </div>           
            </div>
            <div style="text-align:left;padding:0;margin:0;position:relative;float:left;margin-top:16px;width:450px"">
                <div style="padding:0;margin:0">
                    <img style="position:relative;float:left;margin-top:5px;margin-left:2px;width:45px;height:45px;" src="/Content/Images/disk.png" alt="Release"/>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;width:130px">Release 0.4</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#c44;font-size:12px;width:104px;text-align:center;">Non-public</p>
                    <p style="position:relative;float:left;margin:0;padding:0;font-weight:bold;margin-top:12px;margin-left:12px;color:#999;text-align:right;">01-03-2009</p>
                    <p style="position:absolute;margin:0;padding:0;top:40px;left:60px"><a href="#">Information</a></p>
                </div>           
            </div>
        </div>        
    </div>

     <%--Bottom Documentation--%>
    <div style="width:960px;height:160px;border: 2px solid #aaa;position:relative; float:left;margin-top:26px;">
        <div style="width:100%;height:25px;background-color:#93A8C8;border-bottom: 2px solid #999">
            <div style="margin-left: 19px; font-size: 15px;color:#fff; padding-top:2px; font-weight:bold">Documentation</div>
        </div>
        <div style="text-align:left;padding:0;margin:0">
            <div style="padding:0;margin:0">
                <img style="position:absolute;left:10px; top:70px;" src="/Content/Images/news_paper.gif" alt="News"/>
                <p style="position:absolute;left:70px;top:80px;width:100px;margin:0;padding:0;font-weight:bold;color:#999;">06-10-2010</p>
                <p style="position:absolute;left:170px;top:80px;width:300px;margin:0;padding:0;font-weight:bold">Version 0.6 Available</p>
                <p style="position:absolute;left:70px;top:108px;width:400px;margin:0;padding:0;">This is a simple PowerPoint presentation of the current features and when they were implemented.</p>
            </div>           
        </div>
    </div>
</asp:Content>
