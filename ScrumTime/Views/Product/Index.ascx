<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductCollectionViewModel>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Product';
        //setupReadOnlyScrumRow(5);
    }); 
    </script>     

    <div style="margin-top:0px;margin-left:0px;">
        <div id="Div3" style="height:34px;width:960px;background-color:#fff;
            font-family:Verdana;font-size:12px;padding-top:6px;border-top:2px solid #999;border-left:2px solid #999;border-right:2px solid #999;">
            <div style="position:absolute;left:30px;width:115px;margin-top:10px">
                  <a href="#" id="scrumAddLink" class="simpleLink" onclick="addProductRow();">Add Product</a>
            </div>            
            <div style="position:absolute;left:450px;width:80px;margin-top:0px;color:#79a52c;font-weight:bold;
                letter-spacing:1px;font-size:13px;text-align:left;">Products</div>            
        </div>       
        <table style="width:964px;font-family:Verdana;padding:0;border:2px solid #999;height:30px;margin-left:0px;
            background-color:#f3f3f3;font-size:12px;color:#666;" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:210px;border:0px;background-color:#f3f3f3;">Name</th>
                <th style="text-align:left;width:514px;border:0px;background-color:#f3f3f3;">Description</th>  
                <th style="text-align:center;border:0px;background-color:#f3f3f3;">Actions</th>
                <th style="width:30px;border:0px;background-color:#f3f3f3;"></th>
            </tr>
        </table>
        <div id="productContentListId" style="width:960px;height:438px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;overflow:scroll;">
            <% Html.RenderPartial("~/Views/Product/List.ascx", Model); %>  
        </div>       
        
    </div>  
    
