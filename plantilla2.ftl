<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
  	<#setting locale = "es_MX">
    <#setting time_zone= "America/Mexico_City">
    <#setting number_format=",##0.00">

    <#assign "dataXML" = "">
    <#if custom?has_content>
        <#if custom.dataXML?has_content>
            <#assign "dataXML" = custom.dataXML>

        </#if>
        <#setting locale=custom.locale>
        <#assign labels = custom.labels>
        <#if custom.certData?has_content>
            <#assign "certData" = custom.certData>
        <#else>
            <#assign "certData" = record>
        </#if>
        <#assign "satCodes" = custom.satcodes>

        <#if custom.multiCurrencyFeature == "true">
            <#assign "currencyCode" = record.currencysymbol>
            <#assign exchangeRate = record.exchangerate?string.number>
        <#else>
            <#assign "currencyCode" = "MXN">
            <#assign exchangeRate = 1>
        </#if>
        <#if custom.oneWorldFeature == "true">
            <#assign customCompanyInfo = record.subsidiary>
        <#else>
            <#assign "customCompanyInfo" = companyInformation>
        </#if>
        <#if customer.isperson == "T">
            <#assign customerName = customer.firstname + ' ' + customer.lastname>
        <#else>
            <#assign "customerName" = customer.companyname>
        </#if>
        <#assign "summary" = custom.summary>
        <#assign "totalAmount" = summary.subtotal - summary.totalDiscount>
        <#assign "companyTaxRegNumber" = custom.companyInfo.rfc>
        <#assign currencySymbolMap = {"USD":"$","CAD":"$","EUR":"€","AED":"د.إ.‏","AFN":"؋","ALL":"Lek","AMD":"դր.","ARS":"$","AUD":"$","AZN":"ман.","BAM":"KM","BDT":"৳","BGN":"лв.","BHD":"د.ب.‏","BIF":"FBu","BND":"$","BOB":"Bs","BRL":"R$","BWP":"P","BYR":"BYR","BZD":"$","CDF":"FrCD","CHF":"CHF","CLP":"$","CNY":"CN¥","COP":"$","CRC":"₡","CVE":"CV$","CZK":"Kč","DJF":"Fdj","DKK":"kr","DOP":"RD$","DZD":"د.ج.‏","EEK":"kr","EGP":"ج.م.‏","ERN":"Nfk","ETB":"Br","GBP":"£","GEL":"GEL","GHS":"GH₵","GNF":"FG","GTQ":"Q","HKD":"$","HNL":"L","HRK":"kn","HUF":"Ft","IDR":"Rp","ILS":"₪","INR":"টকা","IQD":"د.ع.‏","IRR":"﷼","ISK":"kr","JMD":"$","JOD":"د.أ.‏","JPY":"￥","KES":"Ksh","KHR":"៛","KMF":"FC","KRW":"₩","KWD":"د.ك.‏","KZT":"тңг.","LBP":"ل.ل.‏","LKR":"SL Re","LTL":"Lt","LVL":"Ls","LYD":"د.ل.‏","MAD":"د.م.‏","MDL":"MDL","MGA":"MGA","MKD":"MKD","MMK":"K","MOP":"MOP$","MUR":"MURs","MXN":"$","MYR":"RM","MZN":"MTn","NAD":"N$","NGN":"₦","NIO":"C$","NOK":"kr","NPR":"नेरू","NZD":"$","OMR":"ر.ع.‏","PAB":"B/.","PEN":"S/.","PHP":"₱","PKR":"₨","PLN":"zł","PYG":"₲","QAR":"ر.ق.‏","RON":"RON","RSD":"дин.","RUB":"руб.","RWF":"FR","SAR":"ر.س.‏","SDG":"SDG","SEK":"kr","SGD":"$","SOS":"Ssh","SYP":"ل.س.‏","THB":"฿","TND":"د.ت.‏","TOP":"T$","TRY":"TL","TTD":"$","TWD":"NT$","TZS":"TSh","UAH":"₴","UGX":"USh","UYU":"$","UZS":"UZS","VEF":"Bs.F.","VND":"₫","XAF":"FCFA","XOF":"CFA","YER":"ر.ي.‏","ZAR":"R","ZMK":"ZK"}>
        <#function fmtc value>
            <#assign dst =  currencySymbolMap[currencyCode] + value?number?string[",##0.00"]>
            <#return dst>
        </#function>
    <#else>
        <#assign "certData" = record>
    </#if>


    <#assign infoEmpresa = record.subsidiary>

	<head>
		<#if .locale == "ru_RU">
				<link
					name="verdana"
					type="font"
					subtype="opentype"
					src="${nsfont.verdana}"
					src-bold="${nsfont.verdana_bold}"
					bytes="2"/>
		</#if>
		<#assign addressCancelado=''>
		<#if record.custbody_efx_fe_cancelled== true >
			<#assign addressCancelado= 'FACTURA CANCELADA'>
		</#if>
		<macrolist>
			<macro id="watermark">
				<p
                    id="watermarkbody"
                    rotate="-30"
                    valign="middle"
                    align="center"
                    class="cancelada">
                    ${addressCancelado}
                </p>
			</macro>
			<macro id="nlheader">
				<table class="header" style="width: 100%; font-size: 10pt;">
                  <tr>
					<td rowspan="3">
                      <#if companyInformation.logoUrl?length != 0>
                        <img src="${companyInformation.logoUrl}" style="float: left; margin: 7px" width="140" height="70"/>
                        <#else>
                                <#if companyInformation.logoUrl?length != 0>
                                    <img src="${companyInformation.logoUrl}" style="float: left; margin: 7px; " width="140" height="70"/>
                                </#if>
                      </#if>
                      <span class="nameandaddress" >${companyInformation.companyName}</span><br/>
                      <span class="nameandaddress">${companyInformation.addressText}</span>
                    </td>
					<td align="right"><span class="title">${record@title}</span></td>
				  </tr>
					<tr>
						<td align="right"><span class="number">#${record.tranid}</span></td>
					</tr>
					<tr>
						<td align="right">${record.trandate}</td>
					</tr>
                </table>
						</macro>
						<macro id="nlfooter">
							<table class="footer" style="width: 100%;"><tr>
					<td><barcode codetype="code128" showtext="true" value="${record.tranid}"/></td>
					<td align="right"><pagenumber/> of <totalpages/></td>
					</tr>
				</table>
			</macro>
		</macrolist>
		<style type="text/css">* {
			<#if .locale == "zh_CN">
				font-family: NotoSans, NotoSansCJKsc, sans-serif;
			<#elseif .locale == "zh_TW">
				font-family: NotoSans, NotoSansCJKtc, sans-serif;
			<#elseif .locale == "ja_JP">
				font-family: NotoSans, NotoSansCJKjp, sans-serif;
			<#elseif .locale == "ko_KR">
				font-family: NotoSans, NotoSansCJKkr, sans-serif;
			<#elseif .locale == "th_TH">
				font-family: NotoSans, NotoSansThai, sans-serif;
			<#else>
				font-family: NotoSans, sans-serif;
			</#if>
			}
			table {
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
				padding: 4px 6px;
			}
			td p { align:left }
			b {
				font-weight: bold;
				color: #333333;
			}
			table.header td {
				padding: 0px;
				font-size: 10pt;
			}
			table.footer td {
				padding: 0px;
				font-size: 8pt;
			}
			table.itemtable th {
				padding-bottom: 10px;
				padding-top: 10px;
			}
			table.body td {
				padding-top: 2px;
			}
			table.total {
				page-break-inside: avoid;
			}
			tr.totalrow {
				background-color: #e3e3e3;
				line-height: 200%;
			}
			td.totalboxtop {
				font-size: 12pt;
				background-color: #e3e3e3;
			}
			td.addressheader {
				font-size: 8pt;
				padding-top: 6px;
				padding-bottom: 2px;
			}
			td.address {
				padding-top: 0px;
			}
			td.totalboxmid {
				font-size: 28pt;
				padding-top: 20px;
				background-color: #e3e3e3;
			}
			td.totalboxbot {
				background-color: #e3e3e3;
				font-weight: bold;
			}
			span.title {
				font-size: 28pt;
			}
			span.number {
				font-size: 16pt;
			}
			span.itemname {
				font-weight: bold;
				line-height: 150%;
			}
			hr {
				width: 100%;
				color: #d3d3d3;
				background-color: #d3d3d3;
				height: 1px;
			}
		</style>
	</head>
	<body header="nlheader" header-height="10%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
      	<#assign direccionReceptor=''>
		<#assign nombreReceptor=''>
        <#assign rfcReceptor=''>

        <#if record.custbody_csc_kiosko_nombre_receptor?has_content>
			<#assign nombreReceptor=record.custbody_csc_kiosko_nombre_receptor>
            <#else>
              <#assign nombreReceptor=record.entity.addressee>
        </#if>

		<#if record.custbody_csc_kiosko_rfc?has_content>
        		<#assign rfcReceptor=record.custbody_csc_kiosko_rfc>
				<#else>
                	<#assign rfcReceptor=record.entity.vatregnumber>
        </#if>

        <#if record.custbody_csc_kiosko_direccion?has_content>
        	<#assign direccionReceptor=record.custbody_csc_kiosko_direccion>
            <#else>
            	<#assign direccionReceptor=record.billaddress>
        </#if>

		<table class="body" style="width: 100%; margin-top: 10px;">
          <tr>
            <td class="addressheader" colspan="3"><b>Texto</b></td>
            <td class="addressheader" colspan="4"><b>${record.shipaddress@label}</b></td>
            <td class="totalboxtop" colspan="4"><b>${record.total@label?upper_case}</b></td>
		  </tr>
		<tr>
		<td class="address" colspan="3" rowspan="2">ya no Estoy aqui</td>
		<td class="address" colspan="3" rowspan="2">${record.shipaddress}</td>
		<td align="right" class="totalboxmid" colspan="5">${record.total}</td>
		</tr>
		<tr>
		<td align="right" class="totalboxbot" colspan="5"><b>${record.duedate@label}:</b> ${record.duedate}</td>
		</tr></table>

		<table style="width: 100%; margin-top: 10px;">
          <tr>
            <th style="width: 32%;">Lugar de Expedición:</th>
            <th style="width: 33%;">Forma de Pago:</th>
            <th style="width: 33%;">Serie/Folio:</th>
          </tr>
          <tr>
            <td style="width: 32%;">${companyInformation.zip}</td>
            <td style="width: 33%;">${record.custbody_mx_txn_sat_payment_method}</td>
            <td style="width: 33%;">${record.custbody_mx_cfdi_folio}</td>
          </tr>
        </table>
		<#if certData?has_content>
			<table style="width: 100%; margin-top: 10px;">
          <tr>
            <th style="width: 32%;">Uso CFDI:</th>
            <th style="width: 33%;">Método de Pago:</th>
            <th style="width: 33%;">Folio Fiscal:</th>
          </tr>
          <tr>
            <td style="width: 32%;">${record.custbody_mx_cfdi_usage}</td>
            <td style="width: 33%;">${record.custbody_mx_txn_sat_payment_term}</td>
           	<td style="width: 33%;">${certData.custbody_mx_cfdi_uuid}</td>
          </tr>
		</table>
        </#if>


		<table style="width: 100%; margin-top: 10px;">
          <tr>
              <th style="width: 32%;">Tipo de Comprobante:</th>
              <th style="width: 33%;">Condiciones de Pago:</th>
              <th style="width: 33%;">Fecha y Hora de Certificación:</th>
          </tr>
          <tr>
            <td style="width: 32%;">
              <span style="background-color: rgb(255, 255, 255);">
                <#assign recType=record.type>
                <#if recType == "custinvc">
                	<#assign recType="I - INGRESO">
                    <#elseif recType == "custcred">
                    	<#assign recType="E - EGRESO">
                </#if>
                ${recType}
              </span>
            </td>
            <#assign datearray = certData.custbody_mx_cfdi_certify_timestamp?split("T")>
            <td style="width: 33%;">${record.terms}</td>
            <td style="width: 33%;">
                    <#if datearray?size == 2 >
                        <#assign dayarray = datearray[0]?split("-")>
                        ${dayarray[2]}/${dayarray[1]}/${dayarray[0]} ${datearray[1]}
                    <#else>
                        ${certData.custbody_mx_cfdi_certify_timestamp}
                    </#if>
            </td>
        </tr>
    </table>
		<table style="width: 100%; margin-top: 10px;">
          <tr>
            <th  style="width: 32%;">${record.otherrefnum@label}</th>
            <th  style="width: 33%;">${record.currency@label}</th>
            <th  style="width: 33%;">${record.exchangerate@label}</th>
          </tr>
          <tr>
            <td style="width: 32%;">${record.otherrefnum}</td>
            <td style="width: 33%;">${record.currency.symbol}</td>
            <td style="width: 33%;">${record.exchangerate?string("0.####")}</td>
          </tr>
		</table>
		<#if record.item?has_content>

          <table class="itemtable" style="width: 100%; margin-top: 10px;"><!-- start items --><#list record.item as item><#if item_index==0>
          <thead>
              <tr>
              <th align="center" colspan="3">${item.quantity@label}</th>
              <th colspan="12">${item.item@label}</th>
              <th colspan="3">${item.options@label}</th>
              <th align="right" colspan="4">${item.rate@label}</th>
              <th align="right" colspan="4">${item.amount@label}</th>
              </tr>
          </thead>
          </#if>
              <tr>
              <td align="center" colspan="3" line-height="150%">${item.quantity}</td>
              <td colspan="12"><span class="itemname">${item.item}</span><br />${item.description}</td>
              <td colspan="3">${item.options}</td>
              <td align="right" colspan="4">${item.rate}</td>
              <td align="right" colspan="4">${item.amount}</td>
              </tr>
              </#list><!-- end items --></table>

          <hr />
		</#if>
		<table class="total" style="width: 100%; margin-top: 10px;">
          <tr>
            <td colspan="4">&nbsp;</td>
            <td align="right"><b>${record.subtotal@label}</b></td>
            <td align="right">${record.subtotal}</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
            <td align="right"><b>${record.taxtotal@label} (${record.taxrate}%)</b></td>
            <td align="right">${record.taxtotal}</td>
          </tr>
		<tr class="totalrow">
          <td background-color="#ffffff" colspan="4">&nbsp;</td>
          <td align="right"><b>${record.total@label}</b></td>
          <td align="right">${record.total}</td>
		</tr>
       </table>


        <table style="width: 100%; margin-top: 10px;">
          <tr>
            <td valign="top" align="left" width="25%">
              <#if certData.custbody_mx_cfdi_qr_code != ''>
				<#assign qrcodeImage = "data:image/png;base64, " + certData.custbody_mx_cfdi_qr_code >
                <img style="width: 150px; height:150px" src="${qrcodeImage}" />
                </#if>
            </td>
            <td>
              <table style="width: 100%; margin-top: 10px;">
                <tr>
                  <th >Cadena original del complemento de certificación digital del SAT</th>
                </tr>
                <tr>
                  <td style="align: left;">${certData.custbody_mx_cfdi_cadena_original}</td>
                </tr>
                <tr>
                  <th>Sello digital del CFDI</th>
                </tr>
                <tr>
                  <td style="align: left;">${certData.custbody_mx_cfdi_signature}</td>
                </tr>
                <tr>
                  <th>Sello digital del SAT</th>
                </tr>
                <tr>
                  <td style="align: left;">${certData.custbody_mx_cfdi_sat_signature}</td>
                </tr>

                <#if record.custbody_efx_fe_cfdi_rel != ''>
                  <tr>
                    <th>CFDI's Relacionados</th>
                  </tr>
                  <tr>
                    <td style="align: left;">${record.custbody_efx_fe_cfdi_rel}</td>
                  </tr>
                  </#if>
              </table>
            </td>
          </tr>
        </table>

	</body>
</pdf>