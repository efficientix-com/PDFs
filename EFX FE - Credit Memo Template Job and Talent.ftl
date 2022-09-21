<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <#if custom?has_content>
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
<#assign "customCompanyInfo" = companyinformation>
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
<#assign dst =  currencySymbolMap[currencyCode] + value?number?string["0.00"]>
<#return dst>
</#function>
</#if>
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
    <macro id="nlheader">
        <table class="header" style="width: 100%;">
            <tr>
                <td colspan="6" align="left" style="font-size: 12px">
                        ${record.subsidiary} <br />
                        <#if certData?has_content>
                            RFC: ${custom.companyInfo.rfc}
                            
                        <#else>
                            RFC: ${subsidiary.federalidnumber}
                        </#if>
                </td>
                <td colspan="2" style="width: 21px;">&nbsp;</td>
                <td colspan="4" style="font-size: 10px;" align="right"><span style="font-size: 12px;"><strong>Nota de Crédito</strong></span><br/>
                    <#if dataXML?has_content>
                        <#assign folio_tran = dataXML.atributos.Serie +""+ dataXML.atributos.Folio>
                        <span class="number" style="font-size: 18px;">${folio_tran}</span>
                        <br/> <br/>Fecha y hora de emisi&oacute;n<br/>${dataXML.atributos.Fecha}<br/>
                    <#else>
                        <span class="number" style="font-size: 18px;">${record.tranid}</span>
                        <br/> <br/>Fecha y hora de emisi&oacute;n<br/>${record.createdDate}<br/>
                    </#if>
                </td>
                <td align="right">
                    <span class="number"><!--#${record.tranid}--></span>
                </td>
            </tr>
        </table>
    </macro>
    <macro id="nlfooter">
        <table class="footer" style="width: 100%;"><tr>
            <td><barcode codetype="code128" showtext="true" value="${record.tranid}"/></td>
            <td align="right"><pagenumber/> of <totalpages/></td>
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
    border-color: #e3e3e3;
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
    color: #000000;
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
table.total {
    page-break-inside: avoid;
}
tr.totalrow {
    background-color: #e3e3e3;
    line-height: 200%;
}
td.totalboxtop {
    font-size: 10pt;
    background-color: #e3e3e3;
}
td.addressheader {
    font-size: 10pt;
    padding-top: 6px;
    padding-bottom: 2px;
}
td.address {
    padding-top: 0;
}
td.totalboxmid {
    font-size: 28pt;
    padding-top: 20px;
    background-color: #e3e3e3;
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
    color: #333333;
    background-color: #e3e3e3;
    height: 1px;
}
</style>
</head>
<body header="nlheader" header-height="10%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">

<table style="width: 100%; margin-top: 10px;">
    <tr>
        <td class="body" style="background-color: #e3e3e3; font-size:9px;"><b>Cliente</b></td>
        <td></td>
    </tr>
    <tr>
        <td rowspan="2" style="border: 1px; border-color: #e3e3e3; font-size:9px;">${record.billaddress?upper_case}<br/>RFC: ${record.custbody_mx_customer_rfc?upper_case}<br/></td>
        <td></td>
    </tr>
</table>

<table class="body" style="width: 100%; margin-top: 10px;"><tr>
    <th colspan="3">Términos de crédito</th>
    <th colspan="3">Factura</th>
    <th colspan="3">No. de Pedido</th>
    <th colspan="3">No. Cita</th>
    <th colspan="6">Concepto de devoluci&oacute;n</th>
</tr>
    <tr>
        <td colspan="3" style="font-size:10px;">${record.entity.terms}</td>
        <td colspan="3" style="font-size:10px;">${record.createdfrom?keep_after("#")}</td>
        <td colspan="3" style="font-size:10px;">${record.otherrefnum}</td>
        <td colspan="3" style="font-size:10px;">${record.custbody_efx_cmp_no_cita}</td>
        <td colspan="6" style="font-size:10px;">${record.custbody_efx_cmp_motivo_devolucion}</td>
    </tr>
</table>



<!--<table style="width: 100%; margin-top: 10px;"><tr>
    <td class="addressheader" colspan="6" style="color: #333333; background-color: #e3e3e3;"><b>Facturar a</b></td>
    <td></td>
    <td class="totalboxtop" colspan="6" style="color: #333333; background-color: #e3e3e3;"><b>Total</b></td>
</tr>
    <tr>
        <td class="addressheader" colspan="6"  style="border: 1px; border-color: #e3e3e3;">${record.billaddress}</td>
        <td></td>
        <td align="right" class="totalboxmid" colspan="6"  style="border: 1px; border-color: #e3e3e3;">${record.total}</td>
    </tr></table>

<table class="body" style="width: 100%; margin-top: 10px;"><tr>
    <th>${record.otherrefnum@label}</th>
    <th>${record.job@label}</th>
    <th>${record.shipmethod@label}</th>
</tr>
    <tr>
        <td>${record.otherrefnum}</td>
        <td>${record.job}</td>
        <td>${record.shipmethod}</td>
    </tr></table>-->
<#if record.item?has_content><#assign "total_cajas" = 0><#assign "total_piezas" = 0>
<!--CODIGO RAUL-->
<table class="itemtable" style="width: 100%; margin-top: 5px; border: 1px; border-color: #e3e3e3;"><#list record.item as item><#if item_index==0>
    <thead>
    <tr>
        <th align="left" colspan="2" style="font-size: 6pt;">P</th>
        <th colspan="4" style="font-size: 5pt;">Código</th>
        <th colspan="5" style="font-size: 5pt;">Código<br/>Clave</th>
        <th colspan="18" style="font-size: 5pt;">Descripción</th>
        <th align="left" colspan="3" style="font-size: 5pt;">Unidad</th>
        <th align="left" colspan="2" style="font-size: 5pt;">Cant</th>
        <th align="left" colspan="4" style="font-size: 5pt;">Precio<br/>sin impuesto</th>
        <th align="left" colspan="4" style="font-size: 5pt;">Impuesto</th>
        <th align="left" colspan="4" style="font-size: 5pt;">Desc.</th>
        <th align="left" colspan="4" style="font-size: 5pt;">${item.amount@label}</th>
    </tr>
    </thead>
</#if>
<tr>
    <#assign "desglose_json" = item.custcol_efx_fe_tax_json>
    <#if desglose_json?has_content>
    <#assign "desglose" = desglose_json?eval>
</#if>


    <td align="center" colspan="2" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${item_index + 1}</td>
    <td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${item.item?keep_before(" ")}</td>
    <td align="center" colspan="5" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${item.custcol_mx_txn_line_sat_item_code?keep_before(" ")}</td>

    <td colspan="18" style="margin: 0; padding: 0;">
        <table>
            <tr>
                <td style="font-size: 6pt;">${item.description}</td>
            </tr>

            <tr>
                <td>

                    <table>
                        <tr>
                            <td colspan="1" style="font-size: 4pt;">Base:</td>
                            <td colspan="1" style="font-size: 4pt;">Impuesto:</td>
                            <td colspan="1" style="font-size: 4pt;">Factor:</td>
                            <td colspan="1" style="font-size: 4pt;">Tasa:</td>
                            <td colspan="1" style="font-size: 4pt;">Importe:</td>
                        </tr>

                        <#if desglose_json?has_content>
                            <#if desglose.ieps.name?has_content>
                        <tr>
                            <td colspan="1" style="font-size: 5pt;">${desglose.ieps.base}</td>
                            <td colspan="1" style="font-size: 5pt;">${desglose.ieps.name}</td>
                            <td colspan="1" style="font-size: 5pt;">${desglose.ieps.factor}</td>
                            <td colspan="1" style="font-size: 5pt;">${desglose.ieps.rate}%</td>
                            <td colspan="1" style="font-size: 5pt;">${desglose.ieps.importe?number?string["0.00"]}</td>
                        </tr>
                    </#if>

                    <#if desglose.iva.name?has_content>
            <tr>
                <td style="font-size: 5pt;">${desglose.iva.base}</td>
                <td style="font-size: 5pt;">${desglose.iva.name}</td>
                <td style="font-size: 5pt;">${desglose.iva.factor}</td>
                <td style="font-size: 5pt;">${desglose.iva.rate}%</td>
                <td style="font-size: 5pt;">${desglose.iva.importe?number?string["0.00"]}</td>
            </tr>
        </#if>

                    </#if>
        </table>

    </td>
</tr>

</table>
</td>
<#if item.units?has_content>
<#assign "unidades_text" = item.units>
<#assign "cantidad" = item.quantity>
<#assign "cantidad_cajas" = 0>
<#assign "caracter_units" = unidades_text?substring(0, 1)>

<#if caracter_units=="C">
<#assign "cantidad_cajas_text" = unidades_text?replace("C", "")>
<#assign "cantidad_cajas" = cantidad_cajas_text?number>
<#assign total_cajas += item.quantity>
<#assign "piezas_caja" = cantidad_cajas * cantidad>
<#assign total_piezas += piezas_caja>
<#else>
<#assign total_piezas += item.quantity>
</#if>
</#if>

<#assign units_sat = "">
<#if item.units == "Serv.">
    <#assign "units_sat" = "E48">
<#else>
    <#assign "units_sat" = item.units>
</#if>


<td colspan="3" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${units_sat}</td>
<td align="center" colspan="2" style="border-left: 1px; border-right: 1px; border-color: #e3e3e3;font-size: 5pt;">${item.quantity}</td>
<td align="left" colspan="4" style="font-size: 5pt;">${item.rate}</td>
<td colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${item.tax1amt}</td>
<td colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${item.discount}</td>
<td align="right" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt;">${item.grossamt}</td>
</tr>
</#list></table>

<table class="total" style="width: 100%; margin-top: 10px; border: 1px; border-color: #e3e3e3;">

    <#assign "desglose_json_body" = record.custbody_efx_fe_tax_json>
    <#if desglose_json_body?has_content>
    <#assign "desglose_body" = desglose_json_body?eval>
    <#assign "desglose_ieps" = desglose_body.rates_ieps>
    <#assign "desglose_iva" = desglose_body.rates_iva>
    <#assign "desglose_ret" = desglose_body.rates_retencion>
    <#assign "desglose_loc" = desglose_body.rates_local>
    </#if>


    <tr>
        <td align="left" colspan="2" style="border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;"><strong>Cantidad con letra:</strong> ${record.custbody_efx_fe_total_text}</td>
    </tr>
    <tr>
        <td align="left" style="border-right: 1px; border-color: #e3e3e3; font-size: 7pt;"><strong>Elaboró:</strong> ${record.salesrep}</td> <!-- record.custbody_efx_cmp_elaboro -->
    </tr>

</table>
<br />
<table style="width: 100%; margin: 0; padding: 0; border: 1px; border-color: #e3e3e3;">
    <tr>
        <td colspan="6" style="margin: 0px; padding: 0;">
            <table style="width: 100%; margin: 0px; padding: 0; border: 0px; border-color: #e3e3e3;">
                <tr>
                    <th colspan="6">Detalles del comprobante</th>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt;"><b>Tipo de comprobante:</b></td>
                    <td colspan="2" style="font-size: 7pt;">Egreso</td>
                    <td colspan="1" style="font-size: 7pt;"><b>Forma de pago:</b></td>
                    <td colspan="2" style="font-size: 7pt;">${record.custbody_mx_txn_sat_payment_method}</td>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt;"><b>Moneda:</b></td>
                    <td colspan="2" style="font-size: 7pt;">${record.currency}</td>
                    <td colspan="1" style="font-size: 7pt;"><b>Método de pago:</b></td>
                    <td colspan="2" style="font-size: 7pt;">${record.custbody_mx_txn_sat_payment_term}</td>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt;"><b>Uso del CFDI:</b></td>
                    <td colspan="2" style="font-size: 7pt;">${record.custbody_mx_cfdi_usage}</td>
                    <td colspan="1" style="font-size: 7pt;"><b>Lugar de expedici&oacute;n:</b></td>
                    <td colspan="2" style="font-size: 7pt;">${record.location.custrecord_efx_lugar_expedicion}</td>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt;"><b>Régimen fiscal:</b></td>
                    <td colspan="2" style="font-size: 7pt;">${record.subsidiary.custrecord_mx_sat_industry_type}</td>
                </tr>

            </table>
        </td>

        <td colspan="2" style="margin: 0px; padding: 0;">
            <table style="width: 100%; margin-top: 0px; margin-left: 0px; border: 0px; border-color: #e3e3e3;">
                <tr>
                    <th colspan="2" style="border-left: 1px; border-color: #e3e3e3;">Resumen:</th>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt; border-left: 1px; border-color: #e3e3e3;"><b>Subtotal</b></td>
                    <td align="right" colspan="1" style="font-size: 7pt;">${record.subtotal}</td>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt; border-left: 1px; border-color: #e3e3e3;"><b>Descuento</b></td>
                    <td align="right" colspan="1" style="font-size: 7pt;">${record.discounttotal}</td>
                </tr>
                <tr>
                    <td colspan="1" style="font-size: 7pt; border-left: 1px; border-color: #e3e3e3;"><b>IVA</b></td>
                    <#if desglose_json_body?has_content>
                    <td align="right" colspan="1" style="font-size: 7pt;">${desglose_body.iva_total}</td>
                </#if>

                </tr>

                <tr>
                    <td colspan="2" style="font-size: 5pt; border-left: 1px; border-color: #e3e3e3;">
                        <#if desglose_json_body?has_content>
                        <#list desglose_iva as name_iva, price_iva>
                        ${name_iva}: ${price_iva?number?string["0.00"]}<br/>
                    </#list>
                    </#if>

                    </td>
                </tr>

    <tr>
        <td colspan="1" style="font-size: 7pt; border-left: 1px; border-color: #e3e3e3;"> <b>IEPS</b></td>
        <#if desglose_json_body?has_content>
        <td align="right" colspan="1" style="font-size: 7pt;">${desglose_body.ieps_total}</td>
    </#if>

    </tr>

    <tr>
        <td colspan="2" style="font-size: 5pt; border-left: 1px; border-color: #e3e3e3;">
            <#if desglose_json_body?has_content>
            <#list desglose_ieps as name_ieps, price_ieps>
            ${name_ieps}: ${price_ieps?number?string["0.00"]}<br/>
        </#list>
        </#if>

        </td>
    </tr>

    <tr>
        <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3; border-left: 1px;"><b>Retenciones ISN</b></td>
        <#if desglose_json_body?has_content>
            <#assign isn = desglose_body.rates_local_data>
        </#if>
        <#if isn?has_content>
            <#list isn as key, value>
                <#if key?number gt 0>
                    <#assign rate_traslados_locales = key?number>
                    <#assign monto_traslados_locales = value.monto>

                    <#else>
                        <#assign rate_retenciones_locales = key?number>
                        <#assign monto_retenciones_locales = value.monto?number>
                </#if>
            </#list>
            <td align="right" colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;">${monto_retenciones_locales}</td>
                
        <#else>
            <td align="right" colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;">0</td>
        </#if>
    </tr>

    <tr>
        <td colspan="1" style="font-size: 7pt; border-left: 1px; border-color: #e3e3e3;"><b>Total</b></td>
        <td align="right" colspan="1" style="font-size: 7pt;">${record.total}</td>
    </tr>
</table>
</td>
</tr>
</table>


<!--CODIGO RAUL FIN-->
</#if>


<br/>
<table>
    <tr>
        <th colspan="1"><b>Politicas de Devoluci&oacute;n</b></th>
    </tr>
    <tr>
        <td colspan="1" style="font-size: 7pt; border-color: #e3e3e3;">

        </td>
    </tr>
</table>

<#if record.custbody_mx_cfdi_uuid?has_content>
<table class="total" style="width: 100%; margin-top: 10px; border-left: 1px; border-color: #e3e3e3;"><tr>
    <td style="background-color: #e3e3e3; color: #333333;font-weight: bold;">Información CFDI</td>
</tr>
    <#if record.custbody_efx_fe_related_cfdi_json?has_content>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>CFDI Relacionados</b><br/>${record.custbody_efx_fe_related_cfdi_json}</td>
    </tr>
</#if>
<#if record.custbody_mx_cfdi_uuid?has_content>
<tr>
    <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>UUID</b><br/>${record.custbody_mx_cfdi_uuid}</td>
</tr>
<tr>
    <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>Cadena Original</b><br/>${record.custbody_mx_cfdi_cadena_original}</td>
</tr>
<tr>
    <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>Firma del CFDI</b><br/>${record.custbody_mx_cfdi_signature}</td>
</tr>
<tr>
    <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>Firma del SAT</b><br/>${record.custbody_mx_cfdi_sat_signature}</td>

</tr>
<tr>
    <td style="border-left: 1px;border-right: 1px; border-bottom: 1px; border-color: #e3e3e3;">
        <#if record.custbody_mx_cfdi_qr_code?has_content>
        <table align="left" style="width: 100%; margin-top: 10px;"><tr>
            <#assign qrcodeImage = "data:image/png;base64, " + record.custbody_mx_cfdi_qr_code >
            <td align="center">
                <img style="width: 100px;height:100px" src="${qrcodeImage}" /></td>
        </tr>
            <tr>
                <td align="center"></td>
            </tr></table>
    </#if>
    </td>

</tr>
</#if>
</table>
</#if>



<#if certData?has_content>
<table class="total" style="width: 100%; margin-top: 10px; border-left: 1px; border-color: #e3e3e3;"><tr>
    <td style="background-color: #e3e3e3; color: #333333;font-weight: bold;">Información CFDI</td>
</tr>
    <#if record.custbody_efx_fe_related_cfdi_json?has_content>
    <tr>
        <td style="border-left: 1px;border-right: 1px; border-color: #e3e3e3;font-size:90%;"><b>CFDI Relacionados</b><br/>${record.custbody_efx_fe_related_cfdi_json}</td>
    </tr>
</#if>
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