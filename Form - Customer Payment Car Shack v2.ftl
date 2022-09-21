<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <head>
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
        <#if .locale == "ru_RU">
            <link
                    name="verdana"
                    type="font"
                    subtype="opentype"
                    src="${nsfont.verdana}"
                    src-bold="${nsfont.verdana_bold}"
                    bytes="2"/>
        </#if>
        <#setting locale="en_US">
        <macrolist>
            <#assign addressCancelado=''>
            <#if record.custbody_efx_fe_cancelled== true >
                <#assign addressCancelado= 'PAGO CANCELADO'>
            </#if>

            <macro id="watermark">
                <p id="watermarkbody" rotate="-30" valign="middle" align="center" class="cancelada">
                    ${addressCancelado}
                </p>
            </macro>
            <macro id="nlheaders">
                <table style="width: 100%; font-size: 10pt;">
                    <tr>
                        <td rowspan="3" style="padding: 0px; width: 33%;">
                            <#if companyInformation.logoUrl?length != 0>
                                <img src="${companyInformation.logoUrl}" style="float: left; margin: 7px" width="140" height="70"/>
                            <#else>
                                <#if companyInformation.logoUrl?length != 0>
                                    <img src="${companyInformation.logoUrl}" style="float: left; margin: 7px" width="140" height="70"/>
                                </#if>
                            </#if>

                        </td>

                        <#assign address=''>
                        <#if record.custbody_efx_fe_info_location_pdf == true>
                            <#assign address= record.ccustbody_efx_fe_dirloc>
                        <#else>
                            <#assign address= record.custbody_efx_fe_dirsubs>
                        </#if>

                        <td rowspan="3" style="padding: 0px; width: 33%;">
                                        <span style="font-size:10px;">${address}
                                          <br/> ${address}
                                        </span>
                        </td>
                        <td align="right" style="padding: 0;">
                            <span style="font-size: 20pt;">
                                ${record@title}
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding: 2;">
                            <span style="font-size: 14pt; color: #dd0000;">
                                #${record.tranid}
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding: 4;">
                            ${record.trandate}
                        </td>
                    </tr>
                </table>
            </macro>
            <macro id="nlheader">
                <table class="header" style="width: 100%;">
                    <tr>
                        <td rowspan="3"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin: 7px" /> </#if>
                            <span class="nameandaddress"></span><br />
                            <span class="nameandaddress"></span></td>
                        <td align="right"><span class="title">${record@title}</span></td>
                    </tr>
                    <tr>
                        <td align="right"><span class="number">#${record.tranid}</span></td>
                    </tr>
                    <tr>
                        <td align="right">${record.trandate}</td>
                    </tr></table>
            </macro>
            <macro id="nlfooter">
                <table class="footer" style="width: 100%;"><tr>
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
                font-size: 8pt;
                table-layout: fixed;
            }
            th {

                font-size: 8pt;
                vertical-align: middle;
                padding: 2px 3px 3px;
                background-color: #e3e3e3;
                color: #333333;
            }
            td {
                padding: 2px 3px;
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
                padding-bottom: 5px;
                padding-top: 5px;
            }
            table.body td {
                padding-top: 3px;
            }
            table.total {
                page-break-inside: avoid;
            }
            tr.totalrow {
                background-color: #e3e3e3;
                line-height: 150%;
            }
            td.totalboxtop {
                font-size: 10pt;
                background-color: #e3e3e3;
            }
            td.addressheader {
                font-size: 8pt;
                padding-top: 6px;
                padding-bottom: 2px;
            }
            td.address {
                padding-top: 0;
            }
            td.totalboxmid {
                font-size: 24pt;
                padding-top: 18px;
                background-color: #e3e3e3;
            }
            td.totalboxbot {
                background-color: #e3e3e3;
                font-weight: bold;
            }
            span.title {
                font-size: 24pt;
            }
            span.number {
                font-size: 14pt;
            }
            span.itemname {
                font-weight: bold;
                line-height: 120%;
            }
            hr {
                width: 100%;
                color: #d3d3d3;
                background-color: #d3d3d3;
                height: 1px;
            }
            .cancelada {
                text-align: center;
                color: rgb(255, 102, 102);
                font-weight: bold;
                font-size: 100px;
                font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;

            }
            .nota{
                font-family: sans-serif;
                color:#c60a0a);

            }
        </style>
    </head>
    <#if record.custbody_efx_fe_cancelled== true >
    <body  background-macro="watermark" header="nlheaders" header-height="10%" footer="nlfooter" footer-height="10pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    <#else>
    <body header="nlheaders" header-height="10%" footer="nlfooter" footer-height="10pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    </#if>

    <!-- Total Moneda Tipo Cambio-->
    <!-- ${record.total} -->
    <!-- ${record.currency.symbol} - ${record.currency.name}${record.terms} -->
    <!-- ${record.exchangerate?string("0.####")} -->

    <!-- Total Moneda Tipo Cambio-->
    <#assign efx_total=''>
    <#assign efx_currency=''>
    <#assign efx_currency_symbol=''>
    <#assign efx_currency_name=''>
    <#assign efx_exchangerate=''>
    <#assign efx_currencyCustom=''>

    <#if record.total?has_content>
        <#assign efx_total=record.total>

    </#if>
    <#if record.currency?has_content>
        <#assign efx_currency=record.currency>

        <#if record.currency.symbol?has_content>
            <#assign efx_currency_symbol=record.currency.symbol>
        </#if>
        <#if record.currency.name?has_content>
            <#assign efx_currency_name=record.currency.name>
        </#if>


    </#if>
    <#if record.exchangerate?has_content>
        <#assign efx_exchangerate=record.exchangerate>
    </#if>

    <#if record.custbody_efx_fe_moneda?has_content>
        <#assign efx_currencyCustom=record.custbody_efx_fe_moneda>

    </#if>
    <!--  -->
    <#if efx_currencyCustom != efx_currency>
        <#if record.custbody_efx_fe_importe?has_content>
            <#assign efx_total=record.custbody_efx_fe_importe>
        </#if>

        <#if record.custbody_efx_fe_moneda?has_content>
            <#assign efx_currency=record.custbody_efx_fe_moneda>

            <#if record.custbody_efx_fe_moneda.symbol?has_content>
                <#assign efx_currency_symbol=record.custbody_efx_fe_moneda.symbol>
            </#if>
            <#if record.custbody_efx_fe_moneda.name?has_content>
                <#assign efx_currency_name=record.custbody_efx_fe_moneda.name>
            </#if>
        </#if>

        <#if record.custbody_efx_fe_tipo_cambio?has_content>
            <#assign efx_exchangerate=record.custbody_efx_fe_tipo_cambio>
        </#if>

    </#if>
    <!--  -->

    <!--  <table style="width: 100%; margin-top: 20px; padding:10px;"><tr>
		<td class="addressheader" colspan="6"><b> ${record.address@label}</b></td>
		<td class="totalboxtop" colspan="5"><b>${record.total@label?upper_case}</b></td>
		</tr>
		<tr>
		<td class="address" colspan="6">${record.address} </td>
		<td align="right" class="totalboxmid" colspan="5" >${record.total}</td>
		</tr>
	</table> -->
    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <td
                    colspan="9"
                    style="font-size: 10pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); width: 25%;">Receptor:</td>

            <td
                    colspan="3"
                    style="font-size: 12pt; background-color: #e3e3e3; font-weight: bold;">${record.total@label?upper_case}</td>
        </tr>
        <tr>
            <td colspan="9" style="padding: 0px; font-size: 8pt">${record.customer.address}<br/>
                <span style="font-size:10px;">
                    <strong>RFC:</strong>${record.customer.vatregnumber}</span>
            </td>
            <td align="right" colspan="3" style="font-size: 22pt; padding-top: 20px; background-color: #e3e3e3;">${efx_total}</td>
        </tr>
        <#if  record.custbody_efx_fe_chbx_factorage?has_content && record.custbody_efx_fe_chbx_factorage==true>
            <tr>
                <td
                        colspan="8"
                        style="font-size: 10pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51);">Comisionista:</td>

                <td
                        colspan="2"
                        style="font-size: 12pt; background-color: #e3e3e3; font-weight: bold;">Comisión:</td>
            </tr>
            <tr>
                <td colspan="8" style="padding: 0px; font-size: 8pt">
                    <#if record.custbody_csc_kiosko_direccion?has_content>
                        ${record.custbody_csc_kiosko_direccion}
                    </#if>
                    <br/>
                    <span style="font-size:10px;">
                    <strong>RFC:</strong>
                        <#if record.custbody_csc_kiosko_rfc?has_content>
                            ${record.custbody_csc_kiosko_rfc}
                        </#if>
                    </span>
                </td>
                <td align="right" colspan="2" style="font-size: 22pt; padding-top: 20px; background-color: #e3e3e3;">
                    <#if record.custbody_csc_total_factoraje?has_content>
                        ${record.custbody_csc_total_factoraje?string.currency}
                    </#if>
                </td>
            </tr>

        </#if>

    </table>


    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Lugar de Expedición:</th>
            <th>Forma de Pago:</th>
            <th>Serie/Folio:</th>
        </tr>
        <tr>
            <!-- <td style="padding-top: 2px; font-size:
                                8pt">${record.custbody_ix_fe_lugar_e}</td> -->
            <td style="padding-top: 2px; font-size: 8pt">${companyInformation.zip}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_mx_txn_sat_payment_method}</td>
            <td style="padding-top: 2px; font-size: 8pt">${record.custbody_mx_cfdi_folio}</td>
        </tr>
    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Uso CFDI:</th>
            <th>Fecha y Hora de Certificación:</th>
            <th>Folio Fiscal:</th>
        </tr>
        <tr>
            <td style="padding-top: 2px; font-size: 8pt; text-align:left;">${record.custbody_mx_cfdi_usage}</td>
            <#assign datearray = certData.custbody_mx_cfdi_certify_timestamp?split("T")>
            <td style="padding-top: 2px; font-size: 8pt">
                <#if datearray?size == 2 >
                    <#assign dayarray = datearray[0]?split("-")>
                    ${dayarray[2]}/${dayarray[1]}/${dayarray[0]} ${datearray[1]}
                <#else>
                    ${certData.custbody_mx_cfdi_certify_timestamp}
                </#if>
            </td>
            <td style="padding-top: 2px; font-size: 8pt">${certData.custbody_mx_cfdi_uuid}</td>
        </tr>
    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Tipo de Comprobante:</th>
            <th>Moneda:</th>
            <th>Tipo de Cambio:</th>
        </tr>
        <tr>
            <td style="padding-top: 2px; font-size: 8pt">
            <span style="background-color: rgb(255, 255, 255);">
                PAGO
            </span>
            </td>
            <td style="padding-top: 2px; font-size: 8pt">${efx_currency_symbol}</td>
            <td style="padding-top: 2px; font-size: 8pt">${efx_exchangerate?string("0.####")}</td>
        </tr>
    </table>
    <#if custbody_efx_fe_num_operacion?has_content || custbody_efx_fe_banco_receptor?has_content || custbody_efx_fe_rfc_banco_receptor?has_content>
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th width="100%">
                    <#if record.custbody_efx_fe_num_operacion?has_content>
                        Numero de Operacion:
                    </#if>
                </th>
                <th width="100%">
                    <#if record.custbody_efx_fe_banco_receptor?has_content>
                        Banco Receptor:
                    </#if>
                </th>
                <th width="100%">
                    <#if record.custbody_efx_fe_rfc_banco_receptor?has_content>
                        RFC Banco Receptor:
                    </#if>
                </th>

            </tr>
            <tr>
                <td>${record.custbody_efx_fe_num_operacion}</td>
                <td>${record.custbody_efx_fe_banco_receptor}</td>
                <td>${record.custbody_efx_fe_rfc_banco_receptor}</td>
            </tr>
        </table>
    </#if>

    <#if record.custbody_efx_fe_banco_emisor?has_content || record.custbody_efx_fe_cuenta_emisora?has_content || record.custbody_efx_fe_rfc_banco_emisor?has_content>
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th width="100%"><#if record.custbody_efx_fe_banco_emisor?has_content>
                        Banco Emisor:
                    </#if>
                </th>
                <th width="100%"><#if record.custbody_efx_fe_cuenta_emisora?has_content>
                        No. Cuenta Emisora:
                    </#if>
                </th>
                <th width="100%"><#if record.custbody_efx_fe_rfc_banco_emisor?has_content>
                        RFC Banco Emisor:
                    </#if>
                </th>
            </tr>
            <tr>
                <td >${record.custbody_efx_fe_banco_emisor}</td>
                <td >${record.custbody_efx_fe_cuenta_emisora}</td>
                <td >${record.custbody_efx_fe_rfc_banco_emisor}</td>
            </tr>
        </table>
    </#if>
    <#if record.custbody_efx_fe_num_operacion?has_content>
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th width="100%">Numero de Operacion:</th>
            </tr>
            <tr>
                <td >${record.custbody_efx_fe_num_operacion}</td>
            </tr>

        </table>
    </#if>



    <#if record.apply?has_content>

        <table class="itemtable" style="width: 100%; margin-top: 10px;"><!-- start apply sublist -->
            <#list record.apply as apply>
            <#if apply_index==0>
                <thead>
                <tr>
                    <th align="center" colspan="3">${apply.applydate@label}</th>
                    <th colspan="4">${apply.type@label}</th>
                    <th colspan="3">No.</th>
                    <th align="right" colspan="4">${apply.total@label}</th>
                    <th align="right" colspan="4">${apply.due@label}</th>

                    <th align="right" colspan="4">${apply.amount@label}</th>
                </tr>
                </thead>
            </#if>
            <#if apply.apply == true >
                <tr>
                    <td align="center" colspan="3" line-height="150%">${apply.applydate}</td>
                    <td colspan="4">${apply.type}</td>
                    <td colspan="3">${apply.refnum}</td>
                    <td align="right" colspan="4">${apply.total}</td>
                    <td align="right" colspan="4">${apply.due}</td>
                    <td align="right" colspan="4">${apply.amount}</td>
                </tr>
            </#if>
            </#list><!-- end apply -->
        </table>

        <hr />
    </#if>







    <table class="total" style="width: 100%; margin-top: 10px;">
        <tr class="totalrow">
            <td background-color="#ffffff" colspan="4">&nbsp;</td>
            <td align="right" style="background-color: #000000; color: #fff;font-weight:bold;">${record.total@label} ${record.currency.symbol}</td>
            <td align="right" style="background-color: #000000; color: #fff;">${efx_total}</td>
        </tr>

    </table>

    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <td align="left" valign="top" width="25%">
                <#if certData.custbody_mx_cfdi_qr_code ? has_content>
                    <#assign qrcodeImage = "data:image/png;base64, " + certData.custbody_mx_cfdi_qr_code >
                    <img style="width: 150px; height:150px" src="${qrcodeImage}" />
                </#if>
            </td>
            <td>
                <table style="width: 100%; margin-top: 10px;">
                    <tr>
                        <th>Cadena original del complemento de certificación digital del SAT</th>
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

                </table>
            </td>
        </tr>
    </table>

    <!-- tabla detalle parcialidad -->
    <#if record.custbody_efx_fe_parcialidad_json?has_content>
        <#assign parcialidadObj = record.custbody_efx_fe_parcialidad_json?eval>
        <table  style="width: 100%; margin-top: 10px;">
            <tr>
                <td align="left" valign="top" width="25%"></td>
                <th align="center" colspan="2"></th>
                <th align="center" colspan="5">CFDI Relacionados</th>
                <th align="center" colspan="2"></th>
                <#if  record.custbody_efx_fe_chbx_factorage?has_content && record.custbody_efx_fe_chbx_factorage==true>
                    <th align="center" colspan="1"></th>
                </#if>
            </tr>
            <tr>
                <td align="left" valign="top" width="25%"></td>
                <th align="center" colspan="2">Nombre</th>
                <th align="center" colspan="5">UUID</th>
                <th align="center" colspan="2">Parcialidad</th>
                <#if  record.custbody_efx_fe_chbx_factorage?has_content && record.custbody_efx_fe_chbx_factorage==true>
                    <th align="center" colspan="1">Comisión Factor</th>
                </#if>
            </tr>

            <#list parcialidadObj as invoice>
                <tr>
                    <td align="left" valign="top" width="25%"></td>
                    <td align="center" colspan="2">
                        <#if  invoice.facturaText?has_content>
                            ${invoice.facturaText}
                        </#if>
                    </td>
                    <td align="center" colspan="5">
                        <#if  invoice.uuid?has_content>
                            ${invoice.uuid}
                        </#if>
                    </td>
                    <td align="center" colspan="2">
                        <#if  invoice.parcialidad?has_content>
                            ${invoice.parcialidad}
                        </#if>
                    </td>
                    <#if  record.custbody_efx_fe_chbx_factorage?has_content && record.custbody_efx_fe_chbx_factorage==true>
                        <td align="center" colspan="1">
                            <#if  invoice.comision_factor?has_content>
                                ${invoice.comision_factor}
                            </#if>
                        </td>
                    </#if>
                </tr>
            </#list>
        </table>
    <#else>
        <#if record.custbody_efx_fe_cfdi_rel != ''>
            <table  style="width: 100%; margin-top: 10px;">
                <tr>
                    <td align="left" valign="top" width="25%"></td>
                    <th>CFDI Relacionados</th>
                </tr>
                <tr>
                    <td align="left" valign="top" width="25%"></td>
                    <td style="align: left;">${record.custbody_efx_fe_cfdi_rel}</td>
                </tr>
            </table>
        </#if>
    </#if>
    <!-- tabla detalle parcialidad -->
    </body>
</pdf>