<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd"><pdfset><#if statements??><#list statements as statement>
<pdf>
<head>
	<link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
	<#if .locale == "zh_CN">
		<link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
	<#elseif .locale == "zh_TW">
		<link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
	<#elseif .locale == "ja_JP">
		<link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
	<#elseif .locale == "ko_KR">
		<link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
	<#elseif .locale == "th_TH">
		<link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
	</#if>
    <macrolist>
        <macro id="nlfooter">
            <table class="footer" style="width: 100%;"><tr>
	<td align="right"><pagenumber/> of <totalpages/></td>
	</tr></table>
        </macro>
    </macrolist>
    <style type="text/css">table {
             <#if .locale == "zh_CN">
                 font-family: stsong, sans-serif;
             <#elseif .locale == "zh_TW">
                 font-family: msung, sans-serif;
             <#elseif .locale == "ja_JP">
                 font-family: heiseimin, sans-serif;
             <#elseif .locale == "ko_KR">
                 font-family: hygothic, sans-serif;
             <#elseif .locale == "ru_RU">
                 font-family: verdana;
             <#else>
                 font-family: sans-serif;
             </#if>
             font-size: 9pt;
             table-layout: fixed;
         }
         th {
             font-weight: bold;
             font-size: 8pt;
             vertical-align: middle;
             padding: 5px 6px 3px;
             background-color: #e3e3e3;
             color: #333333;
         }
         td {

         }
         b {
             font-weight: bold;
             color: #333333;
         }
         table.header td {
             padding: 0;
             font-size: 10pt;
         }
         table.footer td {
             padding: 0;
             font-size: 8pt;
         }
         table.itemtable th {
             padding-bottom: 10px;
             padding-top: 10px;
         }
         table.body td {
             padding-top: 2px;
         }
         td.addressheader {
             font-weight: bold;
             font-size: 8pt;
             padding-top: 6px;
             padding-bottom: 2px;
         }
         td.address {
             padding-top: 0;
         }
         span.title {
             font-size: 28pt;
         }
         span.number {
             font-size: 16pt;
         }
         div.remittanceSlip {
             width: 100%;
             /* To ensure minimal height of remittance slip */
             height: 200pt;
             page-break-inside: avoid;
             page-break-after: avoid;
         }
         hr {
             border-top: 1px dashed #d3d3d3;
             width: 100%;
             color: #ffffff;
             background-color: #ffffff;
             height: 1px;
         }
</style>
</head>
<body footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    <table style="background-color:#E4002B;border-style:hidden;width:100%;"><tr>
	<td align="center" style="width: 100%; height: 40px; vertical-align: middle;"><span style="font-family: Arial, Helvetica, sans-serif;"><span style="font-size: 14px;"><span style="color:#ffffff;">In December 2018, AsiaInspection has become <strong>QIMA!</strong> </span><a href="https://www.qima.com/asiainspection-to-qima"><span style="color:#ffffff;">Learn More.</span></a><span style="color:#ffffff;"> </span></span></span></td>
	</tr></table>
&nbsp;

<table class="header" style="width: 100%;"><tr>
	<td rowspan="2"><span style="font-size:12px;"><img src="https://s3-ap-southeast-1.amazonaws.com/ai-resource/qima/qima_lockup_borderless.png" style="width: 148px; height: 50px;" /><br /><br /><br /><span style="font-family:arial,helvetica,sans-serif;"><span class="nameandaddress">${subsidiary.mainaddress_text}</span><br /><span style="background-color: rgb(255, 255, 255);">accounting@qima.com</span></span></span></td>
	<td align="right"><span class="title">Statement</span></td>
	</tr>
	<tr>
	<td align="right">${statement.trandate}</td>
	</tr></table>

<table style="width: 100%; margin-top: 10px;"><tr>
	<td class="addressheader" colspan="3"><br />Customer Details</td>
	</tr>
	<tr>
	<td class="address" colspan="3"><span style="font-family: arial, helvetica, sans-serif; background-color: rgb(255, 255, 255);">${customer.companyname}</span><br /><span style="font-family:arial,helvetica,sans-serif;">${statement.billaddress}</span></td>
	</tr></table>

<table class="body" style="width: 100%;"><tr>
	<th align="right">${statement.amountDue@label}</th>
	</tr>
	<tr>
	<td align="right"><strong><span style="font-size:14px;"><span style="text-align: -webkit-right; background-color: rgb(255, 255, 255);">${statement.currency} &nbsp;</span>${statement.amountDue}</span></strong></td>
	</tr></table>
<#if statement.lines?has_content>

<table class="itemtable" style="width: 100%; margin-top: 10px;"><!-- start items --><#list statement.lines as line><#if line_index==0>
<thead>
	<tr>
	<th colspan="3">${line.datecol@label}</th>
	<th colspan="8">${line.description@label}</th>
	<th align="right" colspan="6">Monthly Invoice #</th>
	<th align="right" colspan="3">${line.charge@label}</th>
	<th align="right" colspan="4">Credit</th>
	<th align="right" colspan="4">${line.balance@label}</th>
	</tr>
</thead>
</#if><tr>
	<td colspan="3">${line.datecol}</td>
	<#if line.description?contains("Invoice")>
        <#if line.custbody_created_from_so?has_content>
	    <td colspan="8">${line.custbody_created_from_so}</td>
	    <#else>
	        <td colspan="8">${line.description}</td>
	    </#if>
    <#else>
        <#if line.description?contains("Discount")>
	        <td colspan="8">Bank Charge</td>
	    <#else>
	        <td colspan="8">${line.description}</td>
	    </#if>
    </#if>

    <#if line.custbody_cons_inv_num?contains("undefined")>
	    <td align="right" colspan="6">to be generated</td>
	<#else>
	    <td align="right" colspan="6">${line.custbody_cons_inv_num}</td>
	</#if>
    
    <#if line.description?contains("Invoice")>
	    <td align="right" colspan="3">${line.amountremaining}</td>
	<#elseif line.description?contains("Adjustment")>
        <#if line.charge?length gt 1>
	        <td align="right" colspan="3">${line.amountremaining}</td>
	    <#else>
	    <td align="right" colspan="3">&nbsp;</td>
	    </#if>
    <#else>
	    <td align="right" colspan="3">${line.charge}</td>
	</#if>
    
    <#if line.description?contains("Payment")>
	    <td align="right" colspan="4">${line.amountremaining}</td>
	<#elseif line.description?contains("Credit")>
	    <td align="right" colspan="4">${line.amountremaining}</td>
	<#elseif line.description?contains("Adjustment")>
        <#if line.payment?length gt 1>
	    <td align="right" colspan="4">${line.amountremaining}</td>
	    <#else>
	        <td align="right" colspan="4">&nbsp;</td>
	    </#if>
    <#else>
	    <td align="right" colspan="4">${line.payment}</td>
	</#if>
	<td align="right" colspan="4">${line.balance}</td>
	</tr>
	</#list><!-- end items --></table>

<table class="aging" style="width: 100%; margin-top: 10px;"><tr>
	<th>${statement.aging1@label}</th>
	<th>${statement.aging2@label}</th>
	<th>${statement.aging3@label}</th>
	<th>${statement.aging4@label}</th>
	<th>${statement.aging5@label}</th>
	<th>${statement.agingbal@label}</th>
	</tr>
	<tr>
	<td>${statement.aging1}</td>
	<td>${statement.aging2}</td>
	<td>${statement.aging3}</td>
	<td>${statement.aging4}</td>
	<td>${statement.aging5}</td>
	<td>${statement.agingbal}</td>
	</tr></table>
<br /></#if>
<table cellspacing="4" class="footer" style="border:1px solid black;padding-bottom:3px;padding-top:3px;width:100%;"><tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td width="70%">
	<pre style="font-weight: bold; font-family: Arial, sans-serif; font-size: 8px;"><span style="font-size:11px;"><strong><span style="color:#ff0000;">Payment by check to:                        Payment by wire transfer to:</span></strong></span>
Send a check made payable to                                Bank Name: HSBC Bank USA N.A
&ldquo;QIMA (US) LLC.&rdquo; to our office                                Address: Fifth Avenue Office. 452 Fifth Ave.
At Address shown below                                         New York, NY 10018
352 Sonwil Dr.                                                           Account Holder Name: QIMA (US) LLC.
Buffalo, NY 14225                                                     Account #: 738046086
                                                                                   Routing #: 021001088
                                                                                   ABA: 021001088
                                                                                   Swift: MRMDUS33


</pre>
	</td>
	<td align="center" style="padding: 5px; margin: 2px;" width="30%">
	<div style="padding: 1px;"><!-- references: pay_now.png --><a href="http://customer.qima.com/payment"><img src="https://system.na2.netsuite.com/core/media/media.nl?id=234625&amp;c=4552646&amp;h=ed87a5f15dfacb0f9561" style="margin: 0px; width: 100px; height: 25px;" /></a> <!-- references: cards.png --> <img src="https://system.na2.netsuite.com/core/media/media.nl?id=234622&amp;c=4552646&amp;h=24d2835ae7a0342bb29f" style="margin: 0px; width: 100px; height: 25px;" /></div>
	</td>
	</tr>
	<tr>
	<td colspan="2" style="padding: 0px;" width="100%"><span style="color: red;">&nbsp;</span><span style="font-family:arial,helvetica,sans-serif;"><span style="color:#FF0000;"><span style="font-size:11px;">** Please mention clearly your Invoice Number(s) on your bank message to beneficiary.<br /><br /><span style="background-color: rgb(255, 255, 255);">&nbsp;** Please add to your payment bank charges (local and intermediary) that your bank may deduct.</span></span></span></span><br /><br />&nbsp;</td>
	</tr>
	<tr>
	<td colspan="2">&nbsp;</td>
	</tr></table>
</body></pdf></#list><#else><pdf><head><script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"6",ghostip:"203.186.47.93",ipv6:false,pct:"10",clientip:"59.148.49.206",requestid:"1f49ce3e",region:"17927",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"1f49ce3e",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script><script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"8",ghostip:"203.186.47.93",ipv6:false,pct:"10",clientip:"59.148.49.206",requestid:"22f81975",region:"17927",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"22f81975",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script><script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"11",ghostip:"61.244.242.71",ipv6:false,pct:"10",clientip:"59.148.49.206",requestid:"ce79ded",region:"17927",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"ce79ded",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script></head><body>

<p><br />Please use Single Currency Advanced Printing Template</p>
</body>
</pdf></#if></pdfset>