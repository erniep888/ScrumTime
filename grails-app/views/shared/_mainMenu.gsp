<g:javascript>
    var showMenuItemAsClickable = function(element, arrowImageId) {
        element.style.textDecoration = "underline";
        $(arrowImageId).show();
    }
    var hideMenuItemAsClickable = function(element, arrowImageId) {
        element.style.textDecoration = "none";
        $(arrowImageId).hide();
    }


    var scrumMenuIsVisible = false;
    var toggleScrumMenu = function() {
        scrumMenuIsVisible = !scrumMenuIsVisible;
        if (scrumMenuIsVisible) {
            hideOtherMenus($('scrumMenu'));
            $('scrumMenu').show();
        } else {
            $('scrumMenu').hide();
        }
    }

    var backlogMenuIsVisible = false;
    var toggleBacklogMenu = function() {
        backlogMenuIsVisible = !backlogMenuIsVisible;
        if (backlogMenuIsVisible) {
            hideOtherMenus($('backlogMenu'));
            $('backlogMenu').show();
        } else {
            $('backlogMenu').hide();
        }
    }

    var toolsMenuIsVisible = false;
    var toggleToolsMenu = function() {
        toolsMenuIsVisible = !toolsMenuIsVisible;
        if (toolsMenuIsVisible) {
            hideOtherMenus($('toolsMenu'));
            $('toolsMenu').show();
        } else {
            $('toolsMenu').hide();
        }
    }

    var hideOtherMenus = function(currentElement) {
        if (currentElement != $('scrumMenu') && $('scrumMenu').visible())
            toggleScrumMenu();
        if (currentElement != $('backlogMenu') && $('backlogMenu').visible())
            toggleBacklogMenu();
        if (currentElement != $('toolsMenu') && $('toolsMenu').visible())
            toggleToolsMenu();
    }
</g:javascript>

<g:if test="${!breadCrumbTrail}">
    <g:set var="breadCrumbTrail" value="Home"/>
</g:if>
<systemuser:ifIsLoggedIn>
    <div style="width:100%;border-top:#d3dfe7 dotted 1px;border-bottom:#d3dfe7 dotted 1px;margin-bottom:8px;">
        <center>
            <table style="font-size:10px;">
                <tr>
                    <td>Product:</td>
                    <td><g:select name="currentProduct" value="1"
                             from="${products}" optionKey="id" optionValue="name" style="font-size:11px;"/></td>
                    <td style="width:100px;"></td>
                    <td>Release:</td>
                    <td><g:select name="currentRelease" value="1"
                             from="${releases}" optionKey="id" optionValue="name" style="font-size:11px;"/></td>
                    <td style="width:100px;"></td>
                    <td>Sprint:</td>
                    <td><g:select name="currentSprint" value="1"
                             from="${sprints}" optionKey="id" optionValue="name" style="font-size:11px;"/></td>
                </tr>
            </table>
        </center>
    </div>
</systemuser:ifIsLoggedIn>
<div id="mainMenuDiv">
    <ul id="mainMenuUl">
        <systemuser:ifNotLoggedIn>
            <li><a href="${createLinkTo(file: 'index.gsp')}">Home</a></li>
        </systemuser:ifNotLoggedIn>
        <systemuser:ifIsLoggedIn>
            <li><g:link controller="status" action="index">Status</g:link></li>
            %{--<li onclick="toggleScrumMenu();"><span onmouseover="showMenuItemAsClickable(this, 'scrumDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'scrumDropArrow');">Scrum</span><img id="scrumDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>--}%
            <li onclick="toggleBacklogMenu();"><span onmouseover="showMenuItemAsClickable(this, 'backlogDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'backlogDropArrow');">Backlog</span><img id="backlogDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>
            %{--<li onclick="toggleToolsMenu();"><span onmouseover="showMenuItemAsClickable(this, 'toolsDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'toolsDropArrow');">Tools</span><img id="toolsDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>--}%
        </systemuser:ifIsLoggedIn>
    </ul>
</div>

<div id="scrumMenu" style="display:none;" class="dropDownMenu"><g:render template="/shared/menus/scrumMenu"/></div>
<div id="backlogMenu" style="display:none;" class="dropDownMenu"><g:render template="/shared/menus/backlogMenu"/></div>
<div id="toolsMenu" style="display:none;" class="dropDownMenu"><g:render template="/shared/menus/toolsMenu"/></div>
<div id="breadCrumbTrail"><span>> ${breadCrumbTrail}</span></div>




