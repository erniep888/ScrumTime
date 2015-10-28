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

    var currentMenuIsVisible = false;
    var toggleCurrentMenu = function() {
        currentMenuIsVisible = !currentMenuIsVisible;
        if (currentMenuIsVisible) {
            hideOtherMenus($('currentMenu'));
            $('currentMenu').show();
        } else {
            $('currentMenu').hide();
        }
    }

    var managementMenuIsVisible = false;
    var toggleManagementMenu = function() {
        managementMenuIsVisible = !managementMenuIsVisible;
        if (managementMenuIsVisible) {
            hideOtherMenus($('managementMenu'));
            $('managementMenu').show();
        } else {
            $('managementMenu').hide();
        }
    }

    var profileMenuIsVisible = false;
    var toggleProfileMenu = function() {
        profileMenuIsVisible = !profileMenuIsVisible;
        if (profileMenuIsVisible) {
            hideOtherMenus($('profileMenu'));
            $('profileMenu').show();
        } else {
            $('profileMenu').hide();
        }
    }

    var hideOtherMenus = function(currentElement) {
        if (currentElement != $('scrumMenu') && $('scrumMenu').visible())
            toggleScrumMenu();
        if (currentElement != $('backlogMenu') && $('backlogMenu').visible())
            toggleBacklogMenu();
        if (currentElement != $('currentMenu') && $('currentMenu').visible())
            toggleCurrentMenu();
        if (currentElement != $('managementMenu') && $('managementMenu').visible())
            toggleManagementMenu();
        if (currentElement != $('profileMenu') && $('profileMenu').visible())
            toggleProfileMenu();

    }
</g:javascript>

<g:if test="${!breadCrumbTrail}">
    <g:set var="breadCrumbTrail" value="Home"/>
</g:if>

<div id="mainMenuDiv">
    <ul id="mainMenuUl">
        <li><a href="${createLinkTo(file: 'index.gsp')}">Home</a></li>
        <systemuser:ifIsLoggedIn>
            <li onclick="toggleScrumMenu();"><span onmouseover="showMenuItemAsClickable(this, 'scrumDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'scrumDropArrow');">Scrum</span><img id="scrumDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>
            <li onclick="toggleBacklogMenu();"><span onmouseover="showMenuItemAsClickable(this, 'backlogDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'backlogDropArrow');">Backlog</span><img id="backlogDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>
            <li onclick="toggleCurrentMenu();"><span onmouseover="showMenuItemAsClickable(this, 'currentDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'currentDropArrow');">Current</span><img id="currentDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>
            <li onclick="toggleManagementMenu();"><span onmouseover="showMenuItemAsClickable(this, 'managementDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'managementDropArrow');">Management</span><img id="managementDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>
            <li onclick="toggleProfileMenu();"><span onmouseover="showMenuItemAsClickable(this, 'profileDropArrow');" onmouseout="hideMenuItemAsClickable(this, 'profileDropArrow');">Profile</span><img id="profileDropArrow" style="display:none;" src="${createLinkTo(dir: 'images/menu', file: 'downarrow.gif')}" alt="Arrow"/></li>
        </systemuser:ifIsLoggedIn>
    </ul>
</div>

<div id="scrumMenu" style="display:none;" class="dropDownMenu"><g:render template="/org/scrumtime/web/views/shared/menus/scrumMenu"/></div>
<div id="backlogMenu" style="display:none;" class="dropDownMenu"><g:render template="/org/scrumtime/web/views/shared/menus/backlogMenu"/></div>
<div id="currentMenu" style="display:none;" class="dropDownMenu"><g:render template="/org/scrumtime/web/views/shared/menus/currentMenu"/></div>
<div id="managementMenu" style="display:none;" class="dropDownMenu"><g:render template="/org/scrumtime/web/views/shared/menus/managementMenu"/></div>
<div id="profileMenu" style="display:none;" class="dropDownMenu"><g:render template="/org/scrumtime/web/views/shared/menus/profileMenu"/></div>
<div id="breadCrumbTrail"><span>> ${breadCrumbTrail}</span></div>




