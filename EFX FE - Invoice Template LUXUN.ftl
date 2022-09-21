<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <#setting locale = "en_US">
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
    <#assign "shipmentcost" = 0>
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
    <macro id="nlheader">
        <table class="header" style="width: 100%;">
            <tr>
                <td colspan="6" rowspan="3">
                    <#if certData?has_content>
                    <#if record.custbody_efx_fe_info_location_pdf == true>
                    <#if record.custbody_efx_fe_logoloc?has_content>
                    <img height="90px" src="${record.custbody_efx_fe_logoloc}" style="float: left; margin: 0;" width="110px" />
                </#if>
                <#else>
                <#if record.custbody_efx_fe_logosub?has_content>
                <img height="90px" src="${record.custbody_efx_fe_logosub}" style="float: left; margin: 0;" width="110px" />
            </#if>
        </#if>

        <#else>
        <#if record.custbody_efx_fe_info_location_pdf == true>
        <#if record.custbody_efx_fe_logoloc?has_content>
        <#assign "dominio" = "https://system.netsuite.com">
        <#assign "urldir" = "https://system.netsuite.com"+record.custbody_efx_fe_logoloc>
        <img height="90px" src="${urldir}" style="float: left; margin: 0;" width="110px" />
    </#if>
    <#else>
    <#if record.custbody_efx_fe_logosub?has_content>
    <#assign "dominio" = "https://system.netsuite.com">
    <#assign "urldir" = "https://system.netsuite.com"+record.custbody_efx_fe_logosub>
    <img height="90px" src="${urldir}" style="float: left; margin: 0;" width="110px" />
    <#else>
    <#if subsidiary.logo@url?length != 0>
    <img height="90px" src="${subsidiary.logo@url}" style="float: left; margin: 0;" width="110px" />
    <#elseif companyInformation.logoUrl?length != 0>
    <img height="90px" src="${companyInformation.logoUrl}" style="float: left; margin: 0;" width="110px" />
</#if>
</#if>
</#if>
</#if>

</td>
<td colspan="6" rowspan="3">
    <span class="nameandaddress" style="font-size: 9px; width: 40%;" ><#if record.custbody_efx_fe_info_location_pdf == true>${record.custbody_efx_fe_dirloc}<#else>${record.custbody_efx_fe_dirsubs} <br /> </#if></span>
</td>
<td colspan="2" style="width: 21px;">&nbsp;</td>
<td colspan="4" style="font-size: 10px;" align="right"><span style="font-size: 12px;"><strong>FACTURA</strong></span><br />
    <#if record.custbody_efx_fe_gbl_folio?has_content>
    <span class="number" style="font-size: 18px;">${record..custbody_efx_fe_gbl_folio}</span>
    <#else>
    <span class="number" style="font-size: 18px;">${record.externalid} </span>
</#if>

<br /> <br />Fecha y hora de emisi&oacute;n<br />${record.createdDate}<br />
</td>
<td align="right">
    <span class="number"><!--#${record.tranid}--></span>
</td>
</tr>
</table>
</macro>


<macro id="nlfooter">
    <table class="footer" style="width: 100%;"><tr>

        <#if record.custbody_efx_fe_gbl_folio?has_content>

        <td><barcode codetype="code128" showtext="true" value="${record.custbody_efx_fe_gbl_folio}"/></td>

        <#else>
        <td><barcode codetype="code128" showtext="true" value="${record.tranid}"/></td>
    </#if>

        <td align="right"><pagenumber/> de <totalpages/></td>
        </tr></table>
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
    color: #161616;
}
td {
    padding: 4px 6px;
}
td p { align:left }
b {
    font-weight: bold;
    color: #000000;
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
table.desglose td {
    font-size: 4pt;
    padding-top: 0px;
    padding-bottom: 0px;
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
td.subtotal{
    text-align: right;
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
    color: #ffffff;
    background-color: #e3e3e3;
    height: 1px;
}
</style>
</head>
<body header="nlheader" header-height="10%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">

<#assign "desglosa_cliente" = record.entity.custentity_efx_cmp_registra_ieps>
<#assign "tipoGBL" = record.custbody_efx_fe_gbl_type>

<#assign "desglose_json_body" = record.custbody_efx_fe_tax_json>
<#assign "desglose_body" = desglose_json_body?eval>
<#assign "desglose_ieps" = desglose_body.rates_ieps>
<#assign "desglose_iva" = desglose_body.rates_iva>
<#assign "ieps_total" = desglose_body.ieps_total>
<#assign "iva_total" = desglose_body.iva_total>
<#assign "local_total" = desglose_body.local_total>
<#assign "desglose_ret" = desglose_body.rates_retencion>
<#assign "desglose_loc" = desglose_body.rates_local>
<#assign "desglose_total_discount" = desglose_body.descuentoSinImpuesto>


<#assign "cabecera_total" = desglose_body.total>
<#assign "cabecera_subtotal" = desglose_body.subtotal>

<#assign "obj_totales_imp"= {}>
<#assign totaliepsGBL = 0/>
<#assign totalivaGBL = 0/>
<#assign totalretGBL = 0/>
<#assign totallocGBL = 0/>
<#assign totalivaimp = 0/>
<#assign totaldiscount = 0/>
<#assign totaliepsimp = 0/>

<#if record.custbody_efx_fe_kiosko_customer?has_content>
<table style="width: 100%; margin-top: 10px;"><tr>
    <td class="body" colspan="14" style="background-color: #e3e3e3; font-size:9px;"><b>Cliente</b></td>
    <td></td>
    <td class="body" colspan="14" style=" font-size:9px"><b></b></td>
</tr>
    <tr>
        <td colspan="14" rowspan="2" style="border: 1px; border-color: #e3e3e3; font-size:9px;">${record.custbody_efx_fe_kiosko_name}<br/>${record.billaddress?upper_case}<br/>RFC: ${record.custbody_efx_fe_kiosko_rfc?upper_case}<br/></td>
        <td></td>


        <td align="left" colspan="14" style="font-size:9px;"> </td>
    </tr>
</table>
<#else>
<table style="width: 100%; margin-top: 10px;"><tr>
    <td class="body" colspan="14" style="background-color: #e3e3e3; font-size:9px;"><b>Cliente</b></td>
    <td></td>
    <td class="body" colspan="14" style=" font-size:9px"><b></b></td>
</tr>
    <tr>
        <td colspan="14" rowspan="2" style="border: 1px; border-color: #e3e3e3; font-size:9px;">${record.entity.companyname?upper_case}<br/>${record.billaddress?upper_case}<br/>RFC: ${record.custbody_mx_customer_rfc?upper_case}<br/></td>
        <td></td>


        <td align="left" colspan="14" style="font-size:9px;"> </td>
    </tr>
</table>
</#if>

<table class="body" style="width: 100%; margin-top: 9px;"><tr>
    <th colspan="3">Términos de crédito</th>
    <th colspan="3">Referencia cliente</th>
    <th colspan="3">Orden de venta</th>
    <th colspan="3">Cotizaci&oacute;n</th>
    <th colspan="3">No. de pedido</th>

</tr>
    <tr>
        <td colspan="3" style="font-size:9px;">${record.terms}</td>
        <td colspan="3" style="font-size:9px;">${record.entity.comments}</td>
        <td colspan="3" style="font-size:9px;">${record.createdfrom?keep_after("#")}</td>
        <td colspan="3" style="font-size:9px;">${record.createdfrom.createdfrom?keep_after("#")}</td>
        <td colspan="3" style="font-size:9px;">${record.otherrefnum}</td>

    </tr>
    <!--<tr>
<th colspan= "18" style="width: 100%;">Comentarios</th>
</tr>
<tr>
<td colspan= "18" style="width: 100%; font-size:10px;">${record.memo}</td>
</tr>-->
</table>

<#if record.item?has_content>
<#assign "line_discount"= 0>
<#assign "importe_discount" = []>
<#list record.item as item>
<#assign "tipo_articulo" = item.item?keep_before(" ")>
<#if tipo_articulo == "Descuento">
<#assign "importe_discount" = importe_discount+ [item.grossamt]>
<#else>
<#assign "importe_discount" = importe_discount+ [0]>
</#if>
</#list>
<#assign "importe_discount" = importe_discount+ [0]>
<#assign "descuento_total" = 0>

<#if tipoGBL=="" || tipoGBL=="Detalle de Articulo">
<table class="itemtable" style="width: 100%; margin-top: 3px; border: 1px; border-color: #e3e3e3;">
    <#list record.item as item><#if item_index==0>
    <thead>
    <tr style= "margin-top: 0px; padding-top: 0px; padding-bottom: 0px">
        <th align="center" colspan="2" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Partida</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código</th>
        <th align="center" colspan="5" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código<br/>Clave</th>
        <th align="center" colspan="18" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">
            <table style="width: 100%; margin-top: 0px; margin-bottom: 0px; border: 1px; border-color: #e3e3e3">
                <tr>
                    <th align="center" colspan="18" style="font-size: 5pt; padding-top: 0px; padding-bottom: 2px; padding-left: 0px; padding-right: 0px;">Descripción</th>
                </tr>
                <tr>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Base:</td>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px; margin-top: 0px">Impuesto:</td>
                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Factor:</td>
                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Tasa:</td>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Importe:</td>
                </tr>
            </table></th>
        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Clave<br/>SAT</th>
        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Unidad</th>
        <th align="center" colspan="9" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Nota</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Cantidad</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Precio sin<br/>impuesto</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Impuesto</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">${item.amount@label}</th>
    </tr>
    </thead>
</#if>

<#assign "tipo_articulo" = item.item?keep_before(" ")>
<#assign "line_number"= item_index + 1>
<#if item.quantity?has_content==false>
<#assign "line_discount" = line_discount + 1>
</#if>
<#assign "line_number"= line_number - line_discount>
<#if item.quantity?has_content>
<tr>

    <#assign "desglose_json" = item.custcol_efx_fe_tax_json>
    <#assign "desglose" = desglose_json?eval>


    <td align="center" colspan="2" line-height="150%" style="border-left: 0px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${nsformat_rate(line_number)?keep_before("$")}</td> 
    <td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${item.item?keep_before(" ")}</td>
    <td align="center" colspan="5" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding:0;">${item.custcol_mx_txn_line_sat_item_code?keep_before(" ")}</td>

    <td colspan="18" style="margin: 0; padding: 0;">
        <table style="width: 100%">
            <tr>
                <td colspan= "18" style="border-left: 1px; border-color: #e3e3e3; font-size: 6pt; padding-right: 1px; padding-left: 1px; padding-top: 1px; padding-bottom: 0px;">${item.description}</td>
            </tr>

            <tr>
                <td colspan="18" style= "border-left: 1px; border-color: #e3e3e3;">

                    <table  style="width: 100%; margin-top: 0px; margin-bottom: 0px;">

                        <#if desglose.ieps.name?has_content>
                        <tr>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(desglose.ieps.base_importe)?keep_before("$")}</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${desglose.ieps.name}</td>
                            <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${desglose.ieps.factor}</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${desglose.ieps.rate}%</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(desglose.ieps.importe)?keep_before("$")}</td>
                        </tr>
                    </#if>

                    <#if desglose.iva.name?has_content>
            <tr>

                <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(desglose.iva.base_importe)?keep_before("$")}</td>
                <td align= "left" colspan="4" style="font-size: 5pt;">${desglose.iva.name}</td>
                <td align= "left" colspan="2" style="font-size: 5pt;">${desglose.iva.factor}</td>
                <td align= "left" colspan="4" style="font-size: 5pt;">${desglose.iva.rate}%</td>
                <td align= "left" colspan="4" style="font-size: 5pt;">${nsformat_rate(desglose.iva.importe)?keep_before("$")}</td>
            </tr>
        </#if>

        </table>

    </td>
</tr>
<#if item.custcol_mx_txn_line_sat_cust_req_num?has_content>
<tr style="padding:0px 0px;">
    <td colspan="6" style="font-size: 4pt; padding-top: 1px;  padding-bottom: 1px;"><b>Pedimento:</b> </td>
    <td colspan="13" style="font-size: 4pt; padding-top: 1px;  padding-bottom: 1px;">${item.custcol_mx_txn_line_sat_cust_req_num}</td>
</tr>
</#if>

</table>
</td>

<#assign "units_sat" = item.units>

<td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${units_sat}</td>
<td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.units}</td>
<td align="center" colspan="9" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.custcol_tko_nota}</td>
<td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.quantity}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3; font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${nsformat_rate(item.rate)?keep_before("$")}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.tax1amt}</td>

<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.grossamt}</td>
</tr>
</#if>

</#list></table>

<#elseif tipoGBL=="Articulo Global">
<table class="itemtable" style="width: 100%; margin-top: 3px; border: 1px; border-color: #e3e3e3;">
    <#list record.item as item><#if item_index==0>
    <thead>
    <tr style= "margin-top: 0px; padding-top: 0px; padding-bottom: 0px">
        <th align="center" colspan="2" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Partida</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código</th>
        <th align="center" colspan="5" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código<br/>Clave</th>
        <th align="center" colspan="18" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">
            <table style="width: 100%; margin-top: 0px; margin-bottom: 0px; border: 1px; border-color: #e3e3e3">
                <tr>
                    <th align="center" colspan="18" style="font-size: 5pt; padding-top: 0px; padding-bottom: 2px; padding-left: 0px; padding-right: 0px;">Descripción</th>
                </tr>
                <tr>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Base:</td>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px; margin-top: 0px">Impuesto:</td>
                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Factor:</td>
                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Tasa:</td>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Importe:</td>
                </tr>
            </table></th>
        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Clave<br/>SAT</th>
        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Unidad</th>
        <th align="center" colspan="9" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Nota</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Cantidad</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Precio sin<br/>impuesto</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Impuesto</th>
      
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">${item.amount@label}</th>
    </tr>
    </thead>
</#if>

<#assign "tipo_articulo" = item.item?keep_before(" ")>
<#assign "line_number"= item_index + 1>
<#if item.quantity?has_content==false>
<#assign "line_discount" = line_discount + 1>
</#if>
<#assign "line_number"= line_number - line_discount>
<#if item.quantity?has_content>
<tr>

    <#assign "desglose_json" = item.custcol_efx_fe_gbl_json>
    <#assign "desglose" = desglose_json?eval>


    <td align="center" colspan="2" line-height="150%" style="border-left: 0px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${line_number}</td>
    <td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${item.item?keep_before(" ")}</td>
    <td align="center" colspan="5" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding:0;">01010101</td>

    <td colspan="18" style="margin: 0; padding: 0;">
        <table style="width: 100%">
            <tr>
                <td colspan= "18" style="border-left: 1px; border-color: #e3e3e3; font-size: 6pt; padding-right: 1px; padding-left: 1px; padding-top: 1px; padding-bottom: 0px;">${item.description}</td>
            </tr>

            <tr>
                <td colspan="18" style= "border-left: 1px; border-color: #e3e3e3;">

                    <table style= "width: 100%; margin-top: 0px; margin-bottom: 0px;">

                        <#if desglose.monto_ieps_gbl?has_content>
                        <#list desglose.monto_ieps_gbl as ieps_l_rate, ieps_l_total>
                        <#list desglose.bases_ieps_gbl as ieps_b_rate, ieps_b_total>
                        <#if ieps_l_rate == ieps_b_rate>

                        <tr style="padding:0px 0px;">

                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ieps_b_total)?keep_before("$")}</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">IEPS ${ieps_b_rate}</td>
                            <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">003</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${ieps_b_rate}%</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ieps_l_total)?keep_before("$")}</td>

                        </tr>




                        <#if obj_totales_imp?has_content>
                        <#assign "conteos" = 0>
                        <#list obj_totales_imp?keys as key>

                        <#if key == ieps_l_rate>
                        <#assign "conteos" = 1>

                        <#assign "total_rate" = obj_totales_imp[key] + ieps_l_total?number>
                        <#assign "obj_totales_imp"= obj_totales_imp + {ieps_l_rate : total_rate}>

                    </#if>
                </#list>
                <#if conteos == 0>
                <#assign "obj_totales_imp"= obj_totales_imp + {ieps_l_rate : ieps_l_total?number}>
            </#if>
            <#else>
            <#assign "obj_totales_imp"= obj_totales_imp + {ieps_l_rate : ieps_l_total?number}>
        </#if>




        <#assign totaliepsGBL = totaliepsGBL + ieps_l_total?number>
    </#if>
</#list>
</#list>
</#if>

<#if desglose.monto_iva_gbl?has_content>
<#list desglose.monto_iva_gbl as iva_l_rate, iva_l_total>
<#list desglose.bases_iva_gbl as iva_b_rate, iva_b_total>
<#if iva_l_rate == iva_b_rate>

<tr style="padding:0px 0px;">

    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(iva_b_total)?keep_before("$")}</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">IVA ${iva_b_rate}</td>
    <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">002</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${iva_b_rate}%</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(iva_l_total)?keep_before("$")}</td>

</tr>




<#if obj_totales_imp?has_content>
<#assign "conteos" = 0>
<#list obj_totales_imp?keys as key>

<#if key == iva_l_rate>
<#assign "conteos" = 1>

<#assign "total_rate" = obj_totales_imp[key] + iva_l_total?number>
<#assign "obj_totales_imp"= obj_totales_imp + {iva_l_rate : total_rate}>

</#if>
</#list>
<#if conteos == 0>
<#assign "obj_totales_imp"= obj_totales_imp + {iva_l_rate : iva_l_total?number}>
</#if>
<#else>
<#assign "obj_totales_imp"= obj_totales_imp + {iva_l_rate : iva_l_total?number}>
</#if>




<#assign totalivaGBL = totalivaGBL + iva_l_total?number>
</#if>
</#list>
</#list>
</#if>

<#if desglose.monto_ret_gbl?has_content>
<#list desglose.monto_ret_gbl as ret_l_rate, ret_l_total>
<#list desglose.bases_ret_gbl as ret_b_rate, ret_b_total>
<#if ret_l_rate == ret_b_rate>

<tr style="padding:0px 0px;">

    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ret_b_total)?keep_before("$")}</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">Retencion ${ret_b_rate}</td>
    <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">002</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${ret_b_rate}%</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ret_l_total)?keep_before("$")}</td>

</tr>

<#if obj_totales_imp?has_content>
<#assign "conteos" = 0>
<#list obj_totales_imp?keys as key>

<#if key == ret_l_rate>
<#assign "conteos" = 1>

<#assign "total_rate" = obj_totales_imp[key] + ret_l_total?number>
<#assign "obj_totales_imp"= obj_totales_imp + {ret_l_rate : total_rate}>

</#if>
</#list>
<#if conteos == 0>
<#assign "obj_totales_imp"= obj_totales_imp + {ret_l_rate : ret_l_total?number}>
</#if>
<#else>
<#assign "obj_totales_imp"= obj_totales_imp + {ret_l_rate : ret_l_total?number}>
</#if>




<#assign totalretGBL = totalretGBL + ret_l_total?number>
</#if>
</#list>
</#list>
</#if>

<#if desglose.monto_local_gbl?has_content>
<#list desglose.monto_local_gbl as local_l_rate, local_l_total>
<#list desglose.bases_local_gbl as local_b_rate, local_b_total>
<#if local_l_rate == local_b_rate>

<tr style="padding:0px 0px;">

    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(local_b_total)?keep_before("$")}</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">Local ${local_b_rate}</td>
    <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">002</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${local_b_rate}%</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(local_l_total)?keep_before("$")}</td>

</tr>




<#if obj_totales_imp?has_content>
<#assign "conteos" = 0>
<#list obj_totales_imp?keys as key>

<#if key == local_l_rate>
<#assign "conteos" = 1>

<#assign "total_rate" = obj_totales_imp[key] + local_l_total?number>
<#assign "obj_totales_imp"= obj_totales_imp + {local_l_rate : total_rate}>

</#if>
</#list>
<#if conteos == 0>
<#assign "obj_totales_imp"= obj_totales_imp + {local_l_rate : local_l_total?number}>
</#if>
<#else>
<#assign "obj_totales_imp"= obj_totales_imp + {local_l_rate : local_l_total?number}>
</#if>




<#assign totallocGBL = totallocGBL + local_l_total?number>
</#if>
</#list>
</#list>
</#if>


</table>

</td>
</tr>

</table>
</td>

<#assign "units_sat" = item.units>



<td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${units_sat}</td>
<td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.units}</td>
<td align="center" colspan="5" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.custcol_tko_nota}</td>
<td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.quantity}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3; font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${nsformat_rate(item.custcol_efx_fe_subtotal_gbl)?keep_before("$")}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${nsformat_rate(item.custcol_efx_fe_taxtotal_gbl)?keep_before("$")}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${nsformat_rate(desglose.descuentoSinImpuesto)?keep_before("$")}</td>
<#assign "descuento_total" = descuento_total + desglose.descuentoSinImpuesto?number>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.grossamt}</td>
</tr>
</#if>

</#list></table>
<#else>
<table class="itemtable" style="width: 100%; margin-top: 3px; border: 1px; border-color: #e3e3e3;">
    <#list record.item as item><#if item_index==0>
    <thead>
    <tr style= "margin-top: 0px; padding-top: 0px; padding-bottom: 0px">
        <th align="center" colspan="2" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Partida</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código</th>
        <th align="center" colspan="5" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código<br/>Clave</th>
        <th align="center" colspan="18" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">
            <table style="width: 100%; margin-top: 0px; margin-bottom: 0px; border: 1px; border-color: #e3e3e3">
                <tr>
                    <th align="center" colspan="18" style="font-size: 5pt; padding-top: 0px; padding-bottom: 2px; padding-left: 0px; padding-right: 0px;">Descripción</th>
                </tr>
                <tr>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Base:</td>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px; margin-top: 0px">Impuesto:</td>
                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Factor:</td>
                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Tasa:</td>
                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Importe:</td>
                </tr>
            </table></th>
        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Clave<br/>SAT</th>
        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Unidad</th>
        <th align="center" colspan="9" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Nota</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Cantidad</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Precio sin<br/>impuesto</th>
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Impuesto</th>
      
        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">${item.amount@label}</th>
    </tr>
    </thead>
</#if>

<#assign "tipo_articulo" = item.item?keep_before(" ")>
<#assign "line_number"= item_index + 1>
<#if item.quantity?has_content==false>
<#assign "line_discount" = line_discount + 1>
</#if>
<#assign "line_number"= line_number - line_discount>
<#if item.quantity?has_content>
<tr>

    <#assign "desglose_json" = item.custcol_efx_fe_gbl_json>
    <#assign "desglose" = desglose_json?eval>


    <td align="center" colspan="2" line-height="150%" style="border-left: 0px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${line_number}</td>
    <td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${item.item?keep_before(" ")}</td>
    <td align="center" colspan="5" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding:0;">01010101</td>

    <td colspan="18" style="margin: 0; padding: 0;">
        <table style="width: 100%">
            <tr>
                <td colspan= "18" style="border-left: 1px; border-color: #e3e3e3; font-size: 6pt; padding-right: 1px; padding-left: 1px; padding-top: 1px; padding-bottom: 0px;">${item.description}</td>
            </tr>

            <tr>
                <td colspan="18" style= "border-left: 1px; border-color: #e3e3e3;">

                    <table style= "width: 100%; margin-top: 0px; margin-bottom: 0px;">

                        <#if desglose.rates_ieps_data?has_content>
                        <#list desglose.rates_ieps_data as ieps_l_rate, ieps_l_total>
                        <#list desglose.bases_ieps as ieps_b_rate, ieps_b_total>
                        <#if ieps_l_rate == ieps_b_rate>

                        <tr>

                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ieps_b_total)?keep_before("$")}</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">IEPS ${ieps_b_rate}</td>
                            <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">003</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${ieps_l_rate}%</td>
                            <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ieps_l_total)?keep_before("$")}</td>
                        </tr>

                        <#if obj_totales_imp?has_content>
                        <#assign "conteos" = 0>
                        <#list obj_totales_imp?keys as key>

                        <#if key == ieps_l_rate>
                        <#assign "conteos" = 1>

                        <#assign "total_rate" = obj_totales_imp[key] + ieps_l_total?number>
                        <#assign "obj_totales_imp"= obj_totales_imp + {ieps_l_rate : total_rate}>

                    </#if>
                </#list>
                <#if conteos == 0>
                <#assign "obj_totales_imp"= obj_totales_imp + {ieps_l_rate : ieps_l_total?number}>
            </#if>
            <#else>
            <#assign "obj_totales_imp"= obj_totales_imp + {ieps_l_rate : ieps_l_total?number}>
        </#if>

        <#assign totaliepsGBL = totaliepsGBL + ieps_l_total?number>
    </#if>
</#list>
</#list>
</#if>

<#if desglose.rates_iva_data?has_content>
<#list desglose.rates_iva_data as iva_l_rate, iva_l_total>
<#list desglose.bases_iva as iva_b_rate, iva_b_total>
<#if iva_l_rate == iva_b_rate>

<tr>

    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(iva_b_total)?keep_before("$")}</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">IVA ${iva_b_rate}</td>
    <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">002</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${iva_l_rate}%</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(iva_l_total)?keep_before("$")}</td>
</tr>

<#if obj_totales_imp?has_content>
<#assign "conteos" = 0>
<#list obj_totales_imp?keys as key>

<#if key == iva_l_rate>
<#assign "conteos" = 1>

<#assign "total_rate" = obj_totales_imp[key] + iva_l_total?number>
<#assign "obj_totales_imp"= obj_totales_imp + {iva_l_rate : total_rate}>

</#if>
</#list>
<#if conteos == 0>
<#assign "obj_totales_imp"= obj_totales_imp + {iva_l_rate : iva_l_total?number}>
</#if>
<#else>
<#assign "obj_totales_imp"= obj_totales_imp + {iva_l_rate : iva_l_total?number}>
</#if>

<#assign totalivaGBL = totalivaGBL + iva_l_total?number>
</#if>
</#list>
</#list>
</#if>

<#if desglose.rates_retencion_data?has_content>
<#list desglose.rates_retencion_data as ret_l_rate, ret_l_total>
<#list desglose.bases_retencion as ret_b_rate, ret_b_total>
<#if ret_l_rate == ret_b_rate>

<tr>

    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ret_b_total)?keep_before("$")}</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">Retencion ${ret_b_rate}</td>
    <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">002</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${ret_l_rate}%</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(ret_l_total)?keep_before("$")}</td>
</tr>

<#if obj_totales_imp?has_content>
<#assign "conteos" = 0>
<#list obj_totales_imp?keys as key>

<#if key == ret_l_rate>
<#assign "conteos" = 1>

<#assign "total_rate" = obj_totales_imp[key] + ret_l_total?number>
<#assign "obj_totales_imp"= obj_totales_imp + {ret_l_rate : total_rate}>

</#if>
</#list>
<#if conteos == 0>
<#assign "obj_totales_imp"= obj_totales_imp + {ret_l_rate : ret_l_total?number}>
</#if>
<#else>
<#assign "obj_totales_imp"= obj_totales_imp + {ret_l_rate : ret_l_total?number}>
</#if>

<#assign totalretGBL = totalretGBL + ret_l_total?number>
</#if>
</#list>
</#list>
</#if>

<#if desglose.rates_local_data?has_content>
<#list desglose.rates_local_data as loc_l_rate, loc_l_total>
<#list desglose.bases_local as loc_b_rate, loc_b_total>
<#if loc_l_rate == loc_b_rate>

<tr>

    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(loc_b_total)?keep_before("$")}</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">Local ${loc_b_rate}</td>
    <td align= "left" colspan="2" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">002</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${loc_l_rate}%</td>
    <td align= "left" colspan="4" style="font-size: 5pt; padding-top: 0px; padding-bottom: 0px;">${nsformat_rate(loc_l_total)?keep_before("$")}</td>
</tr>

<#if obj_totales_imp?has_content>
<#assign "conteos" = 0>
<#list obj_totales_imp?keys as key>

<#if key == loc_l_rate>
<#assign "conteos" = 1>

<#assign "total_rate" = obj_totales_imp[key] + loc_l_total?number>
<#assign "obj_totales_imp"= obj_totales_imp + {loc_l_rate : total_rate}>

</#if>
</#list>
<#if conteos == 0>
<#assign "obj_totales_imp"= obj_totales_imp + {loc_l_rate : loc_l_total?number}>
</#if>
<#else>
<#assign "obj_totales_imp"= obj_totales_imp + {loc_l_rate : loc_l_total?number}>
</#if>

<#assign totallocGBL = totallocGBL + loc_l_total?number>
</#if>
</#list>
</#list>
</#if>

</table>

</td>
</tr>

</table>
</td>


<#assign "units_sat" = item.units>


<td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${units_sat}</td>
<td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.units}</td>
<td align="center" colspan="5" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.custcol_tko_nota}</td>
<td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.quantity}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3; font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${nsformat_rate(item.custcol_efx_fe_subtotal_gbl)?keep_before("$")}</td>
<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${nsformat_rate(item.custcol_efx_fe_taxtotal_gbl)?keep_before("$")}</td>

<td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.grossamt}</td>
</tr>
</#if>

</#list></table>
</#if>




</#if>

<table>

    <#assign "desglose_json_body" = record.custbody_efx_fe_tax_json>
    <#assign "desglose_body" = desglose_json_body?eval>
    <#assign "desglose_ieps" = desglose_body.rates_ieps>
    <#assign "desglose_iva" = desglose_body.rates_iva>
    <#assign "desglose_ret" = desglose_body.rates_retencion>
    <#assign "desglose_loc" = desglose_body.rates_local>



</table>


<table style="width: 100%; margin-top: 5px; padding: 0px; border: 1px; border-color: #e3e3e3;">
    <tr>
        <td colspan="6" style="margin: 0px; padding: 0px;">
            <table class="total" style="width: 100%; margin-top: 0px; border: 0px; border-color: #e3e3e3;"><tr>
                <td align="left" colspan="2" style="border-top: 0px; border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;border-right: 0px;"><strong>Cantidad con letra:</strong> ${record.custbody_efx_fe_total_text}</td>
            </tr>
                <tr>
                    <td align="left" style="border-right: 1px; border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;"><strong>Elaboró:</strong> ${record.salesrep?upper_case}</td>
                    <td align="left" style="border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;border-right: 0px;"><strong>Asesor:</strong> ${record.salesrep}</td>
                </tr>
                <tr>
                    <td align="left" style="border-right: 1px; border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;"><strong> </strong> </td>
                    <td align="left" style="font-size: 7pt; border-bottom: 1px; border-color: #e3e3e3; padding-left: 0px;border-right: 0px;">
                        <table style="margin-left: 0px; padding-left: 0px;margin-top: 0px; padding-top: 0px;">
                            <tr>
                                <td align="left" style= "font-size: 7pt; padding-left: 0px;margin-top: 0px; padding-top: 0px;"><strong> </strong></td>
                                <td style= "font-size: 7pt;margin-top: 0px; padding-top: 0px;">
                                    <table style="margin-top: 0px; padding-top: 0px;">
                                        <tr><td align="left" style= "font-size: 7pt;margin-top: 0px; padding-top: 0px;border-right: 0px;" colspan="2"><strong></strong></td></tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan= "2" style= "font-size: 7pt;border-color: #e3e3e3; border-right: 0px;"> <b>Comentarios: </b> ${record.memo?upper_case}</td>
                </tr>
            </table>
        </td>
        <td colspan="2" style="margin: 0px; padding: 0;">
            <table style="width: 100%; margin-top: 0px; margin-left: 0px; border: 0px; border-color: #e3e3e3;">
                <tr>
                    <td colspan="1" style="font-size: 7pt; border-color: #e3e3e3;border-left: 1px;"><b>Subtotal</b></td>
                    <#if record.custbody_efx_fe_gbl_subtotal?has_content>
                    <td align="right" colspan="1" style="font-size: 7pt;">${nsformat_rate(record.custbody_efx_fe_gbl_subtotal,"MXN")}</td>
                    <#else>
                    <td align="right" colspan="1" style="font-size: 7pt;">${nsformat_rate(record.subtotal,"MXN")}</td>
                </#if>

                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>Descuento</b></td>
                    <#if descuento_total != 0>
                    <td align="right" colspan="1" style="font-size: 7pt;"><#if desglose_total_discount?has_content>${nsformat_rate(desglose_total_discount, "MXN")}</#if></td>
                    <#else>
                    <#if record.discounttotal != 0>
                    <td align="right" colspan="1" style="font-size: 7pt;">${record.discounttotal}</td>
                    <#else>
                    <td align="right" colspan="1" style="font-size: 7pt;">0.00</td>
                </#if>
            </#if>

    </tr>
    <#if tipoGBL!="Detalle de Articulo" && tipoGBL!="">
    <tr>
        <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>IVA</b></td>
        <td align="right" colspan="1" style="font-size: 7pt;">${nsformat_rate(totalivaGBL, "MXN")}</td>
    </tr>

    <#else>
    <tr>
        <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>IVA</b></td>
        <td align="right" colspan="1" style="font-size: 7pt;">${nsformat_rate(desglose_body.iva_total,"MXN")}</td>
    </tr>
</#if>
<#if tipoGBL!="Detalle de Articulo" && tipoGBL!="">
<#list obj_totales_imp as Iva_rate, Iva_total>
<#assign iva_ratenum = Iva_rate?number>
<#assign iva_tasaocuota = iva_ratenum/100>
<#if Iva_rate == "16" || Iva_rate == "0">
<tr>
    <td colspan="2" style="font-size: 5pt;">
        IVA ${Iva_rate}%: ${nsformat_rate(Iva_total,"MXN")}<br/>
    </td>
</tr>
</#if>
</#list>
<#else>
<tr>
    <td colspan="2" style="font-size: 5pt; border-color: #e3e3e3;border-left: 1px;">
        <#list desglose_iva as name_iva, price_iva>
        ${name_iva}: ${nsformat_rate(price_iva)?keep_before("$")}<br/>
    </#list>
    </td>
</tr>

<tr>
    <td colspan="2" style="font-size: 5pt; border-left: 1px; border-color: #e3e3e3;">
        <#list desglose_ieps as name_ieps, price_ieps>
        ${name_ieps}: ${nsformat_rate(price_ieps)?keep_before("$")}<br/>
    </#list>
    </td>
</tr>
</#if>


<tr>
    <td colspan="1" style="font-size: 7pt; border-color: #e3e3e3; border-left: 1px;"> <b>Retenciones</b></td>
    <td align="right" colspan="1" style="font-size: 7pt;">${nsformat_rate(desglose_body.retencion_total,"MXN")}</td>
</tr>

<tr>
    <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>Total</b></td>
    <td align="right" colspan="1" style="font-size: 7pt;"><#if cabecera_total?has_content>${nsformat_rate(cabecera_total,"MXN")}</#if></td>
</tr>
</table>
</td>
</tr>
</table>

<table style="width: 100%; margin-top: 10px; padding: 0; border: 0px; border-color: #e3e3e3;">
    <tr>
        <th colspan="6">Detalles del comprobante</th>
    </tr>
    <tr>
        <td colspan="1" style="font-size: 7pt;"><b>Tipo de comprobante:</b></td>
        <td colspan="2" style="font-size: 7pt;">INGRESO</td>
        <td colspan="1" style="font-size: 7pt;"><b>Forma de pago:</b></td>
        <td colspan="2" style="font-size: 7pt;">${record.custbody_mx_txn_sat_payment_method?upper_case}</td>
    </tr>
    <tr>
        <td colspan="1" style="font-size: 7pt;"><b>Moneda:</b></td>
        <td colspan="2" style="font-size: 7pt;">${record.currency?upper_case}</td>
        <td colspan="1" style="font-size: 7pt;"><b>Método de pago:</b></td>
        <td colspan="2" style="font-size: 7pt;">${record.custbody_mx_txn_sat_payment_term?upper_case}</td>
    </tr>
    <tr>
        <td colspan="1" style="font-size: 7pt;"><b>Uso del CFDI:</b></td>
        <td colspan="2" style="font-size: 7pt;">${record.custbody_mx_cfdi_usage?upper_case}</td>

    </tr>
    <tr>
        <td colspan="1" style="font-size: 7pt;"><b>Régimen fiscal:</b></td>
        <td colspan="2" style="font-size: 7pt;">${record.subsidiary.custrecord_mx_sat_industry_type?upper_case}</td>

    </tr>

</table>

<#if record.custbody_efx_fe_leyendafiscal == true>
<#if record.custbody_efx_fe_leyendafiscal_detail?has_content>
<#assign leyendaFiscal = record.custbody_efx_fe_leyendafiscal_detail>
<table style="width: 100%; margin-top: 10px; padding: 0; border: 0px; border-color: #e3e3e3;">
    <tr>
        <th>Leyenda Fiscal</th>
    </tr>
    <#if leyendaFiscal.custrecord_efx_fe_leyf_disposicionfiscal?has_content>
    <tr>
        <td style="font-size: 7pt;"><b>Disposicion Fiscal:</b> ${leyendaFiscal.custrecord_efx_fe_leyf_disposicionfiscal}</td>
    </tr>
    </#if>

    <#if leyendaFiscal.custrecord_efx_fe_leyf_norma?has_content>
    <tr>
        <td style="font-size: 7pt;"><b>Norma:</b> ${leyendaFiscal.custrecord_efx_fe_leyf_norma}</td>
    </tr>
    </#if>

    <tr>
        <td style="font-size: 7pt;"><b>Texto Leyenda:</b> ${leyendaFiscal.custrecord_efx_fe_leyf_textoleyenda}</td>
    </tr>

</table>
</#if>
</#if>



<#if certData?has_content>
<table class="total" style="width: 100%; margin-top: 10px; border-left: 1px; border-color: #e3e3e3;"><tr>
    <td style="background-color: #e3e3e3; color: #333333;font-weight: bold;">Información CFDI</td>
</tr>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>UUID</b><br/>${certData.custbody_mx_cfdi_uuid}</td>
    </tr>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>Cadena original</b><br/>${certData.custbody_mx_cfdi_cadena_original}</td>
    </tr>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>Firma del CFDI</b><br/>${certData.custbody_mx_cfdi_signature}</td>
    </tr>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>Firma del SAT</b><br/>${certData.custbody_mx_cfdi_sat_signature}</td>

    </tr>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-bottom: 1px; border-color: #e3e3e3;">
            <table align="left" style="width: 100%; margin-top: 10px;"><tr>
                <#assign qrcodeImage = "data:image/png;base64, " + certData.custbody_mx_cfdi_qr_code >
                <td align="center">
                    <img style="width: 100px;height:100px" src="${qrcodeImage}" /></td>
            </tr>
                <tr>
                    <td align="center"></td>
                </tr></table>
        </td>

    </tr></table>
</#if>




</body>
</pdf>