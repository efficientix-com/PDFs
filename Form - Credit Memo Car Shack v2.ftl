<?xml version="1.0"?>
<!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
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
        <#assign addressCancelado=''>
        <#if record.custbody_efx_fe_cancelled== true >
            <#assign addressCancelado= 'Nota de Crédito'>
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
                            <#assign address= record.custbody_efx_fe_dirloc>
                        <#else>
                            <#assign address= record.custbody_efx_fe_dirsubs>
                        </#if>

                        <td rowspan="3" style="padding: 0px; width: 33%;">
                            <span style="font-size:10px;">${address}</span>

                        </td>
                        <td align="right" style="padding: 0;">
                                        <span style="font-size: 20pt;">
                                            ${record@title}
                                        </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding: 0;">
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
            <macro id="nlfooter">
                <table class="footer" style="width: 100%;">
                    <tr>
                        <td style="font-size: 6pt; text-align:left;">
                            ESTE DOCUMENTO ES UNA REPRESENTACIÓN IMPRESA DE UN CFDI.
                        </td>
                        <td align="right">
                            <pagenumber/>
                            de
                            <totalpages/>
                        </td>
                    </tr>
                </table>
            </macro>
        </macrolist>
        <style type="text/css">
            table {
            <#if .locale == "zh_CN"> font-family: stsong, sans-serif;
            <#elseif .locale == "zh_TW"> font-family: msung, sans-serif;
            <#elseif .locale == "ja_JP"> font-family: heiseimin, sans-serif;
            <#elseif .locale == "ko_KR"> font-family: hygothic, sans-serif;
            <#elseif .locale == "ru_RU"> font-family: verdana;
            <#else> font-family: sans-serif;
            </#if> font-size: 8pt;
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
        <script>
            var w = window;
            if (w.performance || w.mozPerformance || w.msPerformance || w.webkitPerformance) {
                var d = document;
                AKSB = w.AKSB || {},
                    AKSB.q = AKSB.q || [],
                    AKSB.mark = AKSB.mark || function (e, _) {
                        AKSB
                            .q
                            .push([
                                "mark", e, _ || (new Date).getTime()
                            ])
                    },
                    AKSB.measure = AKSB.measure || function (e, _, t) {
                        AKSB
                            .q
                            .push([
                                "measure", e, _, t || (new Date).getTime()
                            ])
                    },
                    AKSB.done = AKSB.done || function (e) {
                        AKSB
                            .q
                            .push(["done", e])
                    },
                    AKSB.mark("firstbyte", (new Date).getTime()),
                    AKSB.prof = {
                        custid: "590700",
                        ustr: "",
                        originlat: "0",
                        clientrtt: "19",
                        ghostip: "189.247.214.4",
                        ipv6: false,
                        pct: "10",
                        clientip: "187.202.204.5",
                        requestid: "78e3429",
                        region: "11301",
                        protocol: "h2",
                        blver: 13,
                        akM: "x",
                        akN: "ae",
                        akTT: "O",
                        akTX: "1",
                        akTI: "78e3429",
                        ai: "384610",
                        ra: "false",
                        pmgn: "",
                        pmgi: "",
                        pmp: "",
                        qc: ""
                    },
                    function (e) {
                        var _ = d.createElement("script");
                        _.async = "async",
                            _.src = e;
                        var t = d.getElementsByTagName("script"),
                            t = t[t.length - 1];
                        t
                            .parentNode
                            .insertBefore(_, t)
                    }((
                        "https:" === d.location.protocol
                            ? "https:"
                            : "http:"
                    ) + "//ds-aksb-a.akamaihd.net/aksb.min.js")
            }
        </script>
        <script>
            var w = window;
            if (w.performance || w.mozPerformance || w.msPerformance || w.webkitPerformance) {
                var d = document;
                AKSB = w.AKSB || {},
                    AKSB.q = AKSB.q || [],
                    AKSB.mark = AKSB.mark || function (e, _) {
                        AKSB
                            .q
                            .push([
                                "mark", e, _ || (new Date).getTime()
                            ])
                    },
                    AKSB.measure = AKSB.measure || function (e, _, t) {
                        AKSB
                            .q
                            .push([
                                "measure", e, _, t || (new Date).getTime()
                            ])
                    },
                    AKSB.done = AKSB.done || function (e) {
                        AKSB
                            .q
                            .push(["done", e])
                    },
                    AKSB.mark("firstbyte", (new Date).getTime()),
                    AKSB.prof = {
                        custid: "590700",
                        ustr: "",
                        originlat: "0",
                        clientrtt: "17",
                        ghostip: "189.247.214.4",
                        ipv6: false,
                        pct: "10",
                        clientip: "187.202.204.5",
                        requestid: "7d80bed",
                        region: "11301",
                        protocol: "h2",
                        blver: 13,
                        akM: "x",
                        akN: "ae",
                        akTT: "O",
                        akTX: "1",
                        akTI: "7d80bed",
                        ai: "384610",
                        ra: "false",
                        pmgn: "",
                        pmgi: "",
                        pmp: "",
                        qc: ""
                    },
                    function (e) {
                        var _ = d.createElement("script");
                        _.async = "async",
                            _.src = e;
                        var t = d.getElementsByTagName("script"),
                            t = t[t.length - 1];
                        t
                            .parentNode
                            .insertBefore(_, t)
                    }((
                        "https:" === d.location.protocol
                            ? "https:"
                            : "http:"
                    ) + "//ds-aksb-a.akamaihd.net/aksb.min.js")
            }
        </script>
        <script>
            var w = window;
            if (w.performance || w.mozPerformance || w.msPerformance || w.webkitPerformance) {
                var d = document;
                AKSB = w.AKSB || {},
                    AKSB.q = AKSB.q || [],
                    AKSB.mark = AKSB.mark || function (e, _) {
                        AKSB
                            .q
                            .push([
                                "mark", e, _ || (new Date).getTime()
                            ])
                    },
                    AKSB.measure = AKSB.measure || function (e, _, t) {
                        AKSB
                            .q
                            .push([
                                "measure", e, _, t || (new Date).getTime()
                            ])
                    },
                    AKSB.done = AKSB.done || function (e) {
                        AKSB
                            .q
                            .push(["done", e])
                    },
                    AKSB.mark("firstbyte", (new Date).getTime()),
                    AKSB.prof = {
                        custid: "590700",
                        ustr: "",
                        originlat: "0",
                        clientrtt: "10",
                        ghostip: "189.247.214.4",
                        ipv6: false,
                        pct: "10",
                        clientip: "187.202.204.5",
                        requestid: "7da0307",
                        region: "11301",
                        protocol: "h2",
                        blver: 13,
                        akM: "x",
                        akN: "ae",
                        akTT: "O",
                        akTX: "1",
                        akTI: "7da0307",
                        ai: "384610",
                        ra: "false",
                        pmgn: "",
                        pmgi: "",
                        pmp: "",
                        qc: ""
                    },
                    function (e) {
                        var _ = d.createElement("script");
                        _.async = "async",
                            _.src = e;
                        var t = d.getElementsByTagName("script"),
                            t = t[t.length - 1];
                        t
                            .parentNode
                            .insertBefore(_, t)
                    }((
                        "https:" === d.location.protocol
                            ? "https:"
                            : "http:"
                    ) + "//ds-aksb-a.akamaihd.net/aksb.min.js")
            }
        </script>
    </head>
    <#if record.custbody_efx_fe_cancelled== true >
    <body
            background-macro="watermark"
            header="nlheader"
            header-height="15%"
            footer="nlfooter"
            footer-height="20pt"
            padding="0.5in 0.5in 0.5in 0.5in"
            size="Letter">
    <#else>
    <body
            header="nlheader"
            header-height="11%"
            footer="nlfooter"
            footer-height="20pt"
            padding="0.5in 0.5in 0.5in 0.5in"
            size="Letter">
    </#if>
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
    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <td
                    colspan="4"
                    style="font-size: 10pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); width: 25%;">Receptor:</td>
            <td
                    colspan="4"
                    style="font-size: 10pt; padding: 6px 0px 2px; font-weight: bold; color: rgb(51, 51, 51); width: 25%;">Domicilio Fiscal:</td>
            <td
                    colspan="5"
                    style="font-size: 12pt; background-color: #e3e3e3; font-weight: bold;">${record.total@label?upper_case}</td>
        </tr>
        <tr>
            <td colspan="4" style="padding: 0px; width: 25%; font-size: 8pt">${record.entity.addressee}<br/>
                <span style="font-size:10px;">
                                        <br/><strong>RFC:</strong>${record.entity.vatregnumber}</span>
            </td>
            <td colspan="4" style="padding: 0px; width: 25%; font-size: 8pt">${record.billaddress}</td>
            <td
                    align="right"
                    colspan="5"
                    style="font-size: 22pt; padding-top: 20px; background-color: #e3e3e3;">${record.total}</td>
        </tr>
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
    <#if certData?has_content>
        <table style="width: 100%; margin-top: 10px;">
            <tr>
                <th>Uso CFDI:</th>
                <th>Método de Pago:</th>
                <th>Folio Fiscal:</th>
            </tr>
            <tr>
                <td style="padding-top: 2px; font-size: 8pt; text-align:left;">${record.custbody_mx_cfdi_usage}</td>
                <td style="padding-top: 2px; font-size: 8pt">${record.custbody_mx_txn_sat_payment_term}</td>
                <td style="padding-top: 2px; font-size: 8pt">${certData.custbody_mx_cfdi_uuid}</td>
            </tr>
        </table>
    </#if>
    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <th>Tipo de Comprobante:</th>
            <th>Factura Aplicada:</th>
            <th>Fecha y Hora de Certificación:</th>
        </tr>
        <tr>
            <td style="padding-top: 2px; font-size: 8pt">
                                    <span style="background-color: rgb(255, 255, 255);">
                                        <#assign recType=record.type>
                                        <#if recType == "custinvc">
                                            <#assign recType="I - INGRESO">
                                        <#elseif recType == "custcred">
                                            <#assign recType="E - EGRESO"></#if>
                                        ${recType}
                                                </span>
            </td>
            <#assign datearray = certData.custbody_mx_cfdi_certify_timestamp?split("T")>
            <td style="padding-top: 2px; font-size: 8pt">${record.createdfrom}</td>
            <td style="padding-top: 2px; font-size: 8pt">
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

            <th width="100%">Moneda</th>

            <th width="100%">Tipo de Cambio</th>
            <th width="100%"></th>
        </tr>
        <tr>

            <td >${record.currency.symbol}</td>

            <td >${record.exchangerate?string("0.####")}</td>
            <td></td>
        </tr>
    </table>


    <!--<if item.campo?has_content></if>-->


    <#if record.custbody_efx_fe_factura_global != ''>
        <p class="nota" id="itemFacGlb" valign="middle" align="center">
            NO SE PUEDEN CARGAR ARTICULOS DE FACTURA GLOBAL.
        </p>
    <#else>
        <#if record.item?has_content>
            <table class="itemtable" style="width: 100%; margin-top: 10px;">
                <!-- start items -->
                <#list record.item as item>
                    <#if item_index==0>
                        <thead>
                        <tr>
                            <th align="center" colspan="2" style="background-color: #FBB400; color: #000;">Cant.</th>
                            <th align="left" colspan="10" style="background-color: #FBB400; color: #000;">${item.item@label}</th>
                            <th align="left" colspan="4" style="background-color: #FBB400; color: #000;">Cód. Artículo</th>
                            <th align="left" colspan="3" style="background-color: #FBB400; color: #000;">Cód. Imp.</th>

                            <th align="right" colspan="3" style="background-color: #FBB400; color: #000;">P. Unitario</th>
                            <th align="right" colspan="3" style="background-color: #FBB400; color: #000;">${item.amount@label}</th>
                            <th align="right" colspan="3" style="background-color: #FBB400; color: #000;">Impuesto</th>
                        </tr>
                        </thead>
                    </#if>
                    <#if item.custcol_efx_fe_tax_json?has_content>
                        <#assign jsonline = item.custcol_efx_fe_tax_json?eval>
                        <#assign tipoimpuesto = "">
                        <#if jsonline.ieps.name?has_content>
                            <#assign tipoimpuesto = "IEPS">
                        <#elseif jsonline.iva.name?has_content>
                            <#assign tipoimpuesto = "IVA">
                        <#elseif jsonline.retenciones.name?has_content>
                            <#assign tipoimpuesto = "RETENCIÓN">
                        <#elseif jsonline.locales.name?has_content>
                            <#assign tipoimpuesto = "LOCAL">
                        <#elseif jsonline.exento.name?has_content>
                            <#assign tipoimpuesto = "EXENTO">
                        </#if>
                    </#if>
                    <tr style="font-size:8pt;">
                        <td align="center" colspan="2" line-height="150%">${item.quantity}</td>
                        <td colspan="10">
                            <span class="itemname">Código: ${item.item}</span>
                            <br/>
                            <#if item.custcol_efx_fe_upc_code?has_content>
                                UPC: ${item.custcol_efx_fe_upc_code}
                                <br/>
                            </#if>
                            <#if item.description?has_content>
                                Descripción: ${item.description}
                                <br/>
                            </#if>
                            <#if item.custcol_efx_fe_serie_lote?has_content>
                                Serie/Lote: ${item.custcol_efx_fe_serie_lote}
                            </#if>
                        </td>
                        <td colspan="4">Clave: ${item.custcol_mx_txn_line_sat_item_code?keep_before(" ")}<br/>Unidad: ${item.units}</td>
                        <td colspan="3">Tipo: ${tipoimpuesto}<br/>Tasa: ${item.taxrate1}</td>
                        <!-- <#setting number_format='$###,###,##0.##'> -->

                        <td align="right" colspan="3">${item.rate}</td>
                        <td align="right" colspan="3">${item.amount}</td>
                        <td align="right" colspan="3">${item.tax1amt}</td>

                    </tr>
                </#list>
                <!-- end items -->
            </table>

            <hr/>
            <#if record.custbody_efx_fe_ce?has_content && record.custbody_efx_fe_ce==true >
                <span style="font-size:10px;">
                                                    <br/>
                                                    <strong>Detalle del Complemento</strong>
                                                    <br/>
                                                </span>

                <table class="itemtable" style="width: 100%; margin-top: 10px;">
                    <!-- start items -->
                    <#list record.item as item>
                        <#if item_index==0>
                            <thead>
                            <tr>
                                <!-- <th align="center" colspan="3" style="background-color: #999999; color:
                                #fff;"> Formula</th> -->
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Fracción Arancelaria</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Unidad Aduana</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Cantidad Aduana</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Valor dólares</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Valor Unitario Aduana</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Numero de Serie</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Marca</th>
                                <th align="center" colspan="3" style="background-color: #999999; color: #fff;">
                                    Modelo</th>
                            </tr>
                            </thead>
                        </#if>
                        <tr style="font-size:8pt;">
                            <!-- <td align="center" colspan="3">${item.custcol_efx_fe_ce_formula}</td> -->
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_frac_arancelaria}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_uni_aduana}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_cant_aduana}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_val_dolares}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_val_uni_aduana}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_des_numero_serie}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_des_especificas}</td>
                            <td align="center" colspan="3">${item.custcol_efx_fe_ce_des_modelo}</td>

                        </tr>
                    </#list>
                    <!-- end items -->
                </table>

                <hr/>
            </#if>
        </#if>

        <table class="total" style="width: 100%; margin-top: 1px;">
            <tr>
                <td colspan="4">&nbsp;</td>
                <td align="right">
                    <b>${record.subtotal@label}</b>
                </td>
                <td align="right">${record.subtotal}</td>
            </tr>

            <tr>
                <td colspan="4">&nbsp;</td>
                <td align="right">
                    <b>Descuento</b>
                </td>
                <td align="right">${record.discounttotal}</td>
            </tr>

            <tr>
                <td colspan="4">&nbsp;</td>
                <td align="right">
                    <b>I.V.A.</b>
                </td>
                <td align="right">${record.taxtotal}</td>
            </tr>
            <tr class="totalrow">
                <td background-color="#ffffff" colspan="4">&nbsp;</td>
                <td align="right" style="background-color: #000000; color: #fff;">
                    <strong>${record.total@label} <!--${record.currency.symbol}--></strong>
                </td>
                <td align="right" style="background-color: #000000; color: #fff;">${record.total}</td>
            </tr>

        </table>
        <#if record.custbody_efx_fe_monto_letra!=''>

            <table style="width: 100%;">
                <tr>
                    <td width="100%"></td>
                </tr>

                <tr>
                    <th width="100%">Monto</th>
                </tr>
                <tr>
                    <td >${record.custbody_efx_fe_monto_letra}</td>
                </tr>
            </table>
        </#if>
    </#if>

    <!-- <br/> -->
    <#if record.memo != ''>
        <table style="width: 100%;">
            <tr>
                <th width="100%">Observaciones</th>
            </tr>
            <tr>
                <td >${record.memo}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

    </#if>

    <#if record.custbody_efx_fe_ce_certificado_origen?has_content>
        <#assign certificado_origen=record.custbody_efx_fe_ce_certificado_origen>
    <#else>
        <#assign certificado_origen="No Funge con certificado origen">
    </#if>

    <!-- TIMBRE DEL SAT -->

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