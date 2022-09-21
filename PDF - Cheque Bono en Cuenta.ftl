<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
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
    <style type="text/css">* {
			<#if .locale == "zh_CN">
			font-family: NotoSans,
			NotoSansCJKsc, sans-serif;
			<#elseif .locale == "zh_TW">
			font-family:
			NotoSans, NotoSansCJKtc,
			sans-serif;
			<#elseif .locale == "ja_JP">
			font-family: NotoSans, NotoSansCJKjp, sans-serif;
			<#elseif .locale ==
			"ko_KR">
			font-family: NotoSans, NotoSansCJKkr,
			sans-serif;
			<#elseif
			.locale == "th_TH">
			font-family: NotoSans, NotoSansThai, sans-serif;
			<#else>
			font-family: NotoSans, sans-serif;
			</#if>
			}
			.check table {
			position: relative;
			overflow: hidden;
			font-size: 8pt;
			}
			td p { align:left
			}
			body {
			font-family: Helvetica,sans-serif;
			font-size: 10pt;
			}

			/*table tr
			td,th {
			border: 0.3 solid black;
			}*/
</style>
</head>
<body padding="0.15in 0.38in 0.15in 0.38in" size="Letter">
    <#list records.data as check>
<div style="position: relative;font-family: Helvetica,sans-serif;top= -11pt;page-break-inside: avoid;font-size: 11pt;">
<table style="width:100%;"><tr>
	<td colspan="4" style="font-size: 11pt; text-align: left;">&nbsp;</td>
	</tr>
	<tr>
	<td colspan="4" style="font-size: 11pt; text-align: left;">&nbsp;</td>
	</tr>
	<tr style="margin-top: 16px;">
	<td colspan="3">${check.vendorStamp}</td>
	<td align="right">${check.trandate}</td>
	</tr>
	<tr style="margin-top: 23px;">
	<td align="left" colspan="3">${check.entity?html}</td>
	<td align="right">${check.caracteres}${check.total}</td>
	</tr>
	<tr style="margin-top: 18px;">
	<td align="left" colspan="4">${check.amountInWords}</td>
	</tr></table>

<table style="width: 100%; margin-top: 1.82in;"><tr>
	<td align="left">
	<table style="width:100%;"><tr>
		<td>Fecha Pago: ${check.trandate}</td>
		<td>&nbsp;</td>
		</tr>
		<tr>
		<td align="left" colspan="2">Cantidad: ${check.total}</td>
		</tr></table>
	</td>
	</tr>
	<tr>
	<td>
	<table style="width:100%;"><tr>
		<td colspan="2">${check.subsidiary}</td>
		</tr></table>
	</td>
	<td colspan="2">
	<table style="width:100%; margin-top:18px;"><tr>
		<td align="center" style="border-top: 0.2px solid black; margin-right:5px;">Firma #1</td>
		<td align="center" style="border-top: 0.2px solid black;">Firma #2</td>
		</tr></table>
	</td>
	</tr></table>

<table style="width:100%; margin-top: 0.39in"><tr>
	<td>Facturas Pagadas:</td>
	</tr>
	<tr>
	<td><tfooter> </tfooter>
	<table style="width:100%; font-size:9.5pt;">
	<thead>
		<tr>
		<th align="left">N&uacute;mero de factura</th>
		<th align="left" colspan="2">Notas</th>
		<th align="center">Monto</th>
		</tr>
	</thead>
	<#assign totalTran = 0><#list check.transactions as transaction><tr>
		<td>${transaction.trannumber}</td>
		<td colspan="2">${transaction.memo}</td>
		<td align="right">${transaction.amount}</td>
		</tr>
		</#list>
		<tr>
		<td align="right" colspan="3">Total:</td>
		<td align="right">${check.totalTransaction}</td>
		</tr></table>
	</td>
	</tr></table>

<table style="width:100%; position: fixed; top:9.28in; margin-left: 6px;"><tr>
	<td colspan="2">Banco: ${check.account}</td>
	<td align="left" style="margin-left: 35px;">Num. cheque:</td>
	<td align="left" style="margin-left: -20px;">${check.numCheck}</td>
	<td align="right" colspan="2">${check.total}</td>
	</tr>
	<tr>
	<td colspan="2">&nbsp;</td>
	<td colspan="2">
	<table style="width:100%; margin-top:10px;"><tr>
		<td align="center">Revisado por:<br />Tesorer&iacute;a</td>
		<td align="center">Autorizado por:<br />Admin y Finan</td>
		</tr></table>
	</td>
	<td colspan="2">&nbsp;</td>
	</tr></table>
</div>
<#if check?is_last = false >

<div style="page-break-before: always;">&nbsp;</div>
</#if></#list>
</body>
</pdf>