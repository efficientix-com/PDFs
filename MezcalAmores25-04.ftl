<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <#setting locale = "es_MX">
    <#setting time_zone= "America/Mexico_City">
    <#setting number_format=",##0.00">

    <#if custom?has_content>
        <#setting locale= "es_MX">
        <#assign labels = custom.labels>

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
            <#assign dst =  currencySymbolMap[currencyCode] + value?number?string[",##0.00"]>
            <#return dst>
        </#function>
    </#if>
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
                        <td colspan="3" rowspan="3">

                            <#if record.custbody_efx_fe_logosub?has_content>
                                <#if subsidiary.logo@url?length != 0>
                                    <img height="85px" src="${subsidiary.logo@url}" style="float: left; margin: 2px" width="85px" />
                                <#elseif companyInformation.logoUrl?length != 0>
                                    <img height="85px" src="${companyInformation.logoUrl}" style="float: left; margin: 2px" width="85px" />
                                </#if>
                            </#if>

                        </td>
                        <td colspan="6" rowspan="3">
    <span class="nameandaddress" style="font-size: 9px; width: 40%;" >
      <#if record.custbody_efx_fe_info_location_pdf == true>
                        <td rowspan="3" style="padding: 0;"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin: 7px; width: 80px; height: 80px;" /> </#if>

                            <b style = "font-size:9px">Emisor: </b> <span style = "font-size:9px">${companyInformation.companyName?upper_case}

     </span>
                            <br />
                            <span style = "font-size:9px">${companyInformation.addressText?upper_case}</span>
                            <br />

                            <b style = "font-size:9px">R.F.C.: </b> <span style = "font-size:9px">${companyinformation.employerid}</span>
                        </td>
                        <#else><b>Emisor:<br /> </b>${companyInformation.companyName?upper_case}<br />${companyInformation.addressText?upper_case}<br /><b>R.F.C.: </b>${companyinformation.employerid}
                        <br />
                        </#if></span>
                        </td>
                        <td colspan="2" style="width: 21px;">&nbsp;</td>
                        <td colspan="4" style="font-size: 10px;" align="right"><span style="font-size: 12px;"><strong>ORDEN DE VENTA</strong></span><br />
                            <#if record.custbody_efx_fe_gbl_folio?has_content>
                                <span class="number" style="font-size: 18px;">${record.custbody_efx_fe_gbl_folio}</span>
                            <#else>
                                <span class="number" style="font-size: 18px;">${record.tranid}</span>
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
            table.td.cuentas{
                text-align: center;
                background-color: #e3e3e3;
                width:center;
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

    <#setting locale = "es_MX">
    <#setting time_zone= "America/Mexico_City">
    <#setting number_format=",##0.00">

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
                <td class="body" colspan="14" style="background-color: #e3e3e3; font-size:9px"><b>Lugar de entrega</b></td>
            </tr>
            <tr>
                <td colspan="14" rowspan="2" style="border: 1px; border-color: #e3e3e3; font-size:9px;">${record.custbody_efx_fe_kiosko_name}<br/>${record.billaddress?upper_case}<br/>RFC: ${record.custbody_efx_fe_kiosko_rfc?upper_case}<br/></td>
                <td></td>


                <td align="left" colspan="14" style="border: 1px; border-color: #e3e3e3; font-size:9px;">${record.billaddress?keep_after(" />")?upper_case} </td>
            </tr>
        </table>
    <#else>
        <table style="width: 100%; margin-top: 10px;"><tr>
                <td class="body" colspan="14" style="background-color: #e3e3e3; font-size:9px;"><b>Cliente</b></td>
                <td></td>
                <td class="body" colspan="14" style="background-color: #e3e3e3; font-size:9px"><b>Lugar de entrega</b></td>
            </tr>
            <tr>
                <td colspan="14" rowspan="2" style="border: 1px; border-color: #e3e3e3; font-size:9px;"><!--${record.custbody_efx_razonsocialafacturar}<br/>-->${record.billaddress?upper_case}<br/>RFC: ${record.custbody_mx_customer_rfc?upper_case}<br/></td>
                <td></td>


                <td align="left" colspan="14" style="border: 1px; border-color: #e3e3e3; font-size:9px;">${record.shipaddress?upper_case} </td>
            </tr>
        </table>
    </#if>

    <table class="body" style="width: 100%; margin-top: 9px;"><tr>
            <th colspan="3">Términos de crédito</th>
            <th colspan="3">Referencia cliente</th>
            <th colspan="3">Ubicación</th>
            <th colspan="3">${record.shipdate@label}</th>
            <th colspan="3">${record.otherrefnum@label}</th>

        </tr>
        <tr>
            <td colspan="3" style="font-size:9px;">${record.entity.terms} días</td>
            <td colspan="3" style="font-size:9px;">${record.entity?keep_before(" ")}</td>
            <td colspan="3" style="font-size:9px;">${record.location}</td>
            <td colspan="3" style="font-size:9px;">${record.shipdate}</td>
            <td colspan="3" style="font-size:9px;">${record.otherrefnum}</td>

        </tr>

    </table>

    <#if record.item?has_content>
        <#assign "line_discount"= 0>
        <#assign "importe_discount" = []>
        <#assign "descripcion_discount" = []>
        <#list record.item as item>
            <#assign "tipo_articulo" = item.item?keep_before(" ")>
            <#if item.itemtype == "Discount">
                <#assign "importe_discount" = importe_discount+ [item.grossamt]>
                <#assign "descripcion_discount" = descripcion_discount+ [item.description]>
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
                        <th align="center" colspan="2" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">#</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código</th>
                        <th align="center" colspan="5" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">UPC</th>
                        <th align="center" colspan="5" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Código<br/>Clave</th>
                        <th align="center" colspan="14" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">
                            <table style="width: 100%; margin-top: 0px; margin-bottom: 0px; border: 1px; border-color: #e3e3e3">
                                <tr>
                                    <th align="center" colspan="14" style="font-size: 5pt; padding-top: 0px; padding-bottom: 2px; padding-left: 0px; padding-right: 0px;">Descripción</th>
                                </tr>
                                <!--<tr>
                                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Base:</td>
                                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px; margin-top: 0px">Impuesto:</td>
                                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Factor:</td>
                                    <td align= "left" colspan="3" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Tasa:</td>
                                    <td align= "left" colspan="4" style="font-size: 4pt; padding-top: 0px; padding-bottom: 0px;">Importe:</td>
                                </tr>-->
                            </table></th>
                        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Clave<br/>SAT</th>
                        <th align="center" colspan="2" style="font-size: 4pt; padding-left: 0px; padding-right: 0px;">Unidad</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Cantidad</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Precio unitario<br/>sin impuesto</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Importe</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Descuento</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Impuesto</th>
                        <th align="center" colspan="4" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">Total</th>

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


                            <td align="center" colspan="2" line-height="150%" style="border-left: 0px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${line_number?string["0"]}</td>
                            <td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">${item.item?keep_before(" ")}</td>
                            <td align="center" colspan="5" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.custcol_efx_fe_upc_code}</td>
                            <td align="center" colspan="5" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding:0;">${item.custcol_mx_txn_line_sat_item_code}</td>

                            <td colspan="14" style="margin: 0; padding: 0;">
                                <table style="width: 100%">
                                    <tr>
                                        <td colspan= "14" style="border-left: 1px; border-color: #e3e3e3; font-size: 6pt; padding-right: 1px; padding-left: 1px; padding-top: 1px; padding-bottom: 0px;">${item.description}</td>
                                    </tr>

                                </table>
                            </td>


                            <#if item.units == "">
                                <#assign "units_sat" = "">

                            <#else>
                                <#if item.units == "ANT">
                                    <#assign "units_sat" = "ACT">
                                <#elseif item.units == "SRVS">
                                    <#assign "units_sat" = "ACT - Actividad">
                                <#elseif item.units == "GR">
                                    <#assign "units_sat" = "GRM">

                                <#elseif item.units == "KG">
                                    <#assign "units_sat" = "KGM">

                                <#elseif item.units == "ML">
                                    <#assign "units_sat" = "MLT">

                                <#elseif item.units == "L">
                                    <#assign "units_sat" = "LTR">

                                <#else>
                                    <#assign "units_sat" = item.units>
                                </#if>
                            </#if>




                            <td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${units_sat}</td>
                            <td align="center" colspan="2" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.units}</td>

                            <td align="center" colspan="4" line-height="150%" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.quantity}</td>
                            <td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3; font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.rate?string[",##0.00"]}</td>
                            <td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${item.amount}</td>
                            <td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${desglose.descuentoSinImpuesto?number?string[",##0.00"]}</td>
                            <td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${desglose.impuestoLineaCalculados}</td>
                            <#assign totalLineas = desglose.montoLinea?number - desglose.descuentoSinImpuesto?number + desglose.impuestoLineaCalculados?number>

                            <td align="center" colspan="4" style="border-left: 1px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px; padding-left: 0px; padding-right: 0px;">${totalLineas?string[",##0.00"]}</td>


                            <#assign "descuento_total" = descuento_total + importe_discount[item_index+1]>
                        </tr>
                    </#if>

                </#list></table>
        </#if>

        <table class="itemtable" style="width: 100%; margin-top: 3px; border: 1px; border-color: #e3e3e3;">
            <thead>
            <tr>
                <th align="left" style="font-size: 5pt; padding-left: 0px; padding-right: 0px;">
                    Descuentos aplicados
                </th>
            </tr>
            </thead>

            <tr>
                <td align="left" line-height="150%" style="border-left: 0px; border-color: #e3e3e3;font-size: 5pt; padding-top: 1px;">
                    <#--  <#assign descuentos_unicos = []>  -->
                    <#list descripcion_discount as descuento>
                        - ${descuento} <br />
                        <#--  <#assign elemento = descuento>  -->
                        <#--  <#if descuentos_unicos?seq_contains(elemento) == false>
                            <#assign descuentos_unicos = descuentos_unicos + [elemento]>
                        </#if>  -->
                    </#list>

                    <#--  <#list descuentos_unicos as descuento>
                        - ${descuento} <br />
                    </#list>  -->
                </td>
            </tr>
        </table>



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
                        <td align="left" style="border-right: 1px; border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;"><strong>Elaboró:</strong> ${record.recordcreatedby}</td>
                        <td align="left" style="border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;border-right: 0px;"><strong>Asesor:</strong> ${record.salesrep}</td>
                    </tr>
                    <tr>
                        <td align="left" style="border-right: 1px; border-bottom: 1px; border-color: #e3e3e3; font-size: 7pt;"><strong>Ubicacion:</strong> ${record.location}</td>
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
                        <td colspan= "2" style= "font-size: 7pt;border-color: #e3e3e3; border-right: 0px;"> <b>Nota: </b> ${record.memo?upper_case}</td>
                    </tr>
                </table>
            </td>
            <td colspan="2" style="margin: 0px; padding: 0;">
                <table style="width: 100%; margin-top: 0px; margin-left: 0px; border: 0px; border-color: #e3e3e3;">
                    <tr>
                        <td colspan="1" style="font-size: 7pt; border-color: #e3e3e3;border-left: 1px;"><b>Subtotal</b></td>
                        <#if record.custbody_efx_fe_gbl_subtotal?has_content>
                            <td align="right" colspan="1" style="font-size: 7pt;">${record.custbody_efx_fe_gbl_subtotal?number?string[",##0.00"]}</td>
                        <#else>
                            <#if cabecera_subtotal?has_content>
                                <td align="right" colspan="1" style="font-size: 7pt;">${cabecera_subtotal?number?string[",##0.00"]}</td>
                            <#else>
                                <td align="right" colspan="1" style="font-size: 7pt;">${record.subtotal?string[",##0.00"]}</td>
                            </#if>
                        </#if>

                    </tr>
                    <tr>
                        <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>Descuento</b></td>
                        <#if descuento_total != 0>
                            <td align="right" colspan="1" style="font-size: 7pt;"><#if desglose_total_discount?has_content>${desglose_total_discount?number?string[",##0.00"]}</#if></td>
                        <#else>
                            <#if record.discounttotal != 0>
                                <td align="right" colspan="1" style="font-size: 7pt;">${record.discounttotal}</td>
                            <#else>
                                <td align="right" colspan="1" style="font-size: 7pt;">0.00</td>
                            </#if>
                        </#if>

                    </tr>


                    <tr>
                        <#list desglose_ieps as name_ieps, price_ieps>
                            <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>${name_ieps}:</b></td>
                            <td align="right" colspan="1" style="font-size: 7pt;">${desglose_body.ieps_total?number?string[",##0.00"]}</td>
                        </#list>
                    </tr>

                    <tr>
                        <#list desglose_iva as name_iva, price_iva>
                            <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>${name_iva}:</b></td>
                            <td align="right" colspan="1" style="font-size: 7pt;">${desglose_body.iva_total?number?string[",##0.00"]}</td>
                        </#list>
                    </tr>

                    <tr>
                        <td colspan="1" style="font-size: 7pt;  border-color: #e3e3e3;border-left: 1px;"><b>Total</b></td>
                        <td align="right" colspan="1" style="font-size: 7pt;"><#if cabecera_total?has_content>${cabecera_total?number?string[",##0.00"]}</#if></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


    </body>
</pdf>