<!--
/* ***** BEGIN LICENSE BLOCK *****
* Version: MPL 1.1/GPL 2.0/LGPL 2.1
*
* The contents of this file are subject to the Mozilla Public License Version
* 1.1 (the "License"); you may not use this file except in compliance with
* the License. You may obtain a copy of the License at
* http://www.mozilla.org/MPL/
*
* Software distributed under the License is distributed on an "AS IS" basis,
* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
* for the specific language governing rights and limitations under the
* License.
*
* The Original Code is part of Oviyam, an web viewer for DICOM(TM) images
* hosted at http://skshospital.net/pacs/webviewer/oviyam_0.6-src.zip
*
* The Initial Developer of the Original Code is
* Raster Images
* Portions created by the Initial Developer are Copyright (C) 2014
* the Initial Developer. All Rights Reserved.
*
* Contributor(s):
* Babu Hussain A
* Balamurugan R
* Devishree V
* Guruprasath R
* Karthikeyan S
* Meer Asgar Hussain B
* Prakash J
* Suresh V
* Yogapraveen K
*
* Alternatively, the contents of this file may be used under the terms of
* either the GNU General Public License Version 2 or later (the "GPL"), or
* the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
* in which case the provisions of the GPL or the LGPL are applicable instead
* of those above. If you wish to allow use of your version of this file only
* under the terms of either the GPL or the LGPL, and not to allow others to
* use your version of this file under the terms of the MPL, indicate your
* decision by deleting the provisions above and replace them with the notice
* and other provisions required by the GPL or the LGPL. If you do not delete
* the provisions above, a recipient may use your version of this file under
* the terms of any one of the MPL, the GPL or the LGPL.
*
* ***** END LICENSE BLOCK ***** */
-->

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="pat" uri="/WEB-INF/tlds/PatientInfo.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%
	String patName = request.getParameter("patientName");
	String tabName = request.getParameter("tabName");
%>

<fmt:setBundle basename="resources.i18n.Messages" var="lang" />

<html>

<head>
<style>
/* 
##Device = Desktops
##Screen = 1281px to higher resolution desktops
*/
@media ( min-width : 1281px) {
	.dataTables_scrollBody {
		max-height: 100% !important;
		overflow: auto;
	}
}

/* 
##Device = Laptops, Desktops
##Screen = B/w 1025px to 1280px
*/
@media ( min-width : 1025px) and (max-width: 1280px) {
	.dataTables_scrollBody {
		max-height: 100% !important;
		overflow: auto;
	}
}

/* 
##Device = Tablets, Ipads (portrait)
##Screen = B/w 768px to 1024px
*/
@media ( min-width : 768px) and (max-width: 1024px) {
}

/* 
##Device = Tablets, Ipads (landscape)
##Screen = B/w 768px to 1024px
*/
@media ( min-width : 768px) and (max-width: 1024px) and (orientation:
	landscape) {
}

.dataTables_scrollBody {
	min-height: 80% !important;
	max-height: 88% !important;
	border-collapse: collapse;
}

.dataTables_wrapper {
	border-collapse: collapse;
}

.dataTables_info {
	width: auto;
	font-size: 13px;
}

.dataTables_length {
	font-size: 14px;
	margin-bottom: -21px;
	margin-left: 54px;
	position: absolute;
	text-align: justify;
}

.dataTables_paginate .ui-button {
	/* margin-right: 4px !important; */
	margin: 3px !important;
	font-size: 14px;
	padding: 3px;
}

table {
	width: 100%;
}

.display td {
	/* text-align: left; */
	padding: 15px !important;
}

.display {
	border-collapse: collapse !important;
}

tr.odd {
	background-color: #e6e6e6;
}

tr.even {
	background-color: #fff;
}

table.display tr.even.row_selected td {
	background-color: #718ea0;
}

table.display tr.odd.row_selected td {
	background-color: #718ea0;
}

table.display tr:hover td {
	background: rgba(24, 143, 255, 0.16) !important;
    cursor: pointer;
}

table.display tr.even.row_selected:hover td,
table.display tr.odd.row_selected:hover td {
	background-color: #718ea0 !important;
}

/*
* Sorting classes for columns
*/

/* For the standard odd/even */
tr.odd td.sorting_1 {
	background-color: #e6e6e6;
}

tr.even td.sorting_1 {
	background-color: #fff;
}

.display, .dataTables_scrollHeadInner {
	width: 100% !important;
}

.dataTables_scrollHeadInner {
	width: 100% !important;
}

.dataTables_filter {
	font-size: 14px;
}
.dataTables_scrollHead table thead{
	display:none;
}
.instance-legend{
	position: absolute;
    margin-top: -28px;
	right: 400px;
}
.instance-legend ul li{
	display: inline-flex;
    vertical-align: middle;
    line-height: 16px;
	margin-right: 10px;
    font-size: 13px;
    color: #fff;
}
.instance-legend ul li:first-child span{
	display: inline-block;
	background-color: #6fbb6f;
	width: 15px;
	height: 15px;
	margin-right: 5px;
}
.instance-legend ul li:last-child span{
	display: inline-block;
	background-color: #FF8A00;
	width: 15px;
	height: 15px;
	margin-right: 5px;
}
table.display td:first-child{
	width: 5%;
}
table.display td:nth-of-type(2){
	width: 20%;
}
table.display td:nth-of-type(3){
	width: 14%;
}
table.display td:nth-of-type(4){
	width: 7%;
	padding: 20px !important;
}
table.display td:nth-of-type(5){
	width: 20%;
    padding: 0!important;
}
table.display td:nth-of-type(6){
	width: 20%;
}
table.display td:nth-of-type(7){
	width: 20%;
}
table.display td:nth-of-type(8){
	width: 20%;
}
table.display td:nth-of-type(9){
	width: 20%;
}
table.display thead th{
	text-align: left;
	position: sticky;
    top: 0;
}
/* table.display th:first-child{
	width: 5%!important;
}
table.display th:nth-of-type(2){
	width: 20%!important;
}
table.display th:nth-of-type(3){
	width: 20%!important;
}
table.display th:nth-of-type(4){
	width: 20%!important;
}
table.display th:nth-of-type(5){
	width: 20%!important;
}
table.display th:nth-of-type(6){
	width: 20%!important;
}
table.display th:nth-of-type(7){
	width: 20%!important;
}
table.display th:nth-of-type(8){
	width: 20%!important;
}
table.display th:nth-of-type(9){
	width: 20%!important;
} */
</style>
<script type="text/javascript" src="js/LoadLanguage.js"></script>
<script type="text/javascript">
	var dTable;
	$(document).ready(function () {
	var tableName = '#<%=tabName%>_table';
	var searchPane = '#<%=tabName%>_search';
	$(searchPane).show();
	
	dTable = $(tableName).DataTable({
			"bJQueryUI": true,
			//"sPaginationType": "full_numbers",											
			"bPaginate": true,
			"responsive": true,
			//"bFilter": false,
			"oLanguage": {
				"sSearch": languages.Filter,
				"sLengthMenu": languages.LengthMenu,
				"sZeroRecords": languages.ZeroRecords,
				"sInfo": languages.Info,
				"sInfoEmpty": languages.InfoEmpty,
				"sInfoFiltered": languages.InfoFiltered
			},
			"sScrollY": "87%",
			"bScrollCollapse": true,
			"bAutoWidth": true,
			"sScrollX": "100%",
			"sScrollBody":"100%",
			//"sScrollXInner": "100%",
			"aaSorting": [[4, "desc"]],
			"pageLength":25,
			"aoColumnDefs": [{
					 "aTargets": [0],
					 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							if (sData.indexOf('img') >= 0) {
									$(nTd).css('padding', '0px');
									$(nTd).css('text-align', 'center');
							}
							
					  }
			}],
			"aoColumns": [null, null, null, null, null, null, null, null, null, { "bVisible": false }, { "bVisible": false }],
			"fnDrawCallback": function(oSettings) {
	        	highlightModalities();
	        	instanceAvailability();
	        }
	});

	function highlightModalities() {
        $('[class^="CT"]').css("background", "#8D661F");
        $('[class^="CR"]').css("background", "#008080");
        $('[class^="MR"]').css("background", "#4F8F78");
        $('[class^="DX"]').css("background", "#092B5A");
        $('[class^="XA"]').css("background", "#BEB072");
        $('[class^="PX"]').css("background", "#FF6347");
        $('[class^="SC"]').css("background", "#6E5F5F");
        $('[class^="OT"]').css("background", "#587BAC");
        $('[class^="XC"]').css("background", "#FF6347");
        $('[class^="SR"]').css("background", "#6E5F5F");
        $('[class^="US"]').css("background", "#676F73");
        $('[class^="ES"]').css("background", "#15607C");
        $('[class^="ECG"]').css("background", "#736767");
        $('[class^="PR"]').css("background", "#008080");
    }
	
	function instanceAvailability() {
		 $('[class^="ONLINE"]').css("background", "#6fbb6f");
		 $('[class^="NEARLINE"]').css("background", "#FF8A00");
		 $('[class^="OFFLINE"]').css("background", "#948a8a");
		 $('[class^="UNAVAILABLE"]').css("background", "#ef0f0f");
	}

	$.fn.dataTableInstances[<%=request.getParameter("tabIndex")%>] = dTable;

	if (<%=request.getParameter("search")%>!=null && !<%=request.getParameter("search")%>) { //For Direct launch
			$('#searchToggler').hide();
			$('#Toggler').css('top', '0.5%');
	}                 
	});
	
	$('.fg-toolbar').click(function () {
		$('.dataTables_scrollBody table thead').hide();
		$('.dataTables_scrollHead table thead').show();
	});
	
	$('.dataTables_scrollBody table thead').click(function () {
		$('.dataTables_scrollBody table thead').hide();
		$('.dataTables_scrollHead table thead').show();
	});

	function toggleDivider(divider) {
		var serverName = $("#tabUL .ui-state-active").find('a').get(0);
		serverName = $(serverName).attr('href');
		$('.dataTables_scrollBody table thead').show();
		$('.dataTables_scrollHead table thead').hide();

		var toggler = $(serverName + '_Toggler');
		var westPane = $(serverName + '_westPane');
		var searchPane = $(serverName + '_search');

			if ($(westPane).is(":visible")) {
					// $(westPane).html('');
					$(westPane).hide();
					console.log($(toggler).next());
					console.log($(toggler).next());
					$(toggler).next().css('width', '100%');
					$(toggler).next().css('left', '0px');
					$(toggler).css('left', '0px');
					$(divider).attr('title', 'Show Preview');
					if ($(searchPane).is(":visible")) {
							$(divider).css('background', 'url("images/showall.png")');
							$(divider).next().css('background', 'url("images/hideall.png")');
					} else {
							$(divider).css('background', 'url("images/hidesearch.png")');
							$(divider).next().css('background', 'url("images/hidewest.png")');
					}
			} else {

					loadWest();
					$(westPane).show();
					$(toggler).next().css('left', '256px');
					$(toggler).next().css('width', $('body').width() - 260 + 'px');
					$(divider).attr('title', 'Hide Preview');
					$(toggler).css('left', '256px');
					if ($(searchPane).is(":visible")) {
							$(divider).css('background', 'url("images/hidewest.png")');
							$(divider).next().css('background', 'url("images/hidesearch.png")');
					} else {
							$(divider).css('background', 'url("images/hideall.png")');
							$(divider).next().css('background', 'url("images/showall.png")');
					}
			}
			$('#' + tableName + '_table').css('width', '100%');			
			dTable.columns.adjust().draw();
	}

	function toggleSearch(divider) {
		$('.dataTables_scrollBody table thead').hide();
		$('.dataTables_scrollHead table thead').show();
		var serverName = $("#tabUL .ui-state-active").find('a').get(0);
		serverName = $(serverName).attr('href');
		var westPane = $(serverName + '_westPane');
		var searchPane = $(serverName + '_search');
		var tabContent = $(serverName + '_content');
		var toggler = $(serverName + '_Toggler');

			if ($(searchPane).is(":visible")) {
					$(searchPane).hide();
					// $(tabContent).css('height', '100%');
					$(tabContent).css('height', '83%');
					$(toggler).css('top', '1%');
					$(toggler).next().css('top', '0px');
					// $('#Toggler').next().css('height', '100%');
					$(toggler).next().css('height', '83%');
					$(divider).attr('title', 'Show Search');

					if ($(westPane).is(":visible")) {
							$(divider).css('background', 'url("images/showall.png")');
							$(divider).prev().css('background', 'url("images/hideall.png")');
					} else {
							$(divider).css('background', 'url("images/hidewest.png")');
							$(divider).prev().css('background', 'url("images/hidesearch.png")');
					}
			} else {
					$(searchPane).show();
					$(divider).attr('title', 'Hide Search');
					$(tabContent).css('height', '83%');
					$(toggler).css('top', '13.5%');
					$(toggler).next().css('top', '13%');
					$(toggler).next().css('height', '83%');

					if ($(westPane).is(":visible")) {
							$(divider).css('background', 'url("images/hidesearch.png")');
							$(divider).prev().css('background','url("images/hidewest.png")');
					} else {
							$(divider).css('background', 'url("images/hideall.png")');
							$(divider).prev()
							.css('background', 'url("images/showall.png")');
					}
			}
	}

	function loadWest() {
		var selected = dTable.$('tr.row_selected');

		if (selected.length > 0) {
			// 		        	var iPos = dTable.fnGetData($(dTable.find('.row_selected')).get(0));
			var iPos = dTable.row(this).data();
			if (iPos == null) {
				return;
			}
			showWestPane(iPos);
		}
	}
</script>
</head>

<body>
	<c:choose>
		<c:when test="${param.preview=='true'}">
			<div id="<%=tabName%>_westPane"
				style="width: 255px; visibility: visible; display: block; z-index: 0; float: left; height: 94%;"></div>

			<div id="<%=tabName%>_Toggler"
				style="position: absolute; top: 13.5%; left: 256px; z-index: 3;">

				<div id="<%=tabName%>_westToggler" name="testToggler" title="Hide Preview"
					class="ui-state-default"
					onmouseover="this.className='ui-state-hover'"
					onmouseout="this.className='ui-state-default'"
					style="width: 24px; height: 24px; cursor: pointer; float: left; z-index: 3; background: url('images/hidewest.png'); border: none;"
					onclick="this.className='ui-state-default';toggleDivider(this);"></div>

				<div id="<%=tabName%>_searchToggler" title="Hide Search"
					class="ui-state-default toggler"
					onmouseover="this.className='ui-state-hover'"
					onmouseout="this.className='ui-state-default'"
					style="width: 24px; height: 24px; cursor: pointer; float: left; z-index: 3; background: url('images/hidesearch.png'); border: none;"
					onclick="this.className='ui-state-default'; toggleSearch(this);"></div>
			</div>

			<c:choose>
				<c:when test="${param.search=='true'}">
					<div
						style="float: left; height: 84%; position: absolute; top: 13%; left: 257px; right: 0px; bottom: 0px; padding: 0px'">
				</c:when>

				<c:otherwise>
					<div
						style="float: left; height: 100%; position: absolute; top: 0px; left: 257px; right: 0px; bottom: 0px; padding: 0px'">
				</c:otherwise>

			</c:choose>

		</c:when>

		<c:otherwise>
			<div style="float: left; width: 100%; padding: 0px'">
		</c:otherwise>
	</c:choose>

	<table class="display" id="<%=tabName%>_table" style="font-size: 14px;">

		<thead>
			<tr>
				<th></th>
				<th class='patientId'></th>
				<th class='patientName'></th>
				<th class="gender"></th>
				<!--<th><fmt:message key='dateOfBirth' bundle="${lang}" /></th>
					<th><fmt:message key='accessionNumber' bundle="${lang}" /></th>-->
				<th class='studyDate'></th>
				<th class='studyDescp'></th>
				<th class="lblReferPhysician"></th>
				<th class='lblModality'></th>
				<th class='instanceCnt'></th>
				<th>Study Instance UID</th>
				<th>Series Count</th>
			</tr>
		</thead>
		<tbody>
			<pat:Patient patientId="${param.patientId}"
				patientName="<%=patName%>" birthDate="${param.birthDate}"
				modality="${param.modality}" from="${param.from}" to="${param.to}"
				searchDays="${param.searchDays}"
				accessionNumber="${param.accessionNumber}"
				referPhysician="${param.referPhysician}"
				studyDescription="${param.studyDesc}" dcmURL="${param.dcmURL}"
				fromTime="${param.fromTime}" toTime="${param.toTime}" serverURL="${param.serverURL}">
				<tr>
					<td><img src="images/details_open.png" alt="" /> <img
						src="images/green.png" style="display: none;" id="${studyIUID}"
						alt="" /></td>
					<td>${patientId}</td>
					<td>${patientName}</td>
					<td>${patientGender}</td>
					<!--<td>${birthDate}</td>
						<td>${accessionNumber}</td>-->
					<td data-order="${dateOrder}">${studyDate}</td>
					<td>${studyDescription}</td>
					<td>${referPhysician}</td>
					<td align="center">    
						<div class="${modality}" style="color: #fff; font-weight: bold; display:inline; padding: 6px; text-align: center; background: #008080; border-radius: 0px;">${modality}</div>
                    </td>
					<td>
						<div class="${instanceAvailability}" title="${instanceAvailability}" 
							style="color: #fff; font-weight: bold; 
									display:inline-block; padding: 6px; 
									text-align: center; border-radius: 0px;min-width: 30px;">
										${totalInstances}
						</div>
					</td>
					<td>${studyIUID}</td>
					<td>${totalSeries}</td>
					<!-- <td>${patientGender}</td> -->
				</tr>
			</pat:Patient>
		</tbody>
	</table>
	<div class="instance-legend">
		<ul>
			<li><span></span> Online</li>
			<li><span></span> Nearline</li>
		</ul>
	</div>
	</div>
</body>

</html>