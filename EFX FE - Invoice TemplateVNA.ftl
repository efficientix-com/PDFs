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
        <#assign "shipmentcost" = 0>
        <link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}"
              src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}"
              src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2"/>
        <#if .locale == "zh_CN">
            <link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}"
                  src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2"/>
        <#elseif .locale == "zh_TW">
            <link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}"
                  src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2"/>
        <#elseif .locale == "ja_JP">
            <link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}"
                  src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2"/>
        <#elseif .locale == "ko_KR">
            <link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}"
                  src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2"/>
        <#elseif .locale == "th_TH">
            <link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}"
                  src-bold="${nsfont.NotoSansThai_Bold}" bytes="2"/>
        </#if>
        <style type="text/css">* {
            <#if .locale == "zh_CN"> font-family: NotoSans, NotoSansCJKsc, sans-serif;
            <#elseif .locale == "zh_TW"> font-family: NotoSans, NotoSansCJKtc, sans-serif;
            <#elseif .locale == "ja_JP"> font-family: NotoSans, NotoSansCJKjp, sans-serif;
            <#elseif .locale == "ko_KR"> font-family: NotoSans, NotoSansCJKkr, sans-serif;
            <#elseif .locale == "th_TH"> font-family: NotoSans, NotoSansThai, sans-serif;
            <#else> font-family: NotoSans, sans-serif;
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

            table.tablascompletas {
                width: 100%;
                margin-top: 10px;
                border: 1px;
                border-color: #e3e3e3
            }

            td.cuerposnoarticulos {
                padding: 2px;
                font-size: 7pt;
            }

            td.cabecera, th.cabecera {
                color: #000000;
                font-size: 8pt;
                background-color: #e3e3e3;
                padding: 2px;
            }

            td {
                padding: 4px 6px;
            }

            td p {
                align: left
            }

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

            td.subtotal {
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
    <body footer="nlfooter" footer-height="11px" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    
    <table style="width: 100%; border-spacing: 0; table-layout: fixed; word-break:break-all;" cellspacing="0" cellpadding="0" > 
        <tbody> 
            <tr>  											
                <td style="width: 25%;" rowspan="6">&nbsp;</td> 
                <td style="width: 25%; align: left; vertical-align: top; font-weight:bold;" rowspan="6" font-size="8.5px"> 
                    <#if record.custbody_efx_fe_info_location_pdf == true>
                        ${record.custbody_efx_fe_dirloc}
                        <#else>
                            ${record.custbody_efx_fe_dirsubs?keep_before("EKU9003173C9")}
                            RFC: ${record.custbody_efx_fe_dirsubs?keep_after("México")}<br />
                            Régimen Fiscal: ${record.custbody_bit_fact_e_regimenfiscal?keep_before(" ")}
                    </#if>
                </td> 
        
                <td colspan="4" style="font-size: 10px; width: 40%;" align="right">
                    <table style="font-weight:bold; height:70.8pt; table-layout: fixed; word-break:break-all;" border="1" font-size="8.5px" >  
                        <tbody> 
                            <tr>
                                <td style="width: 82pt; align: right;">FACTURA</td>
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">${record.tranid} </td> 
                            </tr> 
                            <tr>  
                                <td style="width: 78pt; align: right;">Folio Fiscal</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">${certData.custbody_mx_cfdi_uuid}</td> 
                            </tr> 
                            <tr>  
                                <td style="width: 82pt; align: right;">No. Certificado SAT</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">&nbsp;${certData.custbody_mx_cfdi_sat_serial}</td> 
                            </tr> 
                            <tr>  
                                <td style="width: 82pt; align: right;">No. Certificado</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">&nbsp;${certData.custbody_mx_cfdi_issuer_serial}</td> 
                            </tr> 
                            <tr>  
                                <td style="width: 90pt; align: right;">Fecha de Expedición</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">&nbsp;${record.trandate?string.iso_nz}T00:00:00  </td> 
                            </tr> 
                            <tr>  
                                <td style="width: 100pt; align: right;">Fecha de Certificación</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">&nbsp;${certData.custbody_mx_cfdi_certify_timestamp}  </td> 
                            </tr> 
                            <tr>   
                                <td style="width: 87pt; align: right;">Expedida en</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 85pt;">${companyInformation.city} </td><!-- customCompanyInfo.city --> 
                            </tr> 
                        </tbody>  
                    </table>       
                </td>
            </tr> 
        </tbody> 
    </table> 


    <table style="width: 100%;"> 
        <tbody> 
            <tr style="width: 100%;"> 
                <td style="width: 20%;">&nbsp; Orden del Cliente: &nbsp;  ${record.otherrefnum}  </td>  
                <td style="width: 40%;">&nbsp; Pedido Interno: &nbsp;     ${record.shipcity}  </td>  
                <td style="width: 40%;">&nbsp;</td>								
            </tr> 
            <tr style="width: 100%;"> 
                <td  style="width: 20%;">&nbsp; Orden de venta:  ${record.recordcreatedby?keep_before("#")}  </td>  
                <td  style="width: 40%;">&nbsp; Representante de ventas: &nbsp;     ${record.salesrep}  </td>  	
                <td  style="width: 40%;">&nbsp; Almacen: &nbsp;     ${record.location}  </td> 							
            </tr>
        </tbody> 
    </table> 

    <table style="width: 100%; border-left:0.5px single black; border-right:0.5px single black; border-top:0.5px single black; border-bottom:0.5px single black;"> 
        <tbody> 
            <tr> 
                <td style="align: center; border-bottom:0.5px single black; border-right:0.5px single black; width: 50%;" colspan="4"> 
                <strong>&nbsp;VENDIDO A/SOLD TO</strong> 
                </td> 
                <td style="align: center; border-bottom:0.5px single black; width: 50%;" > 
                <strong>&nbsp;EMBARCADO A/SHIP TO</strong> 
                </td> 
            </tr> 

            <#if record.entity.companyname?has_content>
                <#assign customerName = record.entity.companyname>
                <#else>
                    <#assign customerName = record.entity.firstname + ' ' + record.entity.lastname>
            </#if>
            <tr> 
                <td style="align: right;  width: 15%;"><b>Nombre</b>:</td> 
                <td style="border-right:0.5px single black; width: 35%;" colspan="3">${customerName}  </td>    			
                <td style="vertical-align: top; width: 50%;" rowspan="3"> ${record.shipaddress}  </td> 	 			
            </tr>  
            <tr> 
                <td style="align: right; width: 15%;"><b>Bill Address</b>:</td> 
                <td style="border-right:0.5px single black;  width: 35%;" colspan="3">${record.billaddress}  </td>    							
            </tr> 	
            <tr> 
                <td style="align: right;  width: 15%;"><b>RFC</b>:</td>   
                <td style="border-right:0.5px single black; width: 35%;" colspan="3">${record.custbody_mx_customer_rfc}  </td>  
            </tr> 
            <tr> 
                <td style="align: right;  width: 15%;"><b>Uso CFDI</b>:</td>
                <td style="border-right:0.5px single black; width: 35%;" colspan="3">${record.custbody_mx_cfdi_usage}  </td>  
            </tr>
        </tbody> 
    </table>


    <#if record.item?has_content>
        <#assign "total_cajas" = 0>
        <#assign "total_piezas" = 0>
        <#assign "obj_cajas"= {}>
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

        <table style="width: 100%; border-left:0.5px single black; border-right:0.5px single black; border-bottom:0.5px single black;  border-top:0.5px single black;  table-layout: fixed; word-break: break-all; border-collapse: collapse; margin-top:20px;">
            <#list record.item as item>
                <tr> 
                    <td style="align: center; border-bottom:0.5px single black;" colspan="8"><b>Concepto   ${item_index+1} </b></td> 
                </tr>

                <tr style="height: 18pt;" >
                    <td style="width: 100pt; border-bottom:0.5px single black; vertical-align: middle; align: center; font-size: 10px;">   
                        <strong>ClaveProdServ</strong> 
                    </td> 
                    <td style="width: 50pt; border-bottom:0.5px single black; vertical-align: middle; align: left;">  
                        <strong>No. Parte</strong> 
                    </td> 
                    <td style="width: 50pt; border-bottom:0.5px single black; vertical-align: middle; align: center;">  
                        <strong>Cantidad</strong> 
                    </td> 
                    <td style=" border-bottom:0.5px single black; vertical-align: middle; align: left;">   
                        <strong>Unidades</strong> 
                    </td> 
                    <td style=" border-bottom:0.5px single black; vertical-align: middle; align: left;">  
                        <strong>Descripcion</strong>
                    </td> 
                    <td style="width: 100pt; border-bottom:0.5px single black; vertical-align: middle; align: left;">  
                        <strong>Impuestos</strong>
                    </td> 
                    <td style="width: 56pt; border-bottom:0.5px single black; vertical-align: middle; align: right;">  
                        <strong>Precio Unitario</strong> 
                    </td> 
                    <td style="width: 36pt; border-bottom:0.5px single black; vertical-align: middle; align: center;">  
                        <strong>Importe</strong> 
                    </td> 
                </tr>

                <tr> 
                    <td style="align: center; width: 50pt;">${item.custcol_mx_txn_line_sat_item_code?keep_before(" ")}<br/><br/></td> 
                    <td style="align: left; width: 50pt;">${item.item}<br/><br/></td> 
                    <td style="align: center; width: 50pt;">${item.quantity}<br/><br/></td> 
                    <td style="align: left; ">${item.units}<br/><br/></td> 
                    <td style="align: left; width: 140pt;">${item.description}<br/><br/></td> 
                    <td style="align: left; ">${item.custcol_bit_fact_e_impuesto} <br/>${item.custcol_bit_fact_e_tipo_factor} - ${item.custcol_bit_fact_e_tasaocuota_tras} <br/> ${item.custcol_bit_fact_e_importe_tras} ${item.taxBaseAmount} </td>
                    <td style="align: right; width: 56pt;">${item.rate?string[",##0.00"]}<br/><br/></td> 
                    <td style="align: center; width: 56pt;">${item.grossamt}<br/><br/></td> 
                </tr> 
                
                <#if item.inventorydetail?has_content>
                    <tr> 
                        <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2"><strong>Número Serial</strong></td> 
                        <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2"><strong>Número de Motor</strong></td> 
                        <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2"><strong>Pedimento</strong></td>  
                        <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;" colspan="1"><strong>Fecha Entrada</strong></td> 			
                        <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;" colspan="1"><strong>Repuve</strong></td> 
                    </tr>
                    <#assign "detalle_inventario_json" = item.custcol_efx_invdet_json + item.custcol_efx_invdet_json2 + item.custcol_efx_invdet_json3 + item.custcol_efx_invdet_json4 + item.custcol_efx_invdet_json5>
                    <#assign "detalle_inventario" = detalle_inventario_json?eval>
                    <#list detalle_inventario as detalle_inv>
                        <tr> 
                            <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2">${detalle_inv.inventorynumber}</td> 
                            <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2">${detalle_inv.num_motor}</td> 
                            <#if detalle_inv.inventorynumber?starts_with("3MU")>
                                <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2">ENSAMBLE EN MEXICO</td> 
                                <#else>
                                    <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="2">${detalle_inv.num_pedimento}</td> 
                            </#if>
                            <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;border-right:0.5px single black;" colspan="1">${detalle_inv.fecha_entrada_pedimento}</td>	
                            <td style="align: center; border-bottom:0.5px single black;border-top:0.5px single black;" colspan="1">${detalle_inv.repuve}</td> 
                        </tr>
                    </#list>
                </#if>
            </#list>
            <tr><td colspan="6"><strong>Notas:</strong><br/>${record.memo}</td></tr>
        </table>
    </#if>

    <table style="width: 100%;   border-spacing: 0; table-layout: fixed; word-break:break-all; margin-top:20px;" border="0.5px" cellspacing="0" cellpadding="0" >   
        <tbody>  
            <tr> 
                <td style="width: 60%;" rowspan="10"> 
                    <table style="width: 100%; table-layout: fixed; word-break:break-all; border-collapse:collapse; margin-top:10px; margin-left:10px; margin-bottom:10px;" cellspacing="0" cellpadding="0">  
                        <tbody> 
                            <tr> 
                                <td style="width: 100pt; align: left;">Tipo de comprobante</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 200pt; ">INGRESO  </td> 
                            </tr> 
                            <tr> 
                                <td style="width: 60pt; align: left;">M&eacute;todo de Pago</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 200pt; ">${record.custbody_mx_txn_sat_payment_term?upper_case}</td> 
                            </tr> 
                            <tr> 
                                <td style="width: 60pt; align: left;">Forma de Pago</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 200pt;">${record.custbody_mx_txn_sat_payment_method?upper_case}</td> 
                            </tr> 
                            <tr> 
                                <td style="width: 60pt; align: left;">Condiciones de Pago</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 200pt;">${record.terms}</td> 
                            </tr> 	
                            <tr> 
                                <td style="width: 60pt; align: left;">Moneda</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 200pt;">${record.currency}</td> 
                            </tr> 
                            <tr> 
                                <td style="width: 60pt; align: left;">Tipo de Cambio</td> 
                                <td style="width: 2pt;">:</td> 
                                <td style="width: 200pt;">${record.exchangerate}<br /><br /><br /></td> 
                            </tr> 
                            <tr> 
                                <td style="width: 100%; " colspan="3">${record.custbody_efx_fe_total_text} </td> 
                            </tr> 
                        </tbody> 
                    </table> 
                </td> 
                <td style="vertical-align: top;"> 
                    <br /> 
                    <table style="align: right; width: 100%; height: 70pt; border-spacing: 0; table-layout: fixed; word-break:break-all; margin-right:10px; margin-bottom:10px;" cellspacing="0" cellpadding="0"> 
                        <tbody> 
                            <#if record.discounttotal != 0 >
                                <tr> 
                                    <td style="align: right; width: 180px;"> 
                                        <strong>IMPORTE: &nbsp; &nbsp;</strong> 
                                    </td>
                                    
                                    <td style="align: right; width: 90px;border-bottom:1.5px single silver;">${record.subtotal}   </td> 
                                </tr>
                                <tr> 
                                    <td style="align: right; width: 180px;"> 
                                        <strong>DESCUENTO: &nbsp; &nbsp;</strong> 
                                    </td> 
                                    <td style="align: right; width: 90px;border-bottom:1.5px single silver;">${record.discounttotal}   </td> 
                                </tr> 
                                <tr>
                                    <td style="align: right; width: 180px;"> 
                                        <strong>SUBTOTAL: &nbsp; &nbsp;</strong> 
                                    </td> 
                                    <#assign "imp_cdesc" = record.discounttotal+record.subtotal>
                                    <td style="align: right; width: 180px;border-bottom:1.5px single silver;">$${imp_cdesc?string[",##0.00"]}   </td> 
                                </tr> 
                                <#else>
                                    <tr> 
                                        <td style="align: right; width: 180px;"> 
                                            <strong>SUBTOTAL: &nbsp; &nbsp;</strong> 
                                        </td> 
                                        <td style="align: right; width: 90px;border-bottom:1.5px single silver;">${record.subtotal}   </td> 
                                    </tr> 
                                
                            </#if>
                            <tr> 
                                <td style="align: right; width: 180px;"> 
                                    <strong>IVA 16%: &nbsp; &nbsp;</strong> 
                                </td> 
                                <td style="align: right; width: 90px; border-bottom:1.5px single silver;">${record.taxtotal}   </td> 
                            </tr> 
                            <tr> 
                                <td style="align: right; width: 180px;"> 
                                    <strong>TOTAL: &nbsp; &nbsp;</strong> 
                                </td> 
                                <td style="align: right; width: 90px;">${record.total}    </td> 
                            </tr> 
                        </tbody> 
                    </table> 
                </td> 
            </tr> 
        </tbody> 
    </table>

    <table style="width: 100%; table-layout: fixed; word-break:break-all; margin-top:20px; font-size: 6px;"> 
			<tbody> <#assign qrcodeImage = "data:image/png;base64, " + certData.custbody_mx_cfdi_qr_code >
				<tr style="height: 102pt; margin-top:2pt; margin-bottom:2pt; margin-left:2pt; margin-right:2pt;"> 
					<td style="width: 91pt; height: 122px; vertical-align: top;"><img style="width: 80px;height:80px" src="${qrcodeImage}" /></td> 
					<td style="width: 469pt; height: 122px; border-top:0.5px single black; border-bottom:0.5px single black; border-left:0.5px single black; border-right:0.5px single black;"> <div style="align: left;"> 
							<strong>CADENA ORIGINAL</strong> 
							<br />${certData.custbody_mx_cfdi_cadena_original}
						</div> 
						<div style="align: left;"> 
							<strong>SELLO DIGITAL DEL CFDI</strong> 
							<br />${certData.custbody_mx_cfdi_signature}
						</div> 
						<div style="align: left;"> 
							<strong>SELLO DEL SAT</strong> 
							<br />${certData.custbody_mx_cfdi_sat_signature}
						</div> 
					</td> 
				</tr> 
			</tbody> 
		</table> 

    <span style="margin-top:20px;">Este documento es una representación impresa de un CFDi</span>   


    </body>
</pdf>