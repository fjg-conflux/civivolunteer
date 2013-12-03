{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.4                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2013                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}

{* Contains js templates for backbone-based volunteer assignment sub-application *}

<script type="text/template" id="crm-vol-assign-layout-tpl">
  <div id="crm-vol-assign-flexible-region"><div class="crm-loading-element">{ts}Loading{/ts}...</div></div>
  <div id="crm-vol-assign-scheduled-region"></div>
  <div class="crm-submit-buttons">
    <a class="button" id="crm-vol-define-done" href="#"><span>{ts}Done{/ts}</span></a>
  </div>
</script>

<script type="text/template" id="crm-vol-scheduled-assignment-tpl">
  <td class="crm-vol-name">
    <span class="icon crm-vol-drag"></span>
    <a target="_blank" href="<%= contactUrl(contact_id) %>"><%= display_name %></a>
    {literal}<%if (details){%><a href="#" class="icon crm-vol-info"> </a><%}%>{/literal}
    <div class="crm-vol-menu"><a class="crm-vol-menu-button" href="#" title="{ts}Actions{/ts}"><span></span></a></div>
  </td>
  <td><%= email %></td>
  <td><%= phone %></td>
</script>

<script type="text/template" id="crm-vol-flexible-assignment-tpl">
  <td class="crm-vol-name">
    <span class="icon crm-vol-drag"></span>
    <a target="_blank" href="<%= contactUrl(contact_id) %>"><%= display_name %></a>
    {literal}<%if (details){%><a href="#" class="icon crm-vol-info"> </a><%}%>{/literal}
    <div class="crm-vol-menu"><a class="crm-vol-menu-button" href="#" title="{ts}Actions{/ts}"><span></span></a></div>
  </td>
</script>

<script type="text/template" id="crm-vol-scheduled-tpl">
  <h3><%= pseudoConstant.volunteer_role[role_id] %> (<%= quantity || '{ts escape='js'}Any{/ts}' %>): <%= display_time %></h3>
  <table class="row-highlight">
    <thead><tr>
      <th>{ts}Name{/ts}</th>
      <th>{ts}Email{/ts}</th>
      <th>{ts}Phone{/ts}</th>
    </tr></thead>
    <tbody class="crm-vol-assignment-list"></tbody>
  </table>
</script>

<script type="text/template" id="crm-vol-flexible-tpl">
  <h3>{ts}Available Volunteers{/ts}</h3>
  <table class="row-highlight">
    <thead><tr>
      <th>{ts}Name{/ts}</th>
    </tr></thead>
    <tbody class="crm-vol-assignment-list"></tbody>
  </table>
  <h4>Add Volunteer</h4>
  <input type="text" name="add-volunteer" class="crm-add-volunteer" placeholder="{ts escape='js'}Select Contact{/ts}..."/>
  <button class="crm-add-vol-contact">{ts}Add{/ts}</button>
  <div>
    {ts}OR{/ts} <select class="crm-vol-create-contact-select">
      <option value="">{ts}- create new contact -{/ts}</option>
      {crmAPI var='UFGroup' entity='UFGroup' action='get' is_active=1 is_reserved=1}
      {foreach from=$UFGroup.values item=profile}
        {if $profile.name eq 'new_individual' or $profile.name eq 'new_organization' or $profile.name eq 'new_household'}
          <option value="{$profile.id}">{$profile.title}</option>
        {/if}
      {/foreach}
    </select>
  </div>
</script>

<script type="text/template" id="crm-vol-menu-tpl">
  <div class="crm-vol-menu-items">
    <ul class="crm-vol-menu-list">
      <li>
        <a href="#" class="crm-vol-menu-parent">{ts}Move To:{/ts}</a>
        <ul class="crm-vol-menu-move-to"></ul>
      </li>
      <li>
        <a href="#" class="crm-vol-menu-parent">{ts}Copy To:{/ts}</a>
        <ul class="crm-vol-menu-copy-to"></ul>
      </li>
      <li><a class="crm-vol-del" href="#">{ts}Delete{/ts}</a></li>
    </ul>
  </div>
</script>

<script type="text/template" id="crm-vol-menu-item-tpl">
  <li class="crm-vol-menu-item"><a href="#<%= cid %>"><strong><%= title %></strong> <%= time %></a></li>
</script>
